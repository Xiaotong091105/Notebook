"""Evaluates the inverted index in isolation: build time, storage footprint,
structural correctness (against an INDEPENDENT regex oracle), vocabulary stats,
per-document add/update/delete cost, and lookup latency vs a linear scan and
SQLite FTS5.

Deliberately excludes querying (Boolean/semantic logic) and ranking
(TF-IDF/BM25/etc.) - those are evaluated in separate later phases.
Standard library only.
"""
import csv
import random
import re
import sqlite3
import sys
import time
from datetime import datetime
from pathlib import Path
from statistics import median

PROJECT_ROOT = Path(__file__).parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

from data.dataset_loader import load_documents  # noqa: E402
from indexing.inverted_index import InvertedIndex, STOPWORDS  # noqa: E402
from indexing.baseline_linear_scan import (  # noqa: E402
    linear_scan, regex_phrase_scan, regex_scan,
)

SEED = 42
CORPUS_SIZE_STEPS = [100, 500, 1000, 1500, 2000]
UPDATE_SIZE_STEPS = [100, 500, 1000, 1500]
OPS_PER_SIZE = 50
TIMING_REPEATS = 5
LATENCY_INDEX_TERMS = 100
LATENCY_SCAN_TERMS = 30
LATENCY_FTS_TERMS = 100

ABSENT_TERMS = ["lymphoma", "zzzz", "qwertyuiop", "sarcoidosis", "nonexistentterm"]
PHRASES = [
    ["chest", "pain"], ["heart", "failure"], ["abdominal", "pain"],
    ["weight", "loss"], ["urinary", "tract", "infection"],
]

# Small hand-written corpus with answers worked out by hand, to (a) validate
# the regex oracle itself and (b) catch tokenizer bugs the mock data never exercises.
TRICKY_DOCS = {
    "d1": "No chest pain. Denies fever.",
    "d2": "Chest pain on exertion; 5-FU started.",
    "d3": "Patient has AS and is on the ward.",
    "d4": "HbA1c 7.4 - CHEST PAIN resolved.",
}
TRICKY_EXPECTED = {
    "chest": {"d1", "d2", "d4"}, "pain": {"d1", "d2", "d4"}, "no": {"d1"},
    "denies": {"d1"}, "fever": {"d1"}, "5": {"d2"}, "fu": {"d2"},
    "exertion": {"d2"}, "started": {"d2"}, "7": {"d4"}, "4": {"d4"},
    "hba1c": {"d4"}, "resolved": {"d4"}, "ward": {"d3"}, "patient": {"d3"},
}


def percentile(values: list[float], pct: float) -> float:
    ordered = sorted(values)
    idx = min(len(ordered) - 1, int(round(pct / 100 * (len(ordered) - 1))))
    return ordered[idx]


def median_time(fn, repeats: int = TIMING_REPEATS) -> float:
    """One warm-up call, then the median wall time of `repeats` calls (seconds)."""
    fn()
    times = []
    for _ in range(repeats):
        start = time.perf_counter()
        fn()
        times.append(time.perf_counter() - start)
    return median(times)


def subsample(documents: dict[str, str], n: int, rng: random.Random) -> dict[str, str]:
    keys = rng.sample(list(documents.keys()), n)
    return {k: documents[k] for k in keys}


def run_scalability(documents: dict[str, str]) -> list[dict]:
    rows = []
    rng = random.Random(SEED)
    for n in CORPUS_SIZE_STEPS:
        if n > len(documents):
            continue
        corpus = subsample(documents, n, rng)
        raw_text_bytes = sum(len(t.encode("utf-8")) for t in corpus.values())

        def build():
            idx = InvertedIndex()
            idx.build(corpus)
            return idx

        build_time = median_time(build)
        index = build()
        pickle_size = index.size_on_disk()
        compact_size = index.size_on_disk_compact()
        rows.append({
            "corpus_size": n,
            "build_time_sec": round(build_time, 6),
            "raw_text_bytes": raw_text_bytes,
            "index_mem_bytes": index.size_in_memory(),
            "index_mem_bytes_with_doc_terms": index.size_in_memory(include_doc_terms=True),
            "index_disk_pickle_bytes": pickle_size,
            "index_disk_compact_bytes": compact_size,
            "ratio_pickle_vs_raw": round(pickle_size / raw_text_bytes, 4) if raw_text_bytes else None,
            "ratio_compact_vs_raw": round(compact_size / raw_text_bytes, 4) if raw_text_bytes else None,
            "vocab_size": index.vocab_size(),
        })
        print(f"  n={n:5d}  build={build_time:.4f}s  vocab={index.vocab_size():4d}  "
              f"pickle={pickle_size:7d}B  compact={compact_size:7d}B")
    return rows


