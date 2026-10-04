"""Index-level effectiveness: does the candidate set the index returns contain
the documents a clinician/gold standard says are relevant?

Set-based precision/recall/F1 are computed here (no dependency). For ranked
metrics (MAP, nDCG, P@k) in the ranking phase use `ir-measures`; see its docs
for the qrels/run formats.

gold_queries.json format:
{"queries": [{"id": "q1", "terms": ["chest", "pain"], "mode": "phrase" | "and",
              "relevant_doc_ids": ["Z0000001", ...]}]}
"""
import json
from pathlib import Path

GOLD_DEFAULT = Path(__file__).parent / "gold_queries.json"


def load_gold(path: Path | str = GOLD_DEFAULT) -> list[dict]:
    queries = json.loads(Path(path).read_text(encoding="utf-8")).get("queries", [])
    return [q for q in queries if q.get("relevant_doc_ids")]


def run_query(index, query: dict) -> set[str]:
    if query["mode"] == "phrase":
        return index.phrase_lookup(query["terms"])
    sets = [index.lookup(t) for t in query["terms"]]
    return set.intersection(*sets) if sets else set()


def evaluate_index(index, gold: list[dict]) -> dict:
    """Macro-averaged precision/recall/F1 over the gold queries."""
    if not gold:
        return {"queries": 0, "precision": None, "recall": None, "f1": None}
    precisions, recalls = [], []
    for q in gold:
        retrieved, relevant = run_query(index, q), set(q["relevant_doc_ids"])
        hit = len(retrieved & relevant)
        precisions.append(hit / len(retrieved) if retrieved else 0.0)
        recalls.append(hit / len(relevant))
    p, r = sum(precisions) / len(gold), sum(recalls) / len(gold)
    return {"queries": len(gold), "precision": round(p, 4), "recall": round(r, 4),
            "f1": round(2 * p * r / (p + r), 4) if p + r else 0.0}
