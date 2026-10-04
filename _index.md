# Concepts

- [NLP](Concepts/NLP.md) — a learning map for Natural Language Processing: the mental models, task/representation/paradigm landscape, and decision framework for choosing between rules, classical ML, fine-tuning, and prompting LLMs. 
- [LLM](Concepts/LLM.md) — a learning map for Large Language Models: the mechanism/steering/integration landscape and decision framework for choosing between prompting, fine-tuning, RAG, and agentic tool use.
- [OMOP](Concepts/OMOP.md) — a learning map for OMOP at UCLH: the CDM schema/vocabulary, the Epic → SAFEHR ETL → OMOPCAT → OMOP_ES/DAP-R pipeline, and the omop-course/omop-carpentries training path.
- [NLP](Learning-maps/NLP.md) — a learning map for Natural Language Processing: the mental models, task/representation/paradigm landscape, and decision framework for choosing between rules, classical ML, fine-tuning, and prompting LLMs. 
- [LLM](Learning-maps/LLM.md) — a learning map for Large Language Models: the mechanism/steering/integration landscape and decision framework for choosing between prompting, fine-tuning, RAG, and agentic tool use.

# Action

- [2026-08-07](Action/2026-08-07.md) — set up the Notebook GitHub repo, linked it locally, created folder structure, and built the NLP/LLM learning maps.
- [2026-08-08](Action/2026-08-08.md) — added the Previous Requests Revision doc and clarified CLAUDE.md's `_index.md` selection rule (Markdown files only, not the local EPUB-conversion leftovers).
- [2026-08-08 chat summary](Action/2026-08-08-chat-summary.md) — summary of the chat that clarified `_index.md`'s selection rule in CLAUDE.md.
- [2026-08-10 Classifier V2 and publication PRs chat summary](Action/2026-08-10-classifier-v2-publication-chat-summary.md) — summary of the chat that built the Classifier V2 plan and the publication feasibility doc, and split them into two independent PRs.
- [2026-08-09 Previous Requests Revision README chat summary](Action/2026-08-09-previous-requests-readme-chat-summary.md) — summary of the chat that drafted the Previous Requests Revision README and pushed it as PR #8.
- [2026-08-12 OMOP learning map chat summary](Action/2026-08-12-omop-learning-map-chat-summary.md) — summary of building the OMOP at UCLH learning map (PR #14), including the mistake of placing files under `Learning-maps/` with a stray worktree folder instead of `Concepts/`, and the fix.

# Ideas

- [Previous Requests Revision](Ideas/Previous%20Requests%20Revision.md) — past clinician data-clinic project requests as landscape tables (yellow/blue/other categories), numbered, with empty datatype columns to fill in.
- [Classifier and Rationale V2](Ideas/Classifier/Classifier%20and%20Rationale%20V2.md) — adds Stage 0 (CLEF-extended request labeling with an extraction-method entity) ahead of the existing benchmark-to-router pipeline, plus strengths, limitations, and a scored reference list.
- [Request 22](Ideas/Requests/Req.22/Request%2022.md) — ICI toxicity incident audit request pulled out from Previous Requests Revision, with empty datatype columns to fill in.
- [Request 22 - Data Query Guidance](Ideas/Requests/Req.22/data_query_guidance.md) — detailed data query spec for the ICI toxicity audit (cohort, immunosuppressant drugs, and per-organ-toxicity search terms/report headings), converted from the clinician's Word doc.
- [Request 22 - ICI Toxicity Detection & Grading Learning Map](Ideas/Requests/Req.22/ici-toxicity-detection-grading-learning-map.md) — learning map for why detecting and grading ICI toxicity (irAEs) needs a hybrid SQL+LLM approach, not SQL alone, built around Request 22.
- [Publishing the Classifier Project](Ideas/Publication/Publishing%20the%20Classifier%20Project.md) — feasibility assessment and step-by-step flow (with barriers and solutions) for publishing the Classifier project as a methods/informatics paper.
- [Inverted Indexing Evaluation — Two Options](Ideas/Evaluation/Inverted_index_options.md) — side-by-side comparison of the simple (run, stdlib-only) and complex (scaffold, Pyserini/medSpaCy/MIMIC) plans for evaluating inverted indexing in clinical IR, with goal, steps, resources, strengths/weaknesses and outputs; each option has its own folder with a README next to it.
- [Inverted Index Evaluation — Simple Version](Ideas/Evaluation/Inverted_index_simple_version/README.md) — README for the small, stdlib-only, already-run evaluation: independent regex oracle, compact index format, add/replace/delete cost, and lookup latency vs linear scan and SQLite FTS5, with the latest results and how to read them.
- [Inverted Index Evaluation — Complex Version](Ideas/Evaluation/Inverted_index_complex_version/README.md) — README for the recommended scaffold (not yet run): realistic/synthetic data, positional index, tokenizer ablation, negation tagging, and Heaps' law/latency benchmarks against FTS5 and Pyserini.
- [2026-08-08 NLP move chat summary](Action/2026-08-08-nlp-move-chat-summary.md) — summary of the chat that moved the NLP/LLM learning maps into `Learning-maps/` and kept `Concepts/` via a placeholder.
- [2026-08-08 NLPM chat summary](Action/2026-08-08-nlpm-chat-summary.md) — summary of the chat explaining the NLPM config added to this PR and the decision not to install it yet.

