"""Positional inverted index: term -> {doc_id -> [token positions]}.

Term frequency is len(positions), so phrase queries, negation scope and BM25 in
later phases need no rebuild. A set-style `lookup` is kept so results are
comparable with the simple version, and `size_*` report both an "ids only"
projection and the full positional size.
"""
import sys

from indexing.tokenizer import TokenizerConfig, make_tokenizer


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


class PositionalIndex:
    def __init__(self, config: TokenizerConfig | None = None):
        self.config = config or TokenizerConfig()
        self.tokenizer = make_tokenizer(self.config)
        self.postings: dict[str, dict[str, list[int]]] = {}
        self.doc_terms: dict[str, set[str]] = {}
        self.doc_lengths: dict[str, int] = {}
        self.total_tokens = 0

    # ---- construction / update ----
    def build(self, documents: dict[str, str]) -> None:
        self.postings, self.doc_terms, self.doc_lengths, self.total_tokens = {}, {}, {}, 0
        for doc_id, text in documents.items():
            self.add_document(doc_id, text)

    def add_document(self, doc_id: str, text: str) -> None:
        if doc_id in self.doc_terms:
            self.remove_document(doc_id)
        tokens = self.tokenizer(text)
        for pos, term in enumerate(tokens):
            self.postings.setdefault(term, {}).setdefault(doc_id, []).append(pos)
        self.doc_terms[doc_id] = set(tokens)
        self.doc_lengths[doc_id] = len(tokens)
        self.total_tokens += len(tokens)

    def remove_document(self, doc_id: str) -> bool:
        terms = self.doc_terms.pop(doc_id, None)
        if terms is None:
            return False
        for term in terms:
            docs = self.postings[term]
            del docs[doc_id]
            if not docs:
                del self.postings[term]
        self.total_tokens -= self.doc_lengths.pop(doc_id)
        return True

    # ---- querying (index-level primitives only; no ranking) ----
    def lookup(self, term: str) -> set[str]:
        return set(self.postings.get(self._norm(term), {}))

    def term_frequency(self, term: str, doc_id: str) -> int:
        return len(self.postings.get(self._norm(term), {}).get(doc_id, ()))

    def phrase_lookup(self, words: list[str]) -> set[str]:
        """Documents where the (normalised) words occur at consecutive positions."""
        terms = [t for w in words for t in self.tokenizer(w)]
        if not terms:
            return set()
        candidates = set.intersection(*(set(self.postings.get(t, {})) for t in terms))
        hits = set()
        for doc_id in candidates:
            starts = set(self.postings[terms[0]][doc_id])
            for offset, term in enumerate(terms[1:], start=1):
                starts &= {p - offset for p in self.postings[term][doc_id]}
                if not starts:
                    break
            if starts:
                hits.add(doc_id)
        return hits

    def _norm(self, term: str) -> str:
        tokens = self.tokenizer(term)
        return tokens[0] if tokens else term.lower()

    # ---- statistics and sizes ----
    def vocab_size(self) -> int:
        return len(self.postings)

    def size_in_memory(self, positions: bool = True) -> int:
        """Deep size, each distinct object counted once. positions=False
        projects the 'ids only' index (set of doc ids per term)."""
        seen: set[int] = set()

        def sz(obj) -> int:
            if id(obj) in seen:
                return 0
            seen.add(id(obj))
            return sys.getsizeof(obj)

        total = sz(self.postings)
        for term, docs in self.postings.items():
            total += sz(term)
            if positions:
                total += sz(docs)
                for doc_id, plist in docs.items():
                    total += sz(doc_id) + sz(plist) + sum(sz(p) for p in plist)
            else:
                total += sys.getsizeof(set(docs)) + sum(sz(d) for d in docs)
        return total

    def encode_compact(self, positions: bool = True) -> bytes:
        """Delta + varint encoding. positions=False stores doc ids only."""
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
            docs = sorted((id_to_int[d], plist) for d, plist in self.postings[term].items())
            _write_varint(buf, len(docs))
            prev = 0
            for did, plist in docs:
                _write_varint(buf, did - prev)
                prev = did
                if positions:
                    _write_varint(buf, len(plist))
                    p_prev = 0
                    for p in plist:
                        _write_varint(buf, p - p_prev)
                        p_prev = p
        return bytes(buf)

    def size_on_disk_compact(self, positions: bool = True) -> int:
        return len(self.encode_compact(positions))

    @staticmethod
    def decode_compact(data: bytes, positions: bool = True) -> dict[str, dict[str, list[int]]]:
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
            n_posts, pos = _read_varint(data, pos)
            did, docs = 0, {}
            for _ in range(n_posts):
                delta, pos = _read_varint(data, pos)
                did += delta
                plist = []
                if positions:
                    count, pos = _read_varint(data, pos)
                    p = 0
                    for _ in range(count):
                        d, pos = _read_varint(data, pos)
                        p += d
                        plist.append(p)
                docs[doc_ids[did]] = plist
            postings[term] = docs
        return postings
