# Concepts

- [NLP](Learning-maps/NLP.md) — a learning map for Natural Language Processing: the mental models, task/representation/paradigm landscape, and decision framework for choosing between rules, classical ML, fine-tuning, and prompting LLMs. 
- [LLM](Learning-maps/LLM.md) — a learning map for Large Language Models: the mechanism/steering/integration landscape and decision framework for choosing between prompting, fine-tuning, RAG, and agentic tool use.
- [OMOP](Concepts/OMOP.md) — a learning map for OMOP at UCLH: the CDM schema/vocabulary, the Epic → SAFEHR ETL → OMOPCAT → OMOP_ES/DAP-R pipeline, and the omop-course/omop-carpentries training path.
- [Taxonomy](Learning-maps/taxonomy%20learning%20map.md) — a learning map for taxonomy as a discipline: how categories are declared, justified, tested, and maintained, as a mental model rather than a how-to.
- [Taxonomy — clinical metaphor version](Learning-maps/taxonomy-clinical%20metaphor%20version.md) — a short version of the taxonomy learning map explained through hospital triage.

# Action

- [2026-08-07](Action/2026-08-07.md) — set up the Notebook GitHub repo, linked it locally, created folder structure, and built the NLP/LLM learning maps.
- [2026-08-08](Action/2026-08-08.md) — added the Previous Requests Revision doc and clarified CLAUDE.md's `_index.md` selection rule (Markdown files only, not the local EPUB-conversion leftovers).
- [2026-08-08 chat summary](Action/2026-08-08-chat-summary.md) — summary of the chat that clarified `_index.md`'s selection rule in CLAUDE.md.
- [2026-08-08 NLP move chat summary](Action/2026-08-08-nlp-move-chat-summary.md) — summary of the chat that moved the NLP/LLM learning maps into `Learning-maps/` and kept `Concepts/` via a placeholder.
- [2026-08-08 NLPM chat summary](Action/2026-08-08-nlpm-branch-chat-summary.md) — summary of the chat explaining the NLPM config and resolving confusion about why a file on another branch wasn't visible locally.
- [2026-08-08 NLPM config chat summary](Action/2026-08-08-nlpm-chat-summary.md) — summary of the chat explaining the NLPM config and the decision not to install it yet.
- [2026-08-09 Previous Requests Revision README chat summary](Action/2026-08-09-previous-requests-readme-chat-summary.md) — summary of the chat that drafted the Previous Requests Revision README and pushed it as PR #8.
- [2026-08-10 Classifier V2 and publication PRs chat summary](Action/2026-08-10-classifier-v2-publication-chat-summary.md) — summary of the chat that built the Classifier V2 plan and the publication feasibility doc, and split them into two independent PRs.
- [2026-08-12 OMOP learning map chat summary](Action/2026-08-12-omop-learning-map-chat-summary.md) — summary of building the OMOP at UCLH learning map (PR #14), including the mistake of placing files under `Learning-maps/` with a stray worktree folder instead of `Concepts/`, and the fix.
- [2026-08-16 Request Category and Schema chat summary](Action/2026-08-16-request-category-schema-chat-summary.md) — summary of building the 156-request clinician-facing category scheme and the Chamberlin/CLEF-grounded request-labeling schema (PR #16), including the three-layer-to-two-layer scoping correction.

# Ideas

- [Previous Requests Revision](Ideas/Requests/Previous%20Requests%20Revision.md) — past clinician data-clinic project requests as landscape tables (yellow/blue/other categories), numbered, with empty datatype columns to fill in.
- [Previous Requests Revision - README](Ideas/Requests/Previous%20Requests%20Revision%20-%20README.md) — draft background on why this catalogue exists (source material for the Classifier benchmark) and the steps for filling it out, for discussion.
- [Request 22](Ideas/Requests/Req.22/Request%2022.md) — ICI toxicity incident audit request pulled out from Previous Requests Revision, with empty datatype columns to fill in.
- [Request 22 - Data Query Guidance](Ideas/Requests/Req.22/data_query_guidance.md) — detailed data query spec for the ICI toxicity audit (cohort, immunosuppressant drugs, and per-organ-toxicity search terms/report headings), converted from the clinician's Word doc.
- [Request 22 - ICI Toxicity Detection & Grading Learning Map](Ideas/Requests/Req.22/ici-toxicity-detection-grading-learning-map.md) — learning map for why detecting and grading ICI toxicity (irAEs) needs a hybrid SQL+LLM approach, not SQL alone, built around Request 22.
- [Request Category and Schema](Ideas/Requests/Request_category%20and%20schema.md) — two-tab doc: Category (clinician-facing 6-category scheme sorting all 156 requests, for a future intake-form dropdown) and Schema (a 15-field request-level labeling instrument — clinical category + Chamberlin et al.'s structural flags + CLEF-derived linguistic flags + outcome field — for the Classifier's Stage 0 benchmark, with worked examples and a category-to-flag difficulty hypothesis).
- [Schema Recommendations](Ideas/Requests/Schema%20Recommendations.html) — 7 recommendations for tightening the request-labeling schema before Stage 0 labeling starts (IRR pass, validated-vs-hypothesis flag labeling, DocTime escalation rule, outcome-correctness field, audit trail), with an effort/payoff chart and a CLEF-Figure-1-style entity/relation diagram of one worked request.
- [Request Schema Annotation Guideline v1](Ideas/Category%20and%20schema/Annotation_Guideline_v1.md) — pilot guideline for labeling data-clinic requests against the 15-field schema (1 category, 6 structural flags, 7 linguistic flags, 1 outcome field).
- [Classifier and Rationale V2](Ideas/Classifier/Classifier%20and%20Rationale%20V2.md) — adds Stage 0 (CLEF-extended request labeling with an extraction-method entity) ahead of the existing benchmark-to-router pipeline, plus strengths and limitations.
- [Publishing the Classifier Project](Ideas/Publication/Publishing%20the%20Classifier%20Project.md) — feasibility assessment and step-by-step flow (with barriers and solutions) for publishing the Classifier project as a methods/informatics paper.

