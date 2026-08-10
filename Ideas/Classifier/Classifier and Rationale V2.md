# From benchmark to router: how we pick the best method per request

*Plan rationale — request-routing · V2*

We don't yet know whether CogStack's methods beat plain SQL, or by how much, for the kinds of requests this team actually gets — and before we can even ask that question, we need to understand each historical request well enough to know what a correct answer looks like. This is the plan for both: understanding and labeling requests first, then finding out which method wins, and turning that answer into something that guides every future request, without assuming a trained model is required to do it.

This project labels **requests only**, not patient documents. CLEF eHealth-style schemas annotate clinical documents; ours annotates the requests clinicians make, extended with one new idea: which extraction method actually answered each request.

## Roadmap

0. **Label requests** — understand each request (query, solution, feedback), label it with a CLEF-extended schema (entity, relation, timeline, plus a new **extraction method** entity), and let the clinician judge the best method per search term. Write a short learning map per request as part of the workflow.
1. **Benchmark** — run SQL, MedCAT concept search, and regex against the labels curated in Stage 0.
2. **Analyze** — which request traits predict the winner.
3. **Codify as rules** — evidence-based router: auditable, no training data, no per-request cost.
4. **Deploy + log** — router picks the method; decision + outcome logged, feeding back into Stage 0.
5. **Train a model, then keep refining it** — start once Stage 0 and the log give enough evidence, and keep retraining as more requests get labeled; treated as a supplement to the rule table while the labeled set stays around today's size.

The router chooses among **SQL**, **MedCAT**, and **Regex** — all no cost — and, rarely, **Azure LLM**, which carries a real (£) metered cost.

Stage 3 is still the actual deliverable: a router built from evidence, not guesswork, that costs nothing to run because choosing among methods is free. Stage 0 is what makes the benchmark trustworthy in the first place — without understanding what "correct" means per request, Stage 1's scoring has nothing solid to score against.

**Legend:** what we'd build now · deferred (revisit as the log and labels grow) · carries a real, metered cost.

## The six stages

Grouped into three phases: understand each request, build the router from evidence, then keep improving it.

### Phase 1 — Understand

