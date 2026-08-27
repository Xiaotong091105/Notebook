**REQUEST SCHEMA ANNOTATION GUIDELINE**

*v1 — Pilot sample annotation tool*

# 0. Purpose and scope

This guideline supports labeling data-clinic requests (not clinical documents) against the 15-field schema defined in Request Category and Schema. Each request gets:

- 1 Category — which of the 6 clinical-question groups it belongs to

- 6 Structural flags (Temporal, Text, Medication, Procedure, Additional, Condition) — always assessed

- 7 Linguistic flags (Negation, Uncertainty, Body Location, Course, Conditional, Subject, DocTime Class) — assessed only if Text = Yes

- 1 Outcome field (extraction method actually used) — filled in after the fact; leave as Unknown during the pilot

You are judging the request as written, not simulating whether you personally could answer it. If the wording is genuinely ambiguous about a flag, mark Y if a competent analyst would need to resolve that ambiguity to answer correctly — ambiguity that affects the answer counts as a “yes,” ambiguity that’s cosmetic does not.

*This is v1. Expect revisions after the pilot batch is scored for inter-annotator agreement (IAA). Do not treat any rule below as final — flag anything that felt awkward to apply, even if you eventually picked an answer.*

# 1. Recipe — order of operations

Work through each request in this order. Don’t skip steps, even on requests that feel obvious — most disagreements come from annotators taking a shortcut on requests they assumed were easy.

1.  Read the whole request once, without labeling anything. Note the clinical intent in one sentence, in your own words.

2.  Assign Category. Pick the single group that matches the primary aim of the request (see §2). If it genuinely straddles two categories, assign the primary one and note the secondary candidate in the Notes column — don’t leave Category blank.

3.  Assess all 6 structural flags, in the fixed order Temporal → Text → Medication → Procedure → Additional → Condition. Decide Text before letting yourself think about linguistic nuance, so it doesn’t bias the other five.

4.  If Text = Y, assess all 7 linguistic flags. If Text = N, leave all 7 blank (not N — blank, since they don’t apply).

5.  Re-read your Category choice once more against the structural flags you just assigned. If they conflict with the category-to-structural-flag hypothesis table, don’t change your answer — just note it as a hypothesis-mismatch case.

6.  Leave the Outcome field as-is unless you have direct knowledge of how the request was actually answered.

# 2. Category

Pick one of the six categories below. Use the stated primary aim of the request, not the data source it happens to touch.

| **\#** | **Category** | **Assign when the request is fundamentally asking…** |
|----|----|----|
| 1 | Prevalence, Rate & Recurrence | “How many / what % of patients had X” — including recurrence or relapse counts |
| 2 | Staging & Disease Extent | What stage/extent of disease existed at diagnosis or some timepoint |
| 3 | Outcome, Response & Survival | Whether treatment worked, how long patients lived, how disease progressed |
| 4 | Treatment Pattern & Safety | How a drug/regimen/procedure was used, or what toxicity/complications/compliance issues occurred |
| 5 | Service, Workflow, Documentation & Administrative | Workload, capacity, resourcing, data-quality checks, or a plain patient list |
| 6 | Others | Doesn’t cleanly fit 1–5 (e.g., supports an AI/imaging project, or non-oncology research) |

**Decision rules for boundary cases:**

- Stage-and-outcome mix → Category 3 if survival/outcome is the stated reason for asking; Category 2 if staging is the deliverable and outcome is incidental context. Read the request’s opening sentence — it usually states the actual motivation.

- Workflow-and-count mix → Category 5 if the workflow/timing metric is the point; Category 1 or 4 if the count is the point and timing is a secondary cut.

- Category 4 is intentionally broad (both “how is this drug used” and “what complications occurred”). Don’t split it during the pilot — that’s a scope decision for after the pilot.

- If still torn after applying the rules above, assign the category listed first in the table and flag it as ambiguous.

# 3. Structural flags (always assessed)

For each flag: mark Y if answering the request correctly depends on that dimension, not merely if that dimension is mentioned in passing.

### Temporal

**Question:** Does answering require sequencing or dating multiple events relative to each other (not just filtering on a single date range)?

**Yes —** “time from diagnosis to first treatment,” “recurrence within 2 years of surgery,” “sequence of drug lines before progression”

