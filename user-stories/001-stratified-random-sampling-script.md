---
title: "Stratified random sampling script for categorised requests"
status: draft
source_data: Ideas/Requests/categoried-requests.json
related_notes:
  - "[[stratified-sampling-guard-both-counters]]"
  - "[[stratified-sampling-balance-two-axes]]"
last_updated: 2026-08-18
qa_status: passing
---

# Stratified random sampling script for categorised requests

## Background

[Ideas/Requests/categoried-requests.json](../Ideas/Requests/categoried-requests.json)
holds 156 unique data-clinic requests (`request-id`). Each request is tagged
twice — once per axis:

- **`asked-question`** — 6 categories (e.g. "Treatment Pattern & Safety",
  "Outcome, Response & Survival", "Staging & Disease Extent", …).
- **`medical-topic`** — 19 categories (e.g. "Transplant / CAR-T / cellular
  therapy", "Gynaecological cancer", "Sarcoma", …).

This is the same two-axis shape as the CLEF corpus example worked through in
[[stratified-sampling-guard-both-counters]]: every unit carries exactly one
label on each axis, and a representative sample has to match both axes'
marginal proportions at once, not just one of them.

That note's conclusion is the design constraint for this script: filling one
axis's targets before touching the other lets chance starve categories on
the second axis, with no way to recover once slots run out. The draw loop
must check **both** axis counters on **every** draw, and reject (put back)
any request whose axis-category counter is already at target.

## User story

As a researcher reviewing the data-clinic request backlog, I want a script
that draws a representative random sample of requests from
`categoried-requests.json`, preserving the real proportions of both the
`asked-question` axis and the `medical-topic` axis, so that a manageable
subset can be reviewed in depth without skewing toward whichever categories
happen to get drawn first.

## Acceptance criteria

1. **Input.**
   - **Given** `categoried-requests.json` (two rows per `request-id`, one
     per axis) and a desired total sample size `n` (n ≤ 156),
   - **When** the script loads the input,
   - **Then** it reconstructs, per `request-id`, the pair of labels
     (`asked-question` category, `medical-topic` category) from the two
     rows sharing that id.
   - **Example:** the two rows tagged `request-id: R-042` — one row with
     `asked-question: "Treatment Pattern & Safety"`, the other with
     `medical-topic: "Sarcoma"` — collapse into a single reconstructed
     record `R-042 → (Treatment Pattern & Safety, Sarcoma)`.

2. **Target tables.**
   - **Given** the reconstructed per-request labels and the requested `n`,
   - **When** the script computes targets before sampling starts,
   - **Then** for each axis it produces a target count per category
     proportional to that category's share of all 156 requests, scaled to
     `n` and rounded (e.g. largest-remainder rounding) so the per-axis
     targets sum exactly to `n`, and both target tables are printed or
     returned.
   - **Example:** for `n = 30`, if "Treatment Pattern & Safety" makes up
     52 of the 156 requests (33.3%), its target is `round(30 × 52/156) =
     10`; if "Sarcoma" makes up 9 of the 156 requests (5.8%), its target
     is `round(30 × 9/156) = 2`. The printed tables look like:

     ```
     asked-question targets (n=30)          medical-topic targets (n=30)
     Treatment Pattern & Safety      10     Sarcoma                    2
     Outcome, Response & Survival     7     Gynaecological cancer      3
     Staging & Disease Extent         5     Transplant/CAR-T/cell.     4
     ...                              ...   ...                       ...
     -----                            --    -----                     --
     total                           30     total                    30
     ```

3. **Guard-both-counters draw loop.**
   - **Given** the two target tables and a pool of not-yet-selected
     request-ids,
   - **When** the script draws a candidate uniformly at random from that
     pool,
   - **Then** it accepts the request only if **both** its
     `asked-question` counter and its `medical-topic` counter are still
     under target; otherwise it puts the candidate back and draws again,
     and no request-id is drawn more than once. This mirrors the rule in
     [[stratified-sampling-guard-both-counters]] — one axis is never
     filled ahead of the other.
   - **Example:** `R-042` (Treatment Pattern & Safety, Sarcoma) is drawn
     when the running counts are `Treatment Pattern & Safety: 9/10` and
     `Sarcoma: 1/2` — both under target, so it's accepted and the
     counters advance to `10/10` and `2/2`. If `Sarcoma` were already at
     `2/2`, `R-042` is rejected and put back even though its other axis
     still has room, and the script draws again.

4. **Termination.**
   - **Given** a draw loop in progress,
   - **When** all `n` slots become filled with every row and column
     target met exactly,
   - **Then** the loop stops successfully;
   - **and Given** the remaining pool cannot satisfy the remaining
     targets (e.g. an infeasible `n`/proportions combination),
   - **When** no eligible candidate remains for a draw,
   - **Then** the script detects the stall and reports which
     axis/category is blocked rather than looping forever.
   - **Example (success):** the 30th and final accepted request fills
     `Staging & Disease Extent` to `5/5`, the last still-open cell on
     either axis; the loop exits and every category on both tables reads
     `achieved == target`.
   - **Example (stall):** 2 slots remain, but every remaining
     not-yet-selected request tagged `medical-topic: "Sarcoma"` also
     carries `asked-question` categories that are already full; the
     script reports `stalled: medical-topic "Sarcoma" needs 2 more but 0
     eligible candidates remain` instead of looping forever.

5. **Reproducibility.**
   - **Given** the same input file, `n`, and an optional random seed,
   - **When** the script is run twice with that same seed,
   - **Then** it returns the identical sample both times.
   - **Example:** `sample(n=30, seed=7)` run today and run again next
     week both return the same 30 `request-id`s in the same draw order;
     `sample(n=30, seed=8)` returns a different set of 30.

6. **Output.**
   - **Given** a completed draw,
   - **When** the script reports results,
   - **Then** it writes two paired files: a `.json` file holding the
     selected `request-id`s with both category labels, the achieved-vs-
     target summary per category on both axes (matching exactly per
     AC 3), and the `seed`/`n` used for that draw (so the sample is
     reproducible from the JSON file alone); and a `.md` file rendering
     the same selection and summary as human-readable tables, for
     reviewing without parsing JSON. Both files share the same base
     filename (e.g. `sample-n30-seed7.json` / `sample-n30-seed7.md`) and
     are regenerated together on every run.
   - **Example (`sample-n30-seed7.json`):**

     ```json
     {
       "seed": 7,
       "n": 30,
       "selected": [
         {"request-id": "R-042", "asked-question": "Treatment Pattern & Safety", "medical-topic": "Sarcoma"},
         {"request-id": "R-108", "asked-question": "Outcome, Response & Survival", "medical-topic": "Gynaecological cancer"}
       ],
       "summary": {
         "asked-question": {"Treatment Pattern & Safety": {"achieved": 10, "target": 10}},
         "medical-topic": {"Sarcoma": {"achieved": 2, "target": 2}}
       }
     }
     ```

     Re-running with `--seed 7 --n 30` reproduces this same file, and the
     `seed`/`n` recorded above are exactly the values to pass back in.

   - **Example (`sample-n30-seed7.md`):**

     ```markdown
     # Stratified sample (n=30, seed=7)

     | request-id | asked-question               | medical-topic          |
     |------------|-------------------------------|-------------------------|
     | R-042      | Treatment Pattern & Safety    | Sarcoma                 |
     | R-108      | Outcome, Response & Survival  | Gynaecological cancer   |

     ## asked-question summary
     | category                    | achieved | target |
     |------------------------------|---------|--------|
     | Treatment Pattern & Safety   | 10      | 10 ✓   |

     ## medical-topic summary
     | category  | achieved | target |
     |-----------|---------|--------|
     | Sarcoma   | 2       | 2 ✓    |
     ```

7. **Verification.**
   - **Given** a test or `--verify` run mode and at least one non-trivial
     `n`,
   - **When** the run completes,
   - **Then** the achieved marginal counts equal the computed targets on
     both axes;
   - **and Given** two runs with the same seed versus two runs with
     different seeds,
   - **When** their samples are compared,
   - **Then** the same-seed runs reproduce the identical sample while the
     different-seed runs produce a different one.
   - **Example:** `--verify --n 30 --seed 7` asserts
     `achieved["asked-question"] == target["asked-question"]` and same
     for `medical-topic`, then asserts `sample(seed=7) == sample(seed=7)`
     while `sample(seed=7) != sample(seed=8)`; the run exits non-zero and
     prints the mismatching category if any assertion fails.

## Out of scope

- Any weighting beyond simple proportional-to-marginal targets (e.g.
  oversampling rare categories) is not covered by this story.
- Reviewing or annotating the sampled requests themselves.
