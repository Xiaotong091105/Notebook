# Inverted Index Evaluation — Simple Version (Option 1)

Small, no-setup evaluation of a from-scratch inverted index for free-text clinical records, following the indexing taxonomy in Sivarajkumar et al., "Clinical Information Retrieval: A Literature Review" (J. Healthcare Informatics Research, 2024). Standard library only.

This is the original project amended with the four fixes that make its results trustworthy. The heavier plan (realistic data, Pyserini, negation, gold queries) is the sibling `Inverted_index_complex_version/`.

## 1) Goal

Test whether a simple inverted index is correct, fast to look up, affordable in size, and cheap to update, treated purely as a data structure. No querying logic or ranking (TF-IDF/BM25) is involved; those belong to later phases.

Questions answered:
- Is the index structurally correct against an independent ground truth?
- How fast is lookup compared with a linear scan and SQLite FTS5?
- How do build time, memory and on-disk size grow with corpus size?
- What does adding, replacing and deleting one document cost?

## 2) Step-by-step (how)

1. `data/mock_data_generator.py` creates 2,000 synthetic records (no real patient data). `data/dataset_loader.py` loads them using `data/schema_config.json`; the real dataset is a config change.
2. `indexing/inverted_index.py` tokenizes (lowercase, `[a-z0-9]+`, stopwords removed, negation words kept) and stores `term -> set of doc ids`, plus a `doc -> terms` map so documents can be replaced or removed.
3. `evaluation/benchmark_inverted_index.py` runs five checks:
   - **Scalability:** median-of-5 build time, memory, pickle size and compact size at 100–2,000 documents (seeded random subsamples).
   - **Correctness against an independent oracle** (`indexing/baseline_linear_scan.py::regex_scan`, which never calls `tokenize()`): whole vocabulary, absent terms, case variants, stopwords, phrases, compact-format round-trip, a hand-worked tricky corpus, and an injected tokenizer bug.
   - **Vocabulary statistics.**
   - **Per-document add / replace / delete cost** at several index sizes, with a check that the mutated index equals a from-scratch rebuild.
   - **Lookup latency** (p50/p95) for the index, a linear scan and a contentless SQLite FTS5 table.
4. Results are written to `evaluation/results/` as timestamped CSV and text files (the older `..._113146` files are the pre-fix baseline).

### Usage

```bash
python data/mock_data_generator.py          # only if mock_dataset.csv is missing
python evaluation/benchmark_inverted_index.py
```

### Switching to the real dataset

1. Place a de-identified export in `data/` (never commit it — see `.gitignore`).
2. Edit the `"real"` profile in `data/schema_config.json` (`file_path`, `id_column`, `structured_columns`, `text_columns`).
3. In `evaluation/benchmark_inverted_index.py`, change `load_documents(profile="mock")` to `"real"`.
4. Run inside the secure environment: `top_terms` and mismatch details are written to the results files.

## 3) Required resources

- Python 3.10+ (3.14 used here) with the standard library only; `sqlite3` must include FTS5 (the benchmark reports if it does not).
- No downloads, no Java, no accounts, no real patient data.
- Runtime: well under a minute for the full benchmark.

## 4) Strengths and weaknesses

**Strengths**
- Runs immediately and is easy to read and explain.
- The correctness check is independent of the tokenizer and is itself validated by hand-worked answers; an injected bug shows it catches what the old check missed.
- Measures the thing an inverted index exists for (lookup latency) against a scan and a real search engine component.
- Memory is no longer overcounted, and an actual compact on-disk format is measured.
- Update and delete are supported and verified consistent with a rebuild.

**Weaknesses**
- The mock corpus is template-generated: only 73 vocabulary terms, very long posting lists, at most 2,000 documents. Scale and size numbers say little about real EHRs.
- Document ids only: no term frequencies or positions, so phrase queries, negation scope and BM25 will need a redesign.
- Tokenizer is untested on real clinical text (abbreviations, misspellings, hyphens, decimals; `as` and `or` are stopwords).
- Negation words are kept but the index cannot tell what they negate.
- No effectiveness measure (recall/precision against clinician judgments), so results cannot yet be compared with rule-based or embedding indexing.
- Python-level timings: absolute microseconds depend on the machine; the FTS5 figure includes SQL call overhead.

## 5) Outputs

- `evaluation/results/inverted_index_scalability_<ts>.csv` — build time, memory (with and without the doc->terms map), pickle and compact disk size, ratios to raw text, vocabulary size.
- `evaluation/results/inverted_index_update_cost_<ts>.csv` — median add / replace / delete microseconds per index size and a consistency flag.
- `evaluation/results/inverted_index_summary_<ts>.txt` — correctness report, vocabulary stats, update cost, latency table.

### Latest run (20261004_125034, mock data, 2,000 documents)

| Check | Result |
|---|---|
| Whole-vocabulary correctness | 73 terms, 0 mismatches |
| Absent terms / case variants / stopwords | 0 false positives / 0 / 0 |
| Phrases (index AND vs adjacent-phrase oracle) | 0 missed; precision 1.0 on all five (mock text only) |
| Compact format round-trip | OK |
| Hand-worked tricky corpus | 0 mismatches for index and oracle |
| Injected bug (digits dropped) | old check 0 mismatches, independent oracle 4 |
| Build, 2,000 docs | 0.048 s; pickle 335 KB; compact 101 KB |
| Per-document cost (µs) at 100 → 1,500 docs | add 25 → 20; replace 34 → 27; delete 8 → 8; all consistent with rebuild |
| Lookup p50 / p95 (µs) | index 0.20 / 0.30; scan 24,302 / 27,288; FTS5 257 / 553 |
| FTS5 agreement with our index | 54 / 54 terms |

## 6) How to interpret

- **0 mismatches** now means more than before: it is measured against a regex that does not share the tokenizer. The injected-bug row shows why. It still only covers this synthetic text.
- **Phrase precision 1.0** is an artifact of the templated mock text. Real notes will show AND-of-terms returning many documents that do not contain the phrase.
- **Index vs scan speedup (~10⁵×)** confirms the structure works, but the scan re-tokenizes every document per query, so treat it as an upper bound, not a typical gain.
- **Index vs FTS5:** our dict lookup is faster because FTS5 pays SQL and Python call overhead and returns row ids. Do not read this as "better than SQLite"; FTS5 is a reference point for a production index, and it agrees with our results on every compared term.
- **Size:** compact encoding is about 3× smaller than the pickle. The vocabulary size is flat at 73 only because the mock data is closed-vocabulary; on real text expect it to keep growing with corpus size.
- **Update cost** is roughly flat as the index grows (replace costs more than add; delete is cheapest), which supports daily incremental updates. It is per-document and in microseconds on this machine.
- What this phase can say: the index is correct and cheap on this data. What it cannot say: whether it retrieves the right patients. That needs the complex version's gold queries and real or realistic notes.

## Related

- `../Inverted_index_complex_version/` — the recommended, heavier plan.
- Pre-fix baseline: the `..._113146` files in `evaluation/results/` (correctness there used the same tokenizer as the index).