**No —** “patients diagnosed in 2022” — a single date filter, not a relationship between events

***Evidence/notes:** Associated with worse automated retrieval performance in prior work — a Y here signals the request will need more than a simple structured query.*

### Text

**Question:** Is the answer not fully available from structured/coded fields — does it require reading free text (letters, notes, reports) to answer correctly?

**Yes —** the request depends on information typically only documented in narrative text (reasons for a decision, qualitative description, anything not normally coded)

**No —** everything needed exists in structured fields (diagnosis codes, drug orders, lab values, dates)

***Evidence/notes:** This flag gates the 7 linguistic flags below — get it right first. Associated with better performance in prior work, somewhat counterintuitively: it picks out requests where structured data alone would be insufficient, so text becomes a necessary supplement rather than the whole burden.*

### Medication

**Question:** Does the request include or exclude patients by a specific drug or drug class?

**Yes —** “patients treated with tamoxifen,” “excluding those on concurrent chemotherapy”

**No —** no drug-based inclusion/exclusion criterion at all

### Procedure

**Question:** Does the request include or exclude by a surgical or non-surgical procedure?

**Yes —** “patients who had a groin dissection,” “excluding those who declined biopsy”

**No —** no procedure-based criterion

### Additional

**Question:** Does the request need extra lab, imaging, or exam values beyond a single field lookup?

**Yes —** “patients with a 25-hydroxy Vitamin D result in a specific range,” “imaging-confirmed progression”

**No —** the request doesn’t need any lab/imaging/exam value beyond what’s already captured by Category/Condition

### Condition

**Question:** Does the request require an explicit named diagnosis as an inclusion criterion?

**Yes —** “patients with stage 2 adenocarcinoma,” “postherpetic neuralgia patients”

**No —** cohort is defined by something other than a named diagnosis (e.g., a pure procedure list, or an administrative count with no diagnosis filter)

# 4. Linguistic flags (assess only if Text = Y)

These describe why the free text will be hard to extract correctly from, not just that free text is needed. If Text = N, skip this entire section.

### Negation

**Question:** Does correctly answering require distinguishing “has X” from “does not have X” in the text?

**Yes —** a toxicity-audit request where notes routinely record both occurrence and explicit absence of a side effect

**No —** no meaningful negation risk in the text

***Evidence/notes:** Generally the easiest linguistic flag to get right — if in doubt between Y and N, lean Y, since negation is cheap to check.*

### Uncertainty

**Question:** Does the request require distinguishing a confirmed finding from a suspected/hedged one (“likely,” “possible,” “query”)?

**Yes —** a request that would be wrong if it counted “possible recurrence” the same as “confirmed recurrence”

**No —** findings relevant to the request are consistently stated as confirmed

### Body Location

**Question:** Does correctly answering depend on identifying the anatomical site mentioned in text (not just a coded body-site field)?

**Yes —** “left lung lesion” vs. “right lung lesion” changes the answer, and this distinction only exists in free text

**No —** anatomical site doesn’t affect the answer, or is already coded

### Course

**Question:** Does the request depend on detecting change-over-time language — “improved,” “worsened,” “resolved,” “stable”?

**Yes —** any staging or outcome-trajectory request that hinges on response language in follow-up notes

**No —** no change-over-time language needs to be interpreted

***Evidence/notes:** Most likely to co-occur with Categories 2 and 3.*

### Conditional

**Question:** Is there meaningful risk of a false positive from hypothetical or protocol language (“if recurrence occurs, start X”)?

**Yes —** a treatment-pattern audit where notes discuss a drug in a contingency plan that never actually happened

**No —** no hypothetical/protocol language risk in the relevant notes

### Subject

**Question:** Does correctly answering require distinguishing the patient from someone else mentioned in the text (family member, donor)?

**Yes —** family-history mentions that could be miscounted as the patient’s own diagnosis

**No —** no risk of the text referring to anyone other than the patient

***Evidence/notes:** Prior evidence suggests this flag is a trap — systems normalize the reference correctly once found, but routinely fail to notice the cue is needed at all. Mark Y even in borderline cases; under-flagging is the likelier annotator error.*

### DocTime Class

**Question:** Does correctly answering require resolving whether an event happened before, during, or after the note in which it’s mentioned?

