# Previous Requests Revision — README (draft)

## Background

The data clinic receives requests from clinicians who want to extract or analyse patient data for audits, service evaluations, and research (e.g. "how many patients with X diagnosis received Y treatment"). Answering these requests currently means someone manually works out what data is needed and how to get it — there's no shared record of what's been asked before or how it was solved.

Separately, the [Classifier idea](../Classifier%20plan%20and%20rationale.md) is trying to build a router that picks the cheapest method (SQL, MedCAT, regex, or — rarely, since it costs money — an LLM) for a given request, based on evidence rather than guesswork. That router needs a benchmark: real past requests with a known correct answer to test each method against.

**Previous Requests Revision** is where that benchmark material comes from. It's a catalogue of 156 real past requests (from `projects to 23-07-2026.docx`), grouped into three tables by how the clinician originally flagged them:

1. **Clinician-curated to start** (highlighted yellow) — the requests the clinician suggested tackling first.
2. **Complex requests** (highlighted blue/turquoise) — requests the clinician flagged as harder.
3. **Everything else**.

Each request keeps its original project number and name. Three columns are left blank for now, to be filled in later:

- **Datatype (my version)** — what data/fields I judge are needed to answer the request.
- **Datatype (SQL version)** — what a straightforward SQL query against the database would need.
- **Datatype (clinician's version)** — what the clinician who made the request thinks is needed.

Comparing these three per request should surface where a simple SQL approach is enough, and where it isn't — which is exactly the signal the Classifier's benchmark stage needs.

## Steps (draft — to discuss)

1. ~~Catalogue all 156 requests and group them by complexity~~ (done — `Previous Requests Revision.md`).
2. Fill in the three datatype columns for each request.
3. Compare the three versions per request to spot gaps and mismatches (e.g. where SQL alone would miss something the clinician needed).
4. Turn the results into curated gold answers for the Classifier benchmark (stage 1 of the [Classifier plan](../Classifier%20plan%20and%20rationale.md)).
5. Feed findings back into the Classifier's rule table (stage 3), so future requests get routed based on real evidence from this catalogue.

*This is a first draft to anchor discussion — background, terminology, and steps above are all open to correction.*
