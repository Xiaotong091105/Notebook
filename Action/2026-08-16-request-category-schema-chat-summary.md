# 2026-08-16 — Chat summary: Request Category and Schema for the Classifier project

## Context

Starting from `CDC_Requests_Combined.docx` (156 real historical data-clinic requests), the goal was to design a classification scheme useful for two things at once: a future data-clinic intake form clinicians can self-classify against, and Stage 0 request-labeling for the [Classifier](../Ideas/Classifier/Classifier%20and%20Rationale%20V2.md) project's benchmark (choosing between SQL/MedCAT/regex/LLM per request).

## What was done

1. Read all 156 requests (docx extracted to text) and iteratively developed a classification taxonomy — starting from a multi-axis draft (intent, recurrence, domain, data complexity), then converging through several rounds of feedback on a clinician-facing 9-category scheme framed around **what clinical question is being asked**, rather than which technical extraction method a request would need (which clinicians couldn't reliably self-classify against).
2. Merged the 9 categories down to 6 per explicit user-directed merges — keeping **Staging & Disease Extent** as its own standalone category at the user's request, given its relevance to their supervisor's research focus — and classified all 156 requests against the final 6 categories.
3. Researched two published taxonomies to ground a technical labeling layer: [Chamberlin et al. (2019, medRxiv)](https://www.medrxiv.org/content/10.1101/19012294v1) — an EHR cohort-retrieval query taxonomy showing that 59 fine-grained clinical-content characteristics did *not* predict retrieval performance, but 6 collapsed structural binary features did — and the [ShARe/CLEF eHealth 2014 Task 2](https://ceur-ws.org/Vol-1180/CLEF2014wn-eHealth-MoweryEt2014.pdf) disorder-attribute schema (10 attributes: Negation, Subject, Uncertainty, Course, Severity, Conditional, Generic, Body Location, DocTime Class, Temporal Expression).
4. Corrected an initial three-layer schema proposal, which had wrongly implied document-level CLEF annotation, to keep everything at **request-level** — consistent with the Classifier project's stated scope of labeling requests only, not patient documents.
5. Built a unified 15-field request-labeling schema: 1 clinical category + 6 structural flags (Temporal, Text, Medication, Procedure, Additional, Condition) + 7 linguistic flags (Negation, Uncertainty, Body Location, Course, Conditional, Subject, DocTime Class — assessed only when Text=Yes) + 1 extraction-method outcome field, with worked examples on 3 real requests and a category-to-flag difficulty hypothesis table.
6. Wrote this up as `Ideas/Requests/Request_category and schema.md` plus a matching `.html` with two tabs (Category / Schema), replacing an earlier `Request_category.md`/`.html` pair, and indexed it in `_index.md`.
7. Pushed the work as [PR #16](https://github.com/Xiaotong091105/Notebook/pull/16) (`add-request-category-and-schema` → `main`) — flagged in the PR description that the branch depends on the reorganized `Ideas/Requests/`/`Ideas/Classifier/` folder structure, which doesn't yet exist on `origin/main`, so the diff may look larger than expected until a prior reorg PR merges.

## Outcome

The data clinic now has a candidate 6-category clinician-facing taxonomy for the intake form, and a 15-field request-level labeling schema — grounded in two published EHR-retrieval/NLP taxonomies rather than guesswork — ready to be spot-tested on a sample of the 156 requests before full labeling for the Classifier's Stage 0 benchmark.