**0. Label requests** *(now)* — Work through historical requests one at a time, starting with Request 22 (ICI toxicity audit), which already has a learning map and a full data-query guidance doc.
- Label with an extended CLEF schema — entity, relation, timeline — plus a new **extraction method** entity: which of SQL / MedCAT / regex / LLM actually answered the request.
- The clinician judges the best method per search term — a practical, clinician-adjudicated proxy, **not a gold standard** in the CLEF sense (no independent multi-annotator verification yet — see Limitations).
- Write a short learning map per request as part of the same pass.
- No published schema classifies requests directly; the closest prior art is a [cohort-retrieval query taxonomy](https://www.medrxiv.org/content/10.1101/19012294v1) linking query structure to retrieval-method performance.

### Phase 2 — Build the router

**1. Benchmark** *(now)* — Run SQL, MedCAT concept search, and regex against every request labeled in Stage 0.
- Run Azure LLM on a sampled subset only, since it's the one method with a real per-call cost.
- Score each method against the Stage 0 label, not against each other.

**2. Analyze** *(now)* — Find what distinguishes the requests where CogStack's methods won from the ones where SQL was already good enough.
- E.g. does it name a specific concept, need negation handling, or need reasoning about timing across documents.
- This is where "is it worth switching off SQL" actually gets answered, request-type by request-type.

**3. Codify as rules** *(now)* — Turn those patterns into an explicit, written decision table — this is "the classifier" in practice.
- Which method to use for which kind of request, backed by the benchmark numbers, not guesswork.
- Doesn't need to be a trained statistical model — a rule table is something anyone on the team can read, question, and correct.

**4. Deploy + log** *(now)* — Wire the rule table into how requests actually get handled, and log every decision.
- Log whether each decision plus outcome turned out right.
- Logged outcomes feed back into Stage 0, refining the request labels over time.

### Phase 3 — Improve

**5. Train a model, then keep refining it** *(later, revisited continuously)* — Start once Stage 0's labels and the deployment log give enough evidence, then keep it up to date as more requests get labeled — not a one-off event.
- At today's scale (~150–160 labeled requests), published evidence puts reliable minimum sample sizes nearer 500–1,000, and datasets at N≤300 tend to overestimate performance — early versions should stay a supplement to the rule table, not a replacement.
- Use a **70/30 train/test split**, not 80/20 — better-supported than 80/20 while N stays under roughly 1,000.

## Why Stage 0 comes before the benchmark

A benchmark can only score methods against something known to be correct. With ~150 real requests and no existing request-classification schema to lean on, that "known to be correct" has to be built by hand first — one request at a time, understanding the query, the solution actually used, and how good it turned out to be — before Stage 1 has anything solid to score against.

## Why this isn't a gold standard

CLEF/i2b2-style gold standards are document-level ground truth built from multiple independent annotators with measured agreement. Here, one clinician judges the best extraction method per request — useful for routing decisions, but a single-rater proxy, not verified ground truth. Treat Stage 0 labels accordingly until inter-rater reliability is measured.

## Why rules before a trained model

With roughly 150 historical requests spread across a handful of categories, there isn't enough data for a trained text classifier to reliably beat a well-evidenced rule table — and the rule table is auditable in a way a model isn't, which matters when the downstream decision affects a cancer data request.

## Why the Azure cost doesn't block this

The router's own decision — which method to use — costs nothing to compute, whether it's rules or eventually a small local model. The Azure cost only applies to the rare request the router actually sends to the LLM, which is precisely what a good router is supposed to minimize, not avoid engaging with.

## Strengths

- **Fills a confirmed gap.** No published schema classifies data-extraction requests (as opposed to documents). Extending CLEF's structure with an extraction-method entity is a defensible, literature-grounded response to that gap.
- **Grounded in real operational data.** ~150 real historical requests, with real SQL, real outcomes, real clinician feedback — not synthetic or toy data.
- **Directly actionable.** The request-trait → extraction-method mapping isn't just descriptive; it's the thing the router actually needs.
- **Cost- and audit-aware design.** Rules before ML, LLM calls minimized, every decision auditable — matches evidence-based practice for small-N ML deployment rather than jumping straight to a trained model.
- **Reusable beyond this project.** A generalized version of the schema could serve other data-clinic or clinical-informatics teams facing the same routing problem.

## Limitations

- **Underpowered for a trained model, by the evidence.** ~150–160 requests sits below the ~500–1,000 floor the literature treats as reliable; Stage 5 results should be read as early/supplementary, not conclusive, until N grows.
- **Single adjudicator, no inter-rater reliability.** Extraction-method labels currently come from one clinician's judgment per request, with no agreement measure — unlike CLEF/i2b2-style gold standards, which report annotator agreement (e.g. Cohen's kappa).
- **Single-site provenance.** All requests come from one Data Clinic; request patterns, EHR structure, and coding conventions elsewhere may differ, so generalizability beyond this hospital is untested.
- **Severe class imbalance.** The Yellow(4)/Blue(17)/Other(135) split is heavily skewed, which will hurt classifier performance on the rare categories regardless of total N.
- **Hindsight bias risk.** Extraction-method labels are assigned with the outcome already known; there's no prospective test of whether the rule table would pick the right method before seeing that outcome.
- **Not a real gold standard.** As above — the labels are a practical proxy for routing decisions, not independently verified ground truth, and should not be described as one in any downstream use of this data.

## Reference for Request Schema

*An interactive, clickable-tab version of this section is in `Classifier and Rationale V2.html` — open it in a browser and select the "Reference for Request Schema" tab. Table below: every paper found relevant during literature search, with a brief summary and a 1–5 relevance/importance score for this project.*

