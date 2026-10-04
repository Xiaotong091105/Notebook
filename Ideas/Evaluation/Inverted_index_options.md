# Inverted Indexing Evaluation — Two Options

Context: evaluating inverted indexing for clinical IR, based on Sivarajkumar et al. (2024), "Clinical Information Retrieval: A Literature Review". The original project (`IR_Evaluation`) measured build time, size and update cost on mock data, but its correctness check shared the tokenizer with the index, it measured no lookup latency, and its mock data was too simple to say anything about clinical text. Two ways forward, each in its own folder:

- [Option 1 — Simple version](Inverted_index_simple_version/README.md): small, no setup, already fixed and run.
- [Option 2 — Complex version](Inverted_index_complex_version/README.md): recommended heavier plan, scaffolded but not run.

## Option 1 — Simple version

**Goal.** Show the index is correct, fast to look up, affordable and cheap to update, as a data structure only.

**Step-by-step.**
1. Independent regex oracle for correctness (whole vocabulary, absent terms, case, phrases, hand-worked tricky documents, injected tokenizer bug).
2. Fix memory counting; add compact delta+varint on-disk format with round-trip.
3. Replace/remove support; per-document add/replace/delete cost with a rebuild-consistency check.
4. Lookup latency vs linear scan and SQLite FTS5; median-of-5 timings; seeded sampling.

**Required resources.** Python standard library (with SQLite FTS5); mock data generated offline; under a minute to run.

**Strengths.** Runs now; trustworthy correctness check; measures lookup latency; easy to explain; no privacy risk.
**Weaknesses.** Toy data (73-term vocabulary, ≤2,000 documents); ids only (no positions/tf); untested on clinical language; no effectiveness measure, so not comparable with later phases.

**Outputs.** Scalability CSV, update-cost CSV, summary text. Latest run: 0/73 vocabulary mismatches, injected bug caught (old check 0, oracle 4), compact format ≈3× smaller than pickle, per-document add ≈20 µs / delete ≈8 µs, lookup p50 0.20 µs (index) vs 24,302 µs (scan) vs 257 µs (FTS5).

## Option 2 — Complex version (recommended)

**Goal.** Establish whether the index retrieves the right documents on realistic clinical text at scale, with a baseline later phases (rule-based, embedding) can be compared against.

**Step-by-step.**
1. Realistic data: Zipf generator → Synthea + ClinicalNoteForge notes → MIMIC-IV-Note after credentialing.
2. Positional index (positions and tf), configurable tokenizer, negation tagging (window rule, medSpaCy).
3. Benchmark: scale to 10⁵–10⁶ documents with Heaps' law fit; ids-only vs positional size; latency vs FTS5 and Pyserini/Lucene; tokenizer ablation scored on gold queries (recall/precision); negation tagger evaluation.

**Required resources.** numpy, nltk, medspacy, ir-measures, optional pyserini + Java JDK 11+; PhysioNet credentialed access for MIMIC-IV-Note; gold queries and hand-labelled negation examples; several GB RAM for large runs.

**Strengths.** Defensible, comparable results; positions stored once so later phases need no rebuild; ablation shows which preprocessing matters; reuses standard tools.
**Weaknesses.** Much more work and setup; Java/Pyserini risk on Windows; synthetic notes remain templated; gold queries on synthetic data are optimistic; scope creep into querying/ranking; pure-Python index is slow at 10⁶ documents; not yet run.

**Outputs.** Scale CSV, ablation CSV, summary JSON (Heaps' k/β, latency p50/p95 per system, negation precision/recall).

## Recommendation

Use Option 1 as the finished baseline and move to Option 2 in stages: Zipf/Synthea data and gold queries first, then positions and the tokenizer ablation, and Pyserini, medSpaCy and MIMIC-IV-Note last (apply for MIMIC access now, since it takes time).
