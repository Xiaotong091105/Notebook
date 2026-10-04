"""Complex-version benchmark: scale curve with Heaps' law fit, ids-only vs
positional size, lookup latency vs SQLite FTS5 (and Pyserini if available),
tokenizer ablation with gold-query recall/precision, and optional negation
tagger evaluation.

    python evaluation/benchmark_complex.py --profile zipf --sizes 1000,10000,100000

NOT RUN as part of scaffolding. Generate/obtain data first (docs/setup.md).
"""
import argparse
import csv
import json
import math
import random
import re
import sys
import time
from datetime import datetime
from pathlib import Path
from statistics import median

PROJECT_ROOT = Path(__file__).parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

from data.dataset_loader import load_documents  # noqa: E402
from evaluation.effectiveness import GOLD_DEFAULT, evaluate_index, load_gold  # noqa: E402
from evaluation.reference_systems import FTS5Reference, PyseriniReference  # noqa: E402
from indexing.negation import window_negated_positions  # noqa: E402
from indexing.positional_index import PositionalIndex  # noqa: E402
from indexing.tokenizer import ABLATION_CONFIGS, TokenizerConfig  # noqa: E402

SEED = 42
TIMING_REPEATS = 3
ABLATION_DOCS = 20000
NEGATION_LABELS = PROJECT_ROOT / "data" / "negation_labels.json"


def percentile(values, pct):
    ordered = sorted(values)
    return ordered[min(len(ordered) - 1, int(round(pct / 100 * (len(ordered) - 1))))]


def median_time(fn, repeats=TIMING_REPEATS):
    times = []
    for _ in range(repeats):
        start = time.perf_counter()
        fn()
        times.append(time.perf_counter() - start)
    return median(times)


def fit_heaps(points: list[tuple[int, int]]) -> dict:
    """Least-squares fit of log V = log k + beta * log N over (tokens, vocab)."""
    pts = [(math.log(n), math.log(v)) for n, v in points if n > 0 and v > 0]
    if len(pts) < 2:
        return {"k": None, "beta": None}
    mx, my = sum(x for x, _ in pts) / len(pts), sum(y for _, y in pts) / len(pts)
    sxx = sum((x - mx) ** 2 for x, _ in pts)
    beta = sum((x - mx) * (y - my) for x, y in pts) / sxx if sxx else float("nan")
    return {"k": round(math.exp(my - beta * mx), 3), "beta": round(beta, 4)}


def subsample(documents, n, rng):
    keys = rng.sample(list(documents), min(n, len(documents)))
    return {k: documents[k] for k in keys}


def run_scale(documents, sizes):
    rng, rows = random.Random(SEED), []
    for n in sizes:
        if n > len(documents):
            print(f"  skipping n={n}: only {len(documents)} documents")
            continue
        corpus = subsample(documents, n, rng)
        index = PositionalIndex()
        build_time = median_time(lambda: PositionalIndex().build(corpus))
        index.build(corpus)
        rows.append({
            "docs": n, "tokens": index.total_tokens, "vocab": index.vocab_size(),
            "build_sec": round(build_time, 4),
            "mem_ids_only": index.size_in_memory(positions=False),
            "mem_positional": index.size_in_memory(positions=True),
            "disk_ids_only": index.size_on_disk_compact(positions=False),
            "disk_positional": index.size_on_disk_compact(positions=True),
        })
        print(f"  docs={n}  tokens={rows[-1]['tokens']}  vocab={rows[-1]['vocab']}  "
              f"build={build_time:.2f}s  disk(ids/pos)={rows[-1]['disk_ids_only']}/{rows[-1]['disk_positional']}")
    return rows, fit_heaps([(r["tokens"], r["vocab"]) for r in rows])


