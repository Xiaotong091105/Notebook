"""A from-scratch inverted index for free-text clinical records.

Evaluated here purely as a data structure: construction cost, storage
footprint, structural correctness, and update cost. No query parsing or
ranking logic lives here (see evaluation/benchmark_inverted_index.py).
"""
import pickle
import re
import sys
from statistics import mean, median

# Negation terms are deliberately kept (not treated as stopwords) because
# clinical text relies on them for meaning, e.g. "no chest pain" vs "chest pain"
# (see Clinical IR literature review, Section 5.3.3, "Query Methods" / negation).
NEGATION_TERMS = {"no", "not", "without", "denies", "denied"}

STOPWORDS = {
    "a", "an", "the", "is", "are", "was", "were", "be", "been", "being",
    "of", "in", "on", "at", "for", "to", "and", "or", "with", "as", "by",
    "this", "that", "it", "has", "have", "had",
} - NEGATION_TERMS

_TOKEN_RE = re.compile(r"[a-z0-9]+")


def tokenize(text: str) -> list[str]:
    tokens = _TOKEN_RE.findall(text.lower())
    return [t for t in tokens if t not in STOPWORDS]


# ---- variable-length integer helpers (used by the compact on-disk format) ----

def _write_varint(buf: bytearray, n: int) -> None:
    while n >= 0x80:
        buf.append((n & 0x7F) | 0x80)
        n >>= 7
    buf.append(n)


def _read_varint(data: bytes, pos: int) -> tuple[int, int]:
    result = shift = 0
    while True:
        b = data[pos]
        pos += 1
        result |= (b & 0x7F) << shift
        if not b & 0x80:
            return result, pos
        shift += 7


class InvertedIndex:
    def __init__(self, tokenizer=tokenize):
        self.tokenizer = tokenizer
        self.postings: dict[str, set[str]] = {}
        # doc_id -> terms it contributed; lets us remove/replace a document
        # without scanning every posting list.
        self.doc_terms: dict[str, set[str]] = {}
        self.doc_count: int = 0

    def build(self, documents: dict[str, str]) -> None:
        self.postings = {}
        self.doc_terms = {}
        self.doc_count = 0
        for doc_id, text in documents.items():
            self.add_document(doc_id, text)

    def add_document(self, doc_id: str, text: str) -> None:
        """Adds a document; if doc_id is already indexed it is replaced."""
        if doc_id in self.doc_terms:
            self.remove_document(doc_id)
        terms = set(self.tokenizer(text))
        self.doc_terms[doc_id] = terms
        for term in terms:
            self.postings.setdefault(term, set()).add(doc_id)
        self.doc_count = len(self.doc_terms)

    def remove_document(self, doc_id: str) -> bool:
        terms = self.doc_terms.pop(doc_id, None)
        if terms is None:
            return False
        for term in terms:
            docs = self.postings[term]
            docs.discard(doc_id)
            if not docs:
                del self.postings[term]
        self.doc_count = len(self.doc_terms)
        return True

    def lookup(self, term: str) -> set[str]:
        return self.postings.get(term.lower(), set())

    def vocab_size(self) -> int:
        return len(self.postings)

    def vocab_stats(self) -> dict:
        lengths = [len(v) for v in self.postings.values()]
        if not lengths:
            return {"vocab_size": 0, "avg_postings_length": 0, "median_postings_length": 0, "top_terms": []}
        top_terms = sorted(self.postings.items(), key=lambda kv: len(kv[1]), reverse=True)[:10]
        return {
            "vocab_size": len(self.postings),
            "avg_postings_length": mean(lengths),
            "median_postings_length": median(lengths),
            "top_terms": [(term, len(docs)) for term, docs in top_terms],
        }

    def size_in_memory(self, include_doc_terms: bool = False) -> int:
        """Approximate deep size in bytes of the postings structure.

        Each distinct object is counted once: doc_id strings are shared
        between posting lists, so counting them per posting would overstate
        memory. Set include_doc_terms=True to add the reverse doc->terms map
        that makes update/delete cheap.
        """
        seen: set[int] = set()

        def sz(obj) -> int:
            key = id(obj)
            if key in seen:
                return 0
            seen.add(key)
            return sys.getsizeof(obj)

        total = sz(self.postings)
        for term, docs in self.postings.items():
            total += sz(term) + sz(docs)
            total += sum(sz(d) for d in docs)
        if include_doc_terms:
            total += sz(self.doc_terms)
            for doc_id, terms in self.doc_terms.items():
                total += sz(doc_id) + sz(terms)
        return total

    def size_on_disk(self) -> int:
        """Size in bytes if the postings were pickled (naive format)."""
        return len(pickle.dumps(self.postings, protocol=pickle.HIGHEST_PROTOCOL))

    def encode_compact(self) -> bytes:
        """Compact on-disk format: doc-id table, then per term a sorted,
        delta-encoded posting list of integer doc ids, all varint-packed."""
        doc_ids = sorted(self.doc_terms)
        id_to_int = {d: i for i, d in enumerate(doc_ids)}
        buf = bytearray()
        _write_varint(buf, len(doc_ids))
        for d in doc_ids:
            raw = d.encode("utf-8")
            _write_varint(buf, len(raw))
            buf += raw
        _write_varint(buf, len(self.postings))
        for term in sorted(self.postings):
            raw = term.encode("utf-8")
            _write_varint(buf, len(raw))
            buf += raw
            ids = sorted(id_to_int[d] for d in self.postings[term])
            _write_varint(buf, len(ids))
            prev = 0
            for i in ids:
                _write_varint(buf, i - prev)
                prev = i
        return bytes(buf)

    def size_on_disk_compact(self) -> int:
        return len(self.encode_compact())

    @staticmethod
    def decode_compact(data: bytes) -> dict[str, set[str]]:
        """Inverse of encode_compact; returns the postings dict."""
        pos = 0
        n_docs, pos = _read_varint(data, pos)
        doc_ids = []
        for _ in range(n_docs):
            length, pos = _read_varint(data, pos)
            doc_ids.append(data[pos:pos + length].decode("utf-8"))
            pos += length
        n_terms, pos = _read_varint(data, pos)
        postings = {}
        for _ in range(n_terms):
            length, pos = _read_varint(data, pos)
            term = data[pos:pos + length].decode("utf-8")
            pos += length
            n_ids, pos = _read_varint(data, pos)
            prev = 0
            docs = set()
            for _ in range(n_ids):
                delta, pos = _read_varint(data, pos)
                prev += delta
                docs.add(doc_ids[prev])
            postings[term] = docs
        return postings
