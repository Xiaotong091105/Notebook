# Keyword Query Evaluation — Two Options

Context: evaluating **keyword querying** (the "Query methods → Keyword search" row of Table 1) in clinical IR, based on Sivarajkumar et al. (2024), "Clinical Information Retrieval: A Literature Review". The paper defines keyword search as looking for the lexicalised surface forms of words or phrases in free-text EHRs, with results ranked by how often the terms occur, and names its weaknesses: terms that are too broad, no semantics (synonyms missed), negation ("no family history of cancer" matches "cancer") and missing context. The inverted-index evaluations (`Inverted_index_options.md`) tested a *data structure* (correct, fast, small). This evaluation tests a *query method*: does typing keywords retrieve the right patients, and where does it fail? The index is only the engine underneath; this is not about building a search engine. Two ways forward, each in its own folder:

- [Option 1 — Simple version](Keyword_query_simple_version/README.md): small, runnable, synthetic data.
- [Option 2 — Complex version](Keyword_query_complex_version/README.md): recommended heavier plan, scaffolded but not run.

**Scope.** In scope: literal term, phrase and AND/OR queries ranked by occurrence count. Out of scope (separate evaluations; used only as reference points): query expansion, semantic/embedding search, BM25 as a ranking study.

**Unit and metrics (both options).** Relevance is judged **per patient**: a patient is relevant if the information need applies to their whole record, their notes are pooled, and a query returns a ranked list of patients. Because data-clinic requests are cohort-shaped, the primary metrics are **set-based precision, recall and F1** over the returned cohort; secondary metrics are P@k, R@k, F1@k, AP/MAP and NDCG@10 (as in the paper's Table 2). Report per-query and macro-average values with bootstrap 95% confidence intervals, and always show precision and recall separately as well as F1.

## Option 1 — Simple version

**Goal.** Show that the pipeline and metrics work, and measure plain keyword querying on synthetic data with known answers.

**Step-by-step.**
1. Generate synthetic patient notes (Zipf generator; Synthea + ClinicalNoteForge notes as the next step), with abbreviations, misspellings and negation injected.
2. Write 10–20 queries (single term, AND, OR), freeze them, and generate gold patient labels automatically.
3. Run keyword search over the existing ids-only inverted index, ranked by occurrence count, summed per patient.
4. Check result sets against an independent regex oracle; score with set-based P/R/F1 plus P@k, AP; hand-check 2–3 toy queries.
5. Plant a negated mention and a synonym-only document and confirm they appear as the expected error causes.

**Required resources.** Python standard library; `ir-measures` optional; runs in seconds to minutes; no real patient data.

**Strengths.** Runs now; quick check that pipeline and metrics are right; easy to explain; no privacy risk.
**Weaknesses.** Synthetic labels are true by construction, so scores are an optimistic ceiling; says little about real clinical language; few queries; no phrase queries (ids only).

**Outputs.** Per-query results CSV, summary table (set-based and ranked metrics), error-cause counts for the planted cases.

## Option 2 — Complex version (recommended)

**Goal.** Measure how well keyword querying retrieves the right patients on realistic and real data, explain why it fails, and give later phases (query expansion, semantic search, rule-based) a baseline to be compared against.

**Step-by-step.**
1. Data ladder: Synthea + ClinicalNoteForge notes → MIMIC-IV-Note after credentialing → the clinician-curated set (about 1,000 SQL-returned records reduced by clinicians to about 10) in the secure environment.
2. 30–50 queries drawn from the request catalogue (e.g. Request 22), each recorded as an information need plus the plain keyword query a user would type; freeze before testing.
3. Positional index: phrase and proximity queries, AND/OR, occurrence-count ranking.
4. Systems: A keyword search (under test); B SQLite FTS5 (set agreement); C A + negation filtering and D A + synonym list (diagnostics); E optional BM25 via Pyserini.
5. Score against patient-level labels; double-label about 20% for agreement; error analysis tags each false positive/negative by cause (negation, family history, temporal, abbreviation, synonym, misspelling, polysemy, too-broad term, tokenizer artefact, label error); sensitivity to query formulation and tokenizer settings.

**Required resources.** numpy, nltk, medspacy, ir-measures, optional pyserini + Java JDK 11+; PhysioNet credentialed access for MIMIC-IV-Note; clinician time for labels; secure environment for UCLH data (never commit it).

**Strengths.** Defensible, comparable results; error taxonomy quantifies what the paper's stated limitations cost; the curated set gives real clinician judgments and a direct comparison with the SQL approach; links findings to the request-schema linguistic flags.
**Weaknesses.** Much more setup and clinician time; the curated set is pooled from SQL output, so recall is only measured within it (an upper bound) and about 10 relevant patients make metrics noisy; synthetic notes remain templated; Pyserini may not install cleanly on Windows; scope-creep risk into query expansion and BM25; not yet run.

**Outputs.** Per-query and macro metric tables with confidence intervals, error-cause table, sensitivity/ablation CSV, summary JSON.

## Recommendation

Start with Option 1 on Synthea (with ClinicalNoteForge for free text) to prove the pipeline and metrics, then add the clinician-curated set as the real-data stage of Option 2. Apply for MIMIC-IV-Note access now, since it takes time. Before labelling, confirm what the curated records are (patients, encounters or notes) and whether the 10 are the correct answers or only those clinicians reviewed.