def _compare(index_fn, oracle_fn, terms) -> list[dict]:
    mismatches = []
    for term in terms:
        got, want = index_fn(term), oracle_fn(term)
        if got != want:
            mismatches.append({"term": term, "index_count": len(got), "oracle_count": len(want)})
    return mismatches


def run_correctness_check(documents: dict[str, str]) -> dict:
    index = InvertedIndex()
    index.build(documents)
    vocab_terms = sorted(index.postings)
    report = {}

    # 1. Whole vocabulary vs independent regex oracle.
    mism = _compare(index.lookup, lambda t: regex_scan(documents, t), vocab_terms)
    report["vocab_terms_checked"] = len(vocab_terms)
    report["vocab_mismatches"] = len(mism)
    report["vocab_mismatch_details"] = mism

    # 2. Absent terms must return nothing (no false positives).
    report["absent_terms_checked"] = len(ABSENT_TERMS)
    report["absent_false_positives"] = sum(1 for t in ABSENT_TERMS if index.lookup(t))
    report["absent_oracle_nonempty"] = sum(1 for t in ABSENT_TERMS if regex_scan(documents, t))

    # 3. Case variants: lookup is case-insensitive, oracle on the lowercase term.
    case_mism = _compare(lambda t: index.lookup(t.upper()), lambda t: regex_scan(documents, t), vocab_terms)
    report["case_variant_mismatches"] = len(case_mism)

    # 4. Stopwords are dropped by design: index must return empty for them.
    report["stopwords_nonempty_in_index"] = sum(1 for sw in STOPWORDS if index.lookup(sw))

    # 5. Phrases: index AND-of-terms must be a SUPERSET of the adjacent-phrase
    #    oracle (no false negatives); precision shows how loose AND is.
    phrase_rows = []
    for words in PHRASES:
        candidate = set.intersection(*(index.lookup(w) for w in words))
        oracle = regex_phrase_scan(documents, words)
        phrase_rows.append({
            "phrase": " ".join(words),
            "index_and_count": len(candidate),
            "oracle_phrase_count": len(oracle),
            "missed_by_index": len(oracle - candidate),
            "precision": round(len(oracle & candidate) / len(candidate), 4) if candidate else None,
        })
    report["phrases"] = phrase_rows

    # 6. Compact on-disk format round-trips.
    report["compact_roundtrip_ok"] = (
        InvertedIndex.decode_compact(index.encode_compact()) == index.postings
    )

    # 7. Hand-worked tricky corpus: validates the oracle AND the index.
    tricky_index = InvertedIndex()
    tricky_index.build(TRICKY_DOCS)
    tricky_terms = sorted(TRICKY_EXPECTED)
    report["tricky_terms_checked"] = len(tricky_terms)
    report["tricky_index_vs_hand"] = len(_compare(tricky_index.lookup, TRICKY_EXPECTED.get, tricky_terms))
    report["tricky_oracle_vs_hand"] = len(_compare(
        lambda t: regex_scan(TRICKY_DOCS, t), TRICKY_EXPECTED.get, tricky_terms))
    report["tricky_stopword_as_empty"] = not tricky_index.lookup("as")

    # 8. Injected bug: a tokenizer that drops digits. The old check (scan using
    #    the same tokenizer) cannot see it; the independent oracle must.
    def buggy_tokenizer(text: str) -> list[str]:
        return [t for t in re.findall(r"[a-z]+", text.lower()) if t not in STOPWORDS]

    buggy_index = InvertedIndex(tokenizer=buggy_tokenizer)
    buggy_index.build(TRICKY_DOCS)

    def same_tokenizer_scan(term: str) -> set[str]:
        return {d for d, t in TRICKY_DOCS.items() if term in buggy_tokenizer(t)}

    report["injected_bug_old_check_mismatches"] = len(
        _compare(buggy_index.lookup, same_tokenizer_scan, tricky_terms))
    report["injected_bug_oracle_mismatches"] = len(
        _compare(buggy_index.lookup, lambda t: regex_scan(TRICKY_DOCS, t), tricky_terms))
    return report


