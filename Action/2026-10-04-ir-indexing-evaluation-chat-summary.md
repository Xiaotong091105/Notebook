# 2026-10-04 — Chat summary: Reviewing the inverted-index evaluation plan and splitting it into simple and complex versions

## Context

The goal was to evaluate inverted indexing for clinical IR, based on Sivarajkumar et al. (2024), "Clinical Information Retrieval: A Literature Review" (J. Healthcare Informatics Research 8:313–352), whose Indexing Methods section names three approaches: inverted, rule-based and embedding-based indexing. An existing project (`IR_Evaluation`) already built a from-scratch inverted index with a benchmark for build time, size, correctness and update cost on 2,000 synthetic notes. The question was whether that plan was appropriate.

## What was done

1. **Reviewed the plan** by reading the index, the linear-scan baseline, the benchmark, the README and the last results, and checking claims against the extracted review text (the PDF reader needed poppler, so text was extracted with `pypdf`). Verdict: sound Phase 1 scaffold, but not yet an adequate evaluation of inverted indexing.
2. **Nine problems identified**, most important first:
   - the correctness check shared `tokenize()` with the index, so tokenizer errors were invisible (100% match rate meant only that a dict of sets works);
   - no lookup latency was measured, although speed is the reason to use an inverted index;
   - the mock data (73-term vocabulary, ≤2,000 documents, single timing runs, first-n subsampling) made scale and size numbers meaningless;
   - the 50-document update test was weak and re-adding an existing document corrupted `doc_count` and left stale postings;
   - memory was overcounted (shared doc-id strings counted per posting) and pickle is not a real index format;
   - only document ids were stored (no positions or term frequencies), forcing a rebuild for phrase search, negation scope or BM25;
   - keeping "no" as a token does not say what it negates; the review's Garcelon example classifies contexts at index time;
   - the tokenizer was untested on clinical text and treated `as`/`or` (aortic stenosis, operating room) as stopwords;
   - efficiency metrics alone cannot be compared with the later rule-based and embedding phases.
3. **Proposed fixes** for each, ordered 1 → 5 → 4 → 2 → 3 → 6 → 8 → 9 → 7 (small independent fixes first, data-dependent and labelled-data steps last).
4. **Searched for open-source tools and data.** Pyserini/PyTerrier (Lucene reference), ir-measures (metrics), ir_datasets, medSpaCy/negspacy (NegEx/ConText negation), Synthea, Synthea Coherent Data Set and ClinicalNoteForge (synthetic notes), and MIMIC-IV-Note (real notes, PhysioNet credentialed access with CITI training and a signed DUA; the open MIMIC-IV demo has no free-text notes). Access terms for TREC Clinical Trials and n2c2 were not confirmed.
5. **Compared the two plans** (keep the original vs the recommended one) and recommended a staged route: keep the original as the baseline, do the small no-setup fixes now, then adopt the heavier tools gradually.
6. **Built both options** in `Notebook/Ideas/Evaluation/`:
   - `Inverted_index_simple_version/` — the original project amended with steps 1–4 (independent regex oracle, deduplicated memory and compact delta+varint format, replace/remove support, lookup latency vs linear scan and SQLite FTS5). It was run: 0/73 vocabulary mismatches, injected tokenizer bug caught (old check 0 mismatches vs independent oracle 4), compact format ≈3× smaller than pickle, per-document add ≈20 µs / delete ≈8 µs and consistent with a rebuild, lookup p50 0.20 µs (index) vs 24,302 µs (scan) vs 257 µs (FTS5).
   - `Inverted_index_complex_version/` — scaffold for the recommended plan (Zipf generator with gold queries, positional index, configurable tokenizer, negation tagging, Heaps' law and latency benchmark with FTS5/Pyserini, tokenizer ablation, `docs/setup.md`). Compiled and smoke-tested on the stdlib-only parts; **not run**, nothing installed or downloaded.
   - `Inverted_index_options.md` — side-by-side comparison (goal, steps, resources, strengths/weaknesses, outputs).

## Decisions and caveats

- The original `IR_Evaluation` folder could not be renamed because another process held it open, so it was **copied** into `Notebook/Ideas/Evaluation/Inverted_index_simple_version`; the original is untouched and can be deleted once released.
- Folder names follow the user's latest wording (`Inverted_index_*_version`) rather than the earlier spellings.
- The simple version's results are on synthetic text only: phrase precision of 1.0 and the ~10⁵× scan speedup are artifacts of templated data and a re-tokenizing scan, and FTS5 being slower than a Python dict reflects SQL call overhead, not a quality gap.
- Branch is named `Action-Log` (spaces are not allowed in git branch names).

## Outcome

A finished, trustworthy baseline (Option 1) and a ready-to-run scaffold for the recommended plan (Option 2). Next steps: apply for MIMIC-IV-Note access, generate Zipf/Synthea data and gold queries, then add positions, the tokenizer ablation, Pyserini and medSpaCy in stages.
