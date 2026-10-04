"""Offline fallback corpus with realistic statistics: Zipfian word frequencies
(so vocabulary keeps growing with corpus size), clinical abbreviations,
misspellings and negation phrases. Synthetic only - no patient data.

Also writes data/generated/zipf_gold_queries.json: term queries whose relevant
documents are known by construction (the planted concept appears un-negated).

    python data/zipf_generator.py --docs 100000
"""
import argparse
import csv
import json
import random
from bisect import bisect_left
from itertools import accumulate
from pathlib import Path

OUT_DIR = Path(__file__).parent / "generated"

CONCEPTS = [
    "chest pain", "shortness of breath", "fatigue", "dizziness", "nausea", "fever",
    "cough", "headache", "abdominal pain", "palpitations", "weight loss", "rash",
    "hypertension", "diabetes", "heart failure", "pneumonia", "anaemia", "asthma",
]
ABBREVIATIONS = {"hypertension": "HTN", "diabetes": "T2DM", "heart failure": "HF",
                 "shortness of breath": "SOB", "chest pain": "CP"}
NEGATION_CUES = ["no", "denies", "without", "no evidence of", "negative for", "ruled out"]
FILLER_STEM = "term"


def _misspell(word: str, rng: random.Random) -> str:
    if len(word) < 5:
        return word
    i = rng.randrange(1, len(word) - 1)
    return word[:i] + word[i + 1:]  # drop one letter


def build_zipf_sampler(vocab_size: int, s: float = 1.07):
    weights = [1 / (rank ** s) for rank in range(1, vocab_size + 1)]
    cumulative = list(accumulate(weights))
    total = cumulative[-1]
    return lambda rng: bisect_left(cumulative, rng.random() * total)


def generate(n_docs: int, vocab_size: int = 20000, seed: int = 42,
             abbrev_rate: float = 0.3, typo_rate: float = 0.03, negation_rate: float = 0.3):
    rng = random.Random(seed)
    sample_rank = build_zipf_sampler(vocab_size)
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    relevant: dict[str, set[str]] = {c: set() for c in CONCEPTS}

    with (OUT_DIR / "zipf_notes.csv").open("w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["doc_id", "text"])
        for i in range(n_docs):
            doc_id = f"Z{i:07d}"
            sentences = []
            for _ in range(rng.randint(3, 10)):
                words = [f"{FILLER_STEM}{sample_rank(rng)}" for _ in range(rng.randint(5, 14))]
                if rng.random() < 0.6:
                    concept = rng.choice(CONCEPTS)
                    negated = rng.random() < negation_rate
                    surface = concept
                    if concept in ABBREVIATIONS and rng.random() < abbrev_rate:
                        surface = ABBREVIATIONS[concept]
                    if rng.random() < typo_rate:
                        surface = " ".join(_misspell(w, rng) for w in surface.split())
                    phrase = f"{rng.choice(NEGATION_CUES)} {surface}" if negated else surface
                    if not negated and surface == concept:
                        relevant[concept].add(doc_id)
                    words.insert(rng.randrange(len(words) + 1), phrase)
                sentences.append(" ".join(words).capitalize())
            writer.writerow([doc_id, ". ".join(sentences) + "."])

    gold = {"_comment": "relevant = concept written in full and not negated. Abbreviated, misspelled or negated mentions are deliberately NOT relevant for the full-form query.",
            "queries": [{"id": f"q{i}", "terms": c.split(), "mode": "phrase",
                         "relevant_doc_ids": sorted(docs)}
                        for i, (c, docs) in enumerate(relevant.items()) if docs]}
    (OUT_DIR / "zipf_gold_queries.json").write_text(json.dumps(gold, indent=1), encoding="utf-8")
    print(f"Wrote {n_docs} docs and {len(gold['queries'])} gold queries to {OUT_DIR}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--docs", type=int, default=10000)
    parser.add_argument("--vocab", type=int, default=20000)
    parser.add_argument("--seed", type=int, default=42)
    args = parser.parse_args()
    generate(args.docs, args.vocab, args.seed)