| Score | Paper | Summary | Recommended use |
|---|---|---|---|
| 5/5 | Mowery, D. et al. **Overview of the ShARe/CLEF eHealth Evaluation Lab 2014 Task 2: Disorder Attributes in Clinical Reports.** CLEF 2014, CEUR-WS Vol-1180. [ceur-ws.org/Vol-1180/CLEF2014wn-eHealth-MoweryEt2014.pdf](https://ceur-ws.org/Vol-1180/CLEF2014wn-eHealth-MoweryEt2014.pdf) | Defines the canonical CLEF entity/attribute schema (negation, uncertainty, severity, body location, doc-time class, temporal expression), adjudicated by two coders. This is the actual source of "CLEF's structure" that Stage 0 extends — the most load-bearing citation in the list. | Cite as the primary schema source in Stage 0's methodology write-up; borrow the attribute checklist directly when defining request-level entity types. |
| 5/5 | **A Query Taxonomy Describes Performance of Patient-Level Retrieval from Electronic Health Record Data.** medRxiv. [medrxiv.org/content/10.1101/19012294v1](https://www.medrxiv.org/content/10.1101/19012294v1) | A 59-characteristic taxonomy of EHR cohort-retrieval queries, explicitly linked to which retrieval method wins per query type. Closest existing analogue to Stage 0–2's extraction-method mapping. | Use its 59 characteristics as a starter checklist for request traits in Stage 2's analysis — several features (temporal relations, structured vs. unstructured mix) likely transfer directly. |
| 4/5 | Sun, W., Rumshisky, A., Uzuner, O. **Evaluating temporal relations in clinical text: 2012 i2b2 Challenge.** *J Am Med Inform Assoc*, 2013. [pmc.ncbi.nlm.nih.gov/articles/PMC3756270](https://pmc.ncbi.nlm.nih.gov/articles/PMC3756270/) | Defines the EVENT/TIMEX/TLINK temporal-relation schema the "timeline" half of our extended schema descends from — one layer removed from request-level labeling itself. | Keep in reserve — use only if the flat "timeline" entity needs to be split into EVENT/TIMEX/TLINK sub-fields; not needed at the current level of detail. |
| 4/5 | Ely, J. W. et al. **A taxonomy of generic clinical questions: classification study.** *BMJ*, 2000;321:429–32. [pubmed.ncbi.nlm.nih.gov/10938054](https://pubmed.ncbi.nlm.nih.gov/10938054/) | Classifies clinicians' information *needs* (not documents) into 64 types, with measured inter-rater reliability — a direct precedent for request-level labeling and a template for closing this project's inter-rater-reliability gap. | Follow its inter-rater-reliability reporting method (e.g. Cohen's kappa) once a second labeler is added; cite for framing requests as "information needs" in any write-up. |
| 4/5 | **Lightweight Query Routing for Adaptive RAG: A Baseline Study on RAGRouter-Bench.** arXiv:2604.03455, 2026. [arxiv.org/abs/2604.03455](https://arxiv.org/abs/2604.03455) | Classical classifiers (TF-IDF+SVM) routing queries to retrieval pathways by structural/lexical features; flags medical queries as the hardest domain to route. Closest prior art to the router itself (Stages 3–5). | Use as the starting architecture for Stage 5 — try a lightweight classical classifier (TF-IDF+SVM) before anything more complex. |
| 4/5 | **Determinants of Training Corpus Size for Clinical Text Classification.** arXiv:2601.15846, 2026. [arxiv.org/abs/2601.15846](https://arxiv.org/abs/2601.15846) | MIMIC-III-based: ~600 labeled documents sufficient for 95% of max achievable classifier performance. Clinical-domain-specific and directly comparable to our ~150–160 labeled requests. | Track Stage 5 performance against N as labeling grows, using ~600 as a rough target size; cite when justifying why the rule table stays primary until then. |
| 3/5 | **A method for determining the number of documents needed for a gold standard corpus.** *J Biomed Inform*, 2012. [sciencedirect.com/science/article/pii/S1532046411002243](https://www.sciencedirect.com/science/article/pii/S1532046411002243) | Poisson-based, word-capture-probability method converging on ~500 documents for 0.95 capture probability — independent corroboration of the ~500–1,000 sample-size floor above, though less directly about request labeling. | Optional — apply its formula only if a more rigorous, defensible target sample size is needed (e.g. for a governance conversation). |
| 3/5 | **On the diminishing return of labeling clinical reports.** arXiv:2010.14587. [arxiv.org/pdf/2010.14587](https://arxiv.org/pdf/2010.14587) | Shows label-count-vs-performance curves flattening early for clinical text classifiers — secondary support for treating ~150 labeled requests as an early checkpoint, not a finished dataset. | Cite alongside the corpus-size papers when justifying why ~150–160 requests is an early checkpoint, not a stopping point. |
| 2/5 | TREC Medical Records Track & Clinical Decision Support Track overviews, Roberts, K. et al. and others, TREC 2011–2016. [trec.nist.gov/pubs/trec23/papers/overview-clinical.pdf](https://trec.nist.gov/pubs/trec23/papers/overview-clinical.pdf) | Background lineage for cohort/query retrieval evaluation in clinical IR; evaluation-campaign overviews, not classification schemas — context only, not a schema to build on directly. | Background reading only — cite in a related-work section for context; do not build the schema or router directly on this. |