**Yes —** a request about treatment sequencing where the note reports past history alongside current findings, and timing must be inferred from tense/context rather than a coded date

**No —** timing of the relevant mentions is unambiguous or irrelevant

***Evidence/notes:** The hardest linguistic flag — prior evidence shows near-zero accuracy even from the best-performing extraction methods. Treat any Y here as an automatic escalation signal regardless of the other 6 linguistic flags: it likely needs manual review, not automated extraction.*

# 5. Outcome field

**Question:** What extraction method actually answered this request?

Values: SQL only · SQL+MedCAT · Regex · LLM-assisted · Manual review

**During the pilot, most requests will not yet have a real answer to this — leave it Unknown. Do not predict it from the structural/linguistic flags; that prediction is the thing Stage 1 of the Classifier benchmark is meant to test, so filling it in yourself would contaminate the benchmark.**

# 6. Worked examples

| **Request** | **Category** | **Structural** | **Linguistic (Text=Y only)** | **Notes** |
|----|----|----|----|----|
| \#8 — solid malignancy count post-transplant | 1\. Prevalence/Rate | Condition=Y; all else N | N/A (Text=N) | Pure structured count — no free-text dependency |
| \#35 — biopsy mode & diagnostic delay in lymphoma | 5\. Service/Workflow | Temporal=Y, Text=Y, Procedure=Y, Condition=Y | Course=Y, DocTime=Y | Straddles workflow and diagnostic-delay timing; DocTime flag → likely escalation |
| \#62 — PDAC staging pathway | 2\. Staging & Disease Extent | Temporal=Y, Text=Y, Procedure=Y, Additional=Y, Condition=Y | Course=Y, DocTime=Y | DocTime flag → likely escalation |

# 7. What to do when you’re unsure

- Don’t leave a field blank to signal uncertainty on a flag that applies — pick your best answer and mark the Uncertain? / Notes column. That note is what feeds the difference-resolution pass.

- Don’t cross-reference other annotators’ work during the pilot. The point of this round is to see where independent readings diverge.

- If a request seems to need a field the schema doesn’t have, note it separately — don’t force it into an existing flag.

# 8. What happens after your pilot labels come back

Your labels get compared against the other annotators’ labels for the same pilot sample. Agreement is scored per field (not as one blended score), since a field like Category or Negation may agree well while DocTime or a Category-4 boundary case may not. Fields with low agreement get a guideline rewrite and a second pilot round before the full request set is labeled. You’ll get specific feedback on where your calls diverged and why, not just a pass/fail score.

**ANNOTATION WORKSHEET — PILOT SAMPLE**

Annotator name / persona: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ Category assessed with §2 · Structural with §3 · Linguistic (Text=Y only) with §4 Date: \_\_\_\_\_\_\_\_\_\_\_\_

## Worksheet A — Category & Structural flags (fill for every request)

| **Req \#** | **Category (1-6)** | **Temporal** | **Text** | **Medication** | **Procedure** | **Additional** | **Condition** | **Uncertain? (Y/N)** |
|----|----|----|----|----|----|----|----|----|
| 22 | 4 | Y (All solid tumour patients started on Immunotherapy drugs from Jan 2020) | Y (toxicity description) | Y (Nivolumab, ipilimumab, pembrolizumab, atezolizumab, durvalumab, cemiplimab, avelumab, tremelimumab, dostarlimab, relatlimab,botensilimab, Balstilimab) | N (but check procedural report) | Y (clinical notes, scan, Colonoscopy,) | Y (All solid tumour) |  |
|  |  |  |  |  |  |  |  |  |
| ... |  |  |  |  |  |  |  |  |

## Worksheet B — Linguistic flags (fill only where Worksheet A Text = Y) & Outcome

| **Req \#** | **Negation** | **Uncertainty** | **Body Location** | **Course** | **Conditional** | **Subject** | **DocTime Class** | **Outcome (if known)** | **Notes** |
|----|----|----|----|----|----|----|----|----|----|
| 22 | N | Y | Unsure (toxicity can happen in skin, lung, etc) | N | Not sure | N | Unsure |  |  |
|  |  |  |  |  |  |  |  |  |  |
| ... |  |  |  |  |  |  |  |  |  |

*Reminder: leave all 7 linguistic columns blank (not “N”) for any request where Text = N on Worksheet A.*