def run_latency(documents, use_pyserini):
    rng = random.Random(SEED)
    index = PositionalIndex()
    index.build(documents)
    terms = [rng.choice(list(index.postings)) for _ in range(200)]

    def us(fn, loops):
        start = time.perf_counter_ns()
        for _ in range(loops):
            fn()
        return (time.perf_counter_ns() - start) / loops / 1000

    result = {"docs": len(documents),
              "ours_us": [us(lambda t=t: index.lookup(t), 5) for t in terms]}
    fts = FTS5Reference(documents)
    result["fts5_us"] = [us(lambda t=t: fts.search(t), 5) for t in terms]
    result["fts5_bytes"] = fts.size_bytes()
    result["agree_fts5"] = sum(index.lookup(t) == fts.search(t) for t in terms[:50])
    if use_pyserini:
        try:
            lucene = PyseriniReference(documents)
            result["lucene_us"] = [us(lambda t=t: lucene.search(t), 3) for t in terms[:100]]
            result["lucene_bytes"] = lucene.size_bytes()
        except RuntimeError as exc:
            result["lucene_error"] = str(exc)
    return {k: ({"p50": round(percentile(v, 50), 2), "p95": round(percentile(v, 95), 2)}
                if k.endswith("_us") else v) for k, v in result.items()}


def run_ablation(documents, gold):
    corpus = subsample(documents, ABLATION_DOCS, random.Random(SEED))
    rows = []
    for config in ABLATION_CONFIGS:
        index = PositionalIndex(config)
        index.build(corpus)
        rows.append({"config": config.name, "vocab": index.vocab_size(),
                     "disk_positional": index.size_on_disk_compact(),
                     **evaluate_index(index, gold)})
        print(f"  {rows[-1]}")
    return rows


def run_negation_eval():
    """Term-level precision/recall of the window tagger on hand labels:
    {"examples": [{"text": "...", "negated_terms": ["fever", ...]}]}."""
    if not NEGATION_LABELS.exists():
        return None
    examples = json.loads(NEGATION_LABELS.read_text(encoding="utf-8"))["examples"]
    tp = fp = fn = 0
    for ex in examples:
        tokens = re.findall(r"[a-z0-9]+", ex["text"].lower())
        predicted = {tokens[i] for i in window_negated_positions(ex["text"]) if i < len(tokens)}
        expected = set(ex["negated_terms"])
        tp += len(predicted & expected)
        fp += len(predicted - expected)
        fn += len(expected - predicted)
    return {"examples": len(examples),
            "precision": round(tp / (tp + fp), 4) if tp + fp else None,
            "recall": round(tp / (tp + fn), 4) if tp + fn else None}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--profile", default="zipf", choices=["zipf", "synthea_notes", "mimic_note"])
    parser.add_argument("--sizes", default="1000,10000,100000")
    parser.add_argument("--gold", default=str(GOLD_DEFAULT))
    parser.add_argument("--pyserini", action="store_true", help="also benchmark Lucene (needs Java)")
    args = parser.parse_args()
    sizes = [int(s) for s in args.sizes.split(",")]

    print(f"Loading profile '{args.profile}'...")
    documents = load_documents(args.profile, limit=max(sizes))
    print(f"Loaded {len(documents)} documents.\n")
    gold = load_gold(args.gold)

    print("1. Scale curve and Heaps' law:")
    scale_rows, heaps = run_scale(documents, sizes)
    print(f"  Heaps' law fit: {heaps}")

    print("\n2. Lookup latency vs references (largest size):")
    latency = run_latency(subsample(documents, max(sizes), random.Random(SEED)), args.pyserini)
    print(f"  {latency}")

    print(f"\n3. Tokenizer ablation ({len(gold)} gold queries):")
    ablation = run_ablation(documents, gold)

    print("\n4. Negation tagger:")
    negation = run_negation_eval()
    print(f"  {negation if negation else 'no data/negation_labels.json; skipped'}")

    out = PROJECT_ROOT / "evaluation" / "results"
    out.mkdir(parents=True, exist_ok=True)
    stamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    for name, rows in (("scale", scale_rows), ("ablation", ablation)):
        if rows:
            with (out / f"complex_{name}_{stamp}.csv").open("w", newline="", encoding="utf-8") as f:
                writer = csv.DictWriter(f, fieldnames=list(rows[0]))
                writer.writeheader()
                writer.writerows(rows)
    (out / f"complex_summary_{stamp}.json").write_text(
        json.dumps({"profile": args.profile, "heaps": heaps, "latency": latency,
                    "negation": negation}, indent=1), encoding="utf-8")
    print(f"\nResults written to {out}")


if __name__ == "__main__":
    main()
