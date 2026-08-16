# Request Category and Schema

Source: the 156 requests catalogued in [Previous Requests Revision](Previous%20Requests%20Revision.md). Two related but distinct pieces of work, kept as two sections in one document:

- **Category** — a clinician-facing 6-category scheme, for the data-clinic intake form and for human communication about what's being asked.
- **Schema** — a request-level labeling instrument for the [Classifier](../Classifier/Classifier%20and%20Rationale%20V2.md)'s Stage 0 benchmark, built from two published taxonomies (Chamberlin et al.'s structural query features and the CLEF Task 2 disorder-attribute schema), adapted so every field labels a *request*, not a document — matching this project's stated scope of labeling requests only.

---

## Section 1 — Category

A clinician-facing category scheme sorting all 156 requests by **what clinical question is being asked**, in language clinicians already use to describe their own audits and studies. Earlier drafts tried framing categories around *which extraction method* (SQL/MedCAT/regex/LLM) a request would need — technically the more direct fit for the Classifier's router, but not something a clinician or analyst filling in a form could reliably self-classify against.

### Categories

| # | Category | The question being asked | Count |
|---|---|---|---|
| 1 | **Prevalence, Rate & Recurrence** | "How many/what % of patients…", plus recurrence/relapse questions | 26 |
| 2 | **Staging & Disease Extent** | Stage/extent of disease at diagnosis or a given timepoint | 8 |
| 3 | **Outcome, Response & Survival** | Treatment response, survival, mortality, disease trajectory | 30 |
| 4 | **Treatment Pattern & Safety** | How a drug/regimen/procedure is used, plus toxicity/complications/guideline-compliance audits | 58 |
| 5 | **Service, Workflow, Documentation & Administrative Requests** | Workload/capacity/resource/business-case questions, data-recording quality checks, and plain patient-list requests | 32 |
| 6 | **Others** | Doesn't cleanly fit a clinical category (AI/imaging support, non-oncology research) | 2 |

**Total: 156**

### Request numbers by category

**1. Prevalence, Rate & Recurrence**
1, 8, 12, 17, 21, 27, 28, 39, 59, 63, 66, 67, 72, 74, 83, 95, 104, 111, 124, 128, 130, 132, 139, 143, 151, 154

**2. Staging & Disease Extent**
25, 26, 62, 88, 94, 100, 108, 109

**3. Outcome, Response & Survival**
4, 14, 24, 40, 42, 43, 44, 51, 58, 60, 64, 68, 69, 71, 78, 80, 91, 92, 93, 97, 107, 110, 113, 116, 117, 125, 126, 127, 147, 152

**4. Treatment Pattern & Safety**
3, 6, 7, 9, 11, 13, 16, 18, 22, 29, 30, 31, 33, 34, 36, 37, 38, 45, 47, 48, 49, 53, 54, 55, 56, 57, 65, 70, 76, 79, 85, 87, 89, 96, 98, 99, 102, 103, 112, 115, 119, 123, 133, 134, 135, 136, 137, 138, 141, 142, 144, 145, 146, 148, 149, 153, 155, 156

**5. Service, Workflow, Documentation & Administrative Requests**
2, 5, 10, 15, 19, 20, 23, 32, 35, 41, 46, 50, 52, 61, 73, 75, 77, 81, 82, 84, 86, 101, 105, 106, 114, 118, 120, 121, 129, 131, 140, 150

**6. Others**
90, 122

### Notes