def run_vocab_stats(documents: dict[str, str]) -> dict:
    index = InvertedIndex()
    index.build(documents)
    return index.vocab_stats()


def run_update_cost(documents: dict[str, str]) -> list[dict]:
    """Per-document add / replace / delete cost at several index sizes, plus a
    consistency check that the mutated index equals a from-scratch rebuild."""
    rows = []
    rng = random.Random(SEED)
    all_ids = list(documents)
    for n in UPDATE_SIZE_STEPS:
        if n + OPS_PER_SIZE > len(documents):
            continue
        order = rng.sample(all_ids, n + OPS_PER_SIZE)
        current = {k: documents[k] for k in order[:n]}
        new_docs = {k: documents[k] for k in order[n:]}
        index = InvertedIndex()
        index.build(current)

        add_ns = []
        for doc_id, text in new_docs.items():
            start = time.perf_counter_ns()
            index.add_document(doc_id, text)
            add_ns.append(time.perf_counter_ns() - start)
            current[doc_id] = text

        update_ids = rng.sample(list(current), OPS_PER_SIZE)
        update_ns = []
        for doc_id in update_ids:
            new_text = documents[rng.choice(all_ids)]
            start = time.perf_counter_ns()
            index.add_document(doc_id, new_text)  # replace path
            update_ns.append(time.perf_counter_ns() - start)
            current[doc_id] = new_text

        delete_ids = rng.sample(list(current), OPS_PER_SIZE)
        delete_ns = []
        for doc_id in delete_ids:
            start = time.perf_counter_ns()
            index.remove_document(doc_id)
            delete_ns.append(time.perf_counter_ns() - start)
            del current[doc_id]

        fresh = InvertedIndex()
        fresh.build(current)
        consistent = (
            index.postings == fresh.postings
            and index.doc_terms == fresh.doc_terms
            and index.doc_count == len(current)
        )
        rows.append({
            "index_size_before": n,
            "ops_each": OPS_PER_SIZE,
            "add_us_median": round(median(add_ns) / 1000, 2),
            "update_us_median": round(median(update_ns) / 1000, 2),
            "delete_us_median": round(median(delete_ns) / 1000, 2),
            "consistent_with_rebuild": consistent,
        })
        print(f"  n={n:5d}  add={rows[-1]['add_us_median']}us  update={rows[-1]['update_us_median']}us  "
              f"delete={rows[-1]['delete_us_median']}us  consistent={consistent}")
    return rows


def _time_call_ns(fn, inner_loops: int) -> float:
    """Average ns per call, timing `inner_loops` calls in one block."""
    start = time.perf_counter_ns()
    for _ in range(inner_loops):
        fn()
    return (time.perf_counter_ns() - start) / inner_loops


def _build_fts5(documents: dict[str, str]):
    """Contentless FTS5 table (index only, no stored text) so its size is
    comparable to an index. Returns (connection, rowid->doc_id list) or None."""
    try:
        conn = sqlite3.connect(":memory:")
        conn.execute("CREATE VIRTUAL TABLE docs USING fts5(body, content='')")
    except sqlite3.OperationalError:
        return None
    doc_ids = list(documents)
    conn.executemany(
        "INSERT INTO docs(rowid, body) VALUES (?, ?)",
        ((i, documents[d]) for i, d in enumerate(doc_ids)),
    )
    conn.commit()
    return conn, doc_ids


