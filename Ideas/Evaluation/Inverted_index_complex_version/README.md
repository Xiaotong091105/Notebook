# Inverted Index Evaluation — Complex Version (Option 2, recommended)

Heavier evaluation of inverted indexing for clinical IR, following Sivarajkumar et al. (2024). It fixes the simple version's structural limits: realistic data and scale, positional postings, a tokenizer ablation, a real reference system, and an effectiveness measure that later phases can share.

**Status: scaffold. The code is written but has not been run, and no dependencies or data have been installed or downloaded.** Only a syntax compile and a tiny smoke test of the stdlib-only parts (positional index, phrase lookup, compact-format round-trip, window negation) were performed. Expect to debug on first run, especially the optional medSpaCy and Pyserini paths (written from their documented APIs, untested here).

The runnable, already-verified baseline is `../Inverted_index_simple_version/`.

## 1) Goal

Move from "the index is correct and cheap on toy data" to "the index retrieves the right documents on realistic clinical text, at scale, and is comparable with what comes next". Questions:
- How do vocabulary, size and build time scale to 10⁵–10⁶ documents (Heaps' law)?
- What does storing positions cost, and what does it buy (phrase queries, term frequency)?
- Which preprocessing choices (stopwords, stemming, abbreviation expansion, hyphen/decimal handling) change recall and precision?
- How does lookup compare with SQLite FTS5 and Lucene (Pyserini)?
- Can index-time negation tagging separate "no chest pain" from "chest pain"?

## 2) Step-by-step (how)

1. **Data** (`data/`): `zipf_generator.py` (Zipfian vocabulary, abbreviations, misspellings, negation; emits gold queries) → Synthea + ClinicalNoteForge notes → MIMIC-IV-Note after credentialing. `dataset_loader.py` + `schema_config.json` select the profile.
2. **Index** (`indexing/`): `positional_index.py` (term → doc → positions, add/replace/delete, phrase lookup, ids-only vs positional size, compact encoding), `tokenizer.py` (configurable), `negation.py` (window rule; medSpaCy ConText).
3. **Evaluation** (`evaluation/benchmark_complex.py`):
   - scale curve and Heaps' law fit;
   - lookup latency vs SQLite FTS5 (`reference_systems.py`) and optionally Pyserini;
   - tokenizer ablation scored with `effectiveness.py` against `gold_queries.json`;
   - negation tagger precision/recall on hand labels.
4. Results go to `evaluation/results/` (git-ignored).

Run instructions and data access steps: `docs/setup.md`.

## 3) Required resources

- Python packages in `requirements.txt` (numpy, nltk, medspacy, ir-measures, ir_datasets, optional pyserini).
- Java JDK 11+ for Pyserini only (optional; SQLite FTS5 works without).
- Data: Zipf fallback needs nothing; Synthea needs its generator; MIMIC-IV-Note needs PhysioNet credentialed access, CITI training and a signed DUA (takes time — apply early).
- Memory/time: a 10⁶-document run needs several GB of RAM in pure Python; cap with `--sizes` if needed.
- Hand-labelled negation examples and clinician-reviewed gold queries for real data.

## 4) Strengths and weaknesses

**Strengths**
- Defensible results: realistic scale, an independent reference system, a measured effectiveness metric.
- Positions and term frequencies stored now, so phrase queries, negation scope and BM25 do not force a rebuild.
- Tokenizer ablation shows which preprocessing choices matter for clinical text.
- The same gold queries and metrics can score the rule-based and embedding phases.
- Reuses standard components (Lucene, SQLite FTS5, medSpaCy) instead of re-implementing them.

**Weaknesses**
- Much more setup and code; nothing in this folder has been run.
- Heavy dependencies (Java, spaCy models); Pyserini may not install cleanly on Windows.
- Synthea and Zipf notes are still templated/synthetic; realistic text needs MIMIC-IV-Note access.
- Gold queries from synthetic data are true by construction, so recall there is optimistic; real-data judgments need clinician time.
- Scope-creep risk: negation tagging and gold-query building are projects in their own right, and some work overlaps the later querying/ranking phases.
- Pure-Python index will be slow and memory-hungry at 10⁶ documents.

## 5) Outputs

- `complex_scale_<ts>.csv`: docs, tokens, vocabulary, build time, ids-only vs positional memory and compact disk size.
- `complex_ablation_<ts>.csv`: per tokenizer configuration, vocabulary, size, gold-query precision/recall/F1.
- `complex_summary_<ts>.json`: Heaps' law parameters (k, β), lookup latency p50/p95 for our index, FTS5 and Lucene (if run), agreement counts, negation tagger precision/recall.

## 6) How to interpret

- **Heaps' law β** (typically about 0.4–0.6 for natural text): vocabulary growing with corpus size is the signature of real text; a flat curve means the data is too regular.
- **Positional vs ids-only size:** the ratio is the price of phrase queries and tf. If it is acceptable, keep positions.
- **Latency vs FTS5/Lucene:** a pure-Python dict will not beat Lucene at scale; the question is whether lookup is in the same practical range and returns identical sets (`agree_fts5`).
- **Ablation:** compare recall and precision across configurations on the same gold queries. A configuration that raises recall but collapses precision (e.g. aggressive stemming) needs a closer look at the failure cases, not just the F1.
- **Gold-query recall on synthetic data is an upper bound.** Treat real-data recall as the number that matters.
- **Negation:** index-level tagging only helps if precision is high; check examples before enabling it for retrieval.
- Do not compare numbers across machines or Python versions; compare configurations within one run.

## Related

- `../Inverted_index_simple_version/` — the small, no-setup baseline.
- `../Inverted_index_options.md` — side-by-side comparison of both options.