- **Category 4 is the outlier by size** (58/156, ~37%) — it absorbed both "how is this drug used" and "what complications occurred" in the merge. If the form or the Classifier benchmark needs finer resolution here, the natural split is back into *Treatment Pattern* vs. *Safety/Toxicity*.
- A handful of requests genuinely straddle two categories (e.g. #35 spans treatment-pattern practice and diagnostic-delay timing; #68 and #94 carry both staging and outcome data). Each was placed by its stated primary aim; a secondary tag could be added later if the Classifier benchmark needs it.
- #90 and #122 (Others) aren't data-clinic clinical requests in the usual sense — one supports an AI tumour-delineation project, the other is epilepsy PET research unrelated to cancer.
- This taxonomy converged through iterative discussion, starting from a 9-category draft (Prevalence & Rate / Recurrence & Relapse / Staging & Disease Extent / Outcome, Response & Survival / Treatment Pattern & Prescribing / Safety, Toxicity & Complications / Service, Workflow & Resource Use / Documentation & Data-Quality Check / Patient List for Further Review) before merging down to the 6 above.

---

## Section 2 — Schema

A request-level labeling instrument for Stage 0 of the Classifier benchmark, combining three sources of evidence:

1. [Chamberlin et al. (2019), *A Query Taxonomy Describes Performance of Patient-Level Retrieval from Electronic Health Record Data*](https://www.medrxiv.org/content/10.1101/19012294v1) — tested a 59-characteristic clinical-content taxonomy against real retrieval performance on 56 EHR cohort queries and found **no association**. They then collapsed those 59 characteristics into **6 binary structural features** (Temporal, Text, Medication, Procedure, Additional, Condition) and found those *did* correlate strongly with performance.
2. The [ShARe/CLEF eHealth 2014 Task 2](https://ceur-ws.org/Vol-1180/CLEF2014wn-eHealth-MoweryEt2014.pdf) disorder-attribute schema — 10 attributes (Negation, Subject, Uncertainty, Course, Severity, Conditional, Generic, Body Location, DocTime Class, Temporal Expression) originally designed to annotate mentions *within clinical documents*.
3. Your own [Category scheme](#section-1--category) above, which is structurally the same kind of taxonomy as Chamberlin et al.'s 59 fine-grained characteristics — useful for the intake form and human communication, but (per their finding) not the layer that predicts extraction-method performance.

**Scoping correction:** this project labels *requests*, not patient documents (per the [Classifier rationale](../Classifier/Classifier%20and%20Rationale%20V2.md)). CLEF's attributes were designed for document/mention-level annotation, so they're adapted here into **request-level yes/no judgments** — "does correctly answering this request depend on X" — rather than annotating actual clinical notes. Generic Class was dropped from CLEF's 10 attributes; it's mainly a discharge-summary boilerplate problem, not a pattern seen in clinician-authored data-clinic requests.

### The schema

One row per request, 15 fields: 1 clinical category + 6 structural flags (always assessed) + 7 linguistic flags (assessed only when Text = Yes) + 1 outcome field.

| Layer | Field | Type | Question | Values | Evidence / notes |
|---|---|---|---|---|---|
| Clinical | **Category** | Single-select | What is the clinician asking? | Prevalence/Rate/Recurrence · Staging & Disease Extent · Outcome/Response/Survival · Treatment Pattern & Safety · Service/Workflow/Documentation/Admin · Others | Section 1's 6-category scheme; the intake-form field |
| Structural | **Temporal** | Yes/No | Does answering require sequencing/dating multiple events? | Y/N | Chamberlin et al. — predicted *worse* performance |
| Structural | **Text** | Yes/No | Is the answer not fully available in structured fields? | Y/N | Chamberlin et al. — predicted *better* performance; gates the Linguistic rows below |
| Structural | **Medication** | Yes/No | Does it include/exclude by drug? | Y/N | Chamberlin et al. — predicted *worse* |
| Structural | **Procedure** | Yes/No | Does it include/exclude by surgical/non-surgical procedure? | Y/N | Chamberlin et al. — predicted *worse* |
| Structural | **Additional** | Yes/No | Does it need extra lab/imaging/exam values beyond one field? | Y/N | Chamberlin et al. — predicted *worse* |
| Structural | **Condition** | Yes/No | Does it require an explicit named diagnosis as inclusion criterion? | Y/N | Chamberlin et al. — predicted *worse* |
| Linguistic *(if Text=Y)* | **Negation** | Yes/No | Does it need "has X" vs "does not have X" distinguished? | Y/N | CLEF Task 2 — easiest linguistic attribute (F1 0.91) |
| Linguistic *(if Text=Y)* | **Uncertainty** | Yes/No | Does it need confirmed vs. suspected/hedged distinguished? | Y/N | CLEF Task 2 — moderate (F1 0.56) |
| Linguistic *(if Text=Y)* | **Body Location** | Yes/No | Does anatomical site need to be correctly identified? | Y/N | CLEF Task 2 — moderate |
| Linguistic *(if Text=Y)* | **Course** | Yes/No | Does it need "improved/worsened/resolved/changed" language detected? | Y/N | CLEF Task 2 — moderate (F1 0.65); best fit for staging/outcome trajectory |
| Linguistic *(if Text=Y)* | **Conditional** | Yes/No | False-positive risk from hypothetical/protocol language ("if X occurs")? | Y/N | CLEF Task 2 — moderate (F1 0.64) |
| Linguistic *(if Text=Y)* | **Subject** | Yes/No | Does it need patient-vs-donor/family-member attribution? | Y/N | CLEF Task 2 — high normalization accuracy, poor cue detection (a trap) |
| Linguistic *(if Text=Y)* | **DocTime Class** | Yes/No | Does it need before/during/after-note timing of a mention resolved? | Y/N | CLEF Task 2 — **hardest attribute**, near-zero F1 even for the best system; treat Y as an auto-escalation signal to LLM-assisted/manual review |
| Outcome | **Extraction method used** | Multi-select | What actually answered this request? | SQL only · SQL+MedCAT · Regex · LLM-assisted · Manual review | The Stage 0 dependent variable per the Classifier rationale |

### Worked examples

| Request | Category | Structural | Linguistic (if Text=Y) | Predicted difficulty |
|---|---|---|---|---|
| **#8** — solid malignancy count post-transplant | 1. Prevalence/Rate | Condition=Y; all else N | N/A (Text=N) | Easy — SQL only |
| **#35** — biopsy mode & diagnostic delay in lymphoma | 5. Service/Workflow | Temporal=Y, Text=Y, Procedure=Y, Condition=Y | Course=Y (relapse/refractory), DocTime=Y (new vs. relapse timing), Uncertainty=low | Hard — DocTime flagged, likely needs LLM-assisted |
| **#62** — PDAC staging pathway | 2. Staging & Disease Extent | Temporal=Y, Text=Y, Procedure=Y, Additional=Y, Condition=Y | Course=Y (interval vs. screen-detected), DocTime=Y (staging at diagnosis vs. surveillance) | Hard — DocTime flagged, likely needs LLM-assisted |

### Category-to-structural-flag hypothesis

A first-pass hypothesis for how Section 1's categories are likely to score on the structural/linguistic flags, to sanity-check by labeling a larger sample before treating it as settled.

| Category | Likely flags | Predicted difficulty |
|---|---|---|
| 1. Prevalence, Rate & Recurrence | Temporal=often (recurrence sub-cases), Condition=Y | Mixed — recurrence harder, plain rate/count easier |
| 2. Staging & Disease Extent | Temporal=often, Condition=Y, Text=often | Mixed — Text pulls toward *better*, Temporal/Condition/DocTime toward *worse* |
| 3. Outcome, Response & Survival | Temporal=Y, Condition=Y, Additional=often | Harder |
| 4. Treatment Pattern & Safety | Medication=Y, Procedure=often, Additional=often | Harder — largest, most heterogeneous category |
| 5. Service, Workflow, Documentation & Administrative | Mostly none of the six structural flags | Easiest — likely plain SQL |
| 6. Others | Not applicable | N/A |

### Next steps

1. Spot-label the schema on a sample of requests across all 6 categories to test the hypothesis table above.
2. Once the pattern holds (or is corrected), label all 156 requests against the full schema.
3. Feed the labeled set into Stage 1 (Benchmark) of the Classifier plan.