def run_lookup_latency(documents: dict[str, str]) -> dict:
    rng = random.Random(SEED)
    index = InvertedIndex()
    index.build(documents)
    vocab = sorted(index.postings)

    idx_terms = [rng.choice(vocab) for _ in range(LATENCY_INDEX_TERMS)]
    index_us = [_time_call_ns(lambda t=t: index.lookup(t), 200) / 1000 for t in idx_terms]

    scan_terms = rng.sample(vocab, min(LATENCY_SCAN_TERMS, len(vocab)))
    scan_us = [_time_call_ns(lambda t=t: linear_scan(documents, t), 1) / 1000 for t in scan_terms]

    result = {
        "corpus_size": len(documents),
        "index_us_p50": round(percentile(index_us, 50), 3),
        "index_us_p95": round(percentile(index_us, 95), 3),
        "scan_us_p50": round(percentile(scan_us, 50), 1),
        "scan_us_p95": round(percentile(scan_us, 95), 1),
        "speedup_p50_scan_over_index": round(percentile(scan_us, 50) / percentile(index_us, 50), 1),
        "fts5": None,
    }

    fts = _build_fts5(documents)
    if fts is not None:
        conn, doc_ids = fts
        fts_terms = [rng.choice(vocab) for _ in range(LATENCY_FTS_TERMS)]
        fts_us = [
            _time_call_ns(
                lambda t=t: conn.execute("SELECT rowid FROM docs WHERE docs MATCH ?", (f'"{t}"',)).fetchall(),
                20) / 1000
            for t in fts_terms
        ]
        agree = 0
        for t in set(fts_terms):
            rows = conn.execute("SELECT rowid FROM docs WHERE docs MATCH ?", (f'"{t}"',)).fetchall()
            if {doc_ids[r[0]] for r in rows} == index.lookup(t):
                agree += 1
        page_count = conn.execute("PRAGMA page_count").fetchone()[0]
        page_size = conn.execute("PRAGMA page_size").fetchone()[0]
        result["fts5"] = {
            "us_p50": round(percentile(fts_us, 50), 2),
            "us_p95": round(percentile(fts_us, 95), 2),
            "size_bytes": page_count * page_size,
            "terms_agreeing_with_index": agree,
            "terms_compared": len(set(fts_terms)),
        }
        conn.close()
    return result


def write_results(scalability_rows, correctness, vocab_stats, update_rows, latency):
    results_dir = PROJECT_ROOT / "evaluation" / "results"
    results_dir.mkdir(parents=True, exist_ok=True)
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")

    scalability_path = results_dir / f"inverted_index_scalability_{timestamp}.csv"
    with scalability_path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=list(scalability_rows[0].keys()))
        writer.writeheader()
        writer.writerows(scalability_rows)

    update_path = results_dir / f"inverted_index_update_cost_{timestamp}.csv"
    with update_path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=list(update_rows[0].keys()))
        writer.writeheader()
        writer.writerows(update_rows)

    summary_path = results_dir / f"inverted_index_summary_{timestamp}.txt"
    c = correctness
    with summary_path.open("w", encoding="utf-8") as f:
        f.write("INVERTED INDEX EVALUATION SUMMARY (simple version)\n")
        f.write(f"Run timestamp: {timestamp}\n\n")

        f.write("-- Structural correctness (independent regex oracle) --\n")
        f.write(f"Whole vocabulary: {c['vocab_terms_checked']} terms, {c['vocab_mismatches']} mismatches\n")
        f.write(f"Absent terms: {c['absent_terms_checked']} checked, "
                f"{c['absent_false_positives']} false positives\n")
        f.write(f"Case variants: {c['case_variant_mismatches']} mismatches\n")
        f.write(f"Stopwords non-empty in index (expected 0): {c['stopwords_nonempty_in_index']}\n")
        f.write("Phrases (index AND vs adjacent-phrase oracle):\n")
        for p in c["phrases"]:
            f.write(f"  '{p['phrase']}': AND={p['index_and_count']} phrase={p['oracle_phrase_count']} "
                    f"missed={p['missed_by_index']} precision={p['precision']}\n")
        f.write(f"Compact format round-trip OK: {c['compact_roundtrip_ok']}\n")
        f.write(f"Hand-worked tricky corpus ({c['tricky_terms_checked']} terms): "
                f"index vs hand mismatches={c['tricky_index_vs_hand']}, "
                f"oracle vs hand mismatches={c['tricky_oracle_vs_hand']}, "
                f"'as' dropped as stopword={c['tricky_stopword_as_empty']}\n")
        f.write("Injected bug (tokenizer drops digits): "
                f"old same-tokenizer check sees {c['injected_bug_old_check_mismatches']} mismatches, "
                f"independent oracle sees {c['injected_bug_oracle_mismatches']}\n\n")

        f.write("-- Vocabulary stats (full corpus) --\n")
        f.write(f"Vocab size: {vocab_stats['vocab_size']}\n")
        f.write(f"Avg postings length: {vocab_stats['avg_postings_length']:.2f}\n")
        f.write(f"Median postings length: {vocab_stats['median_postings_length']}\n")
        f.write("Top terms (term, doc_frequency):\n")
        for term, freq in vocab_stats["top_terms"]:
            f.write(f"  {term}: {freq}\n")
        f.write("\n")

        f.write("-- Per-document update cost (median microseconds) --\n")
        for r in update_rows:
            f.write(f"index size {r['index_size_before']}: add={r['add_us_median']} "
                    f"update={r['update_us_median']} delete={r['delete_us_median']} "
                    f"consistent_with_rebuild={r['consistent_with_rebuild']}\n")
        f.write("\n")

        f.write(f"-- Lookup latency ({latency['corpus_size']} docs, microseconds) --\n")
        f.write(f"Inverted index: p50={latency['index_us_p50']} p95={latency['index_us_p95']}\n")
        f.write(f"Linear scan:    p50={latency['scan_us_p50']} p95={latency['scan_us_p95']}\n")
        f.write(f"Index speedup over scan (p50): {latency['speedup_p50_scan_over_index']}x\n")
        if latency["fts5"]:
            fts = latency["fts5"]
            f.write(f"SQLite FTS5:    p50={fts['us_p50']} p95={fts['us_p95']} "
                    f"size={fts['size_bytes']}B, agrees with our index on "
                    f"{fts['terms_agreeing_with_index']}/{fts['terms_compared']} terms\n")
        else:
            f.write("SQLite FTS5: not available in this Python build\n")

    return scalability_path, update_path, summary_path


def main():
    print("Loading documents (mock dataset)...")
    documents = load_documents(profile="mock")
    print(f"Loaded {len(documents)} documents.\n")

    print("1. Build time / size scalability (median of "
          f"{TIMING_REPEATS} builds):")
    scalability_rows = run_scalability(documents)

    print("\n2. Structural correctness (independent regex oracle):")
    correctness = run_correctness_check(documents)
    print(f"  vocab mismatches={correctness['vocab_mismatches']}/{correctness['vocab_terms_checked']}  "
          f"absent false positives={correctness['absent_false_positives']}  "
          f"round-trip={correctness['compact_roundtrip_ok']}")
    print(f"  injected bug: old check={correctness['injected_bug_old_check_mismatches']} "
          f"oracle={correctness['injected_bug_oracle_mismatches']}")

    print("\n3. Vocabulary statistics (full corpus):")
    vocab_stats = run_vocab_stats(documents)
    print(f"  vocab_size={vocab_stats['vocab_size']}  "
          f"avg_postings_length={vocab_stats['avg_postings_length']:.2f}")

    print("\n4. Per-document update cost:")
    update_rows = run_update_cost(documents)

    print("\n5. Lookup latency (index vs scan vs SQLite FTS5):")
    latency = run_lookup_latency(documents)
    print(f"  index p50={latency['index_us_p50']}us  scan p50={latency['scan_us_p50']}us  "
          f"speedup={latency['speedup_p50_scan_over_index']}x  fts5={latency['fts5']}")

    paths = write_results(scalability_rows, correctness, vocab_stats, update_rows, latency)
    print("\nResults written to:\n  " + "\n  ".join(str(p) for p in paths))


if __name__ == "__main__":
    main()
