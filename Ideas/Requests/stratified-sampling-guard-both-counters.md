---
question: "Why must you check both axis counters on every draw, instead of filling one axis first?"
tags: [sampling, corpus-construction, gold-standard]
focus_paper: roberts-2008-clef-corpus
related_papers: []
unwired_related: []
status: reviewed
fact_checked: true
fact_checked_on: "2026-07-19"
fact_checked_by: "Flash Hu"
last_updated: 2026-07-19
---

# Why must you check both axis counters on every draw, instead of filling one axis first?

## Short answer

Because filling one feature to its target before you start on the second
lets chance ruin the second feature, with no way to fix it. If you draw
"To GP" letters until that row is full, the cancer types of those letters
are left to luck — you could end up with 20 Breast and 0 Digestive, and by
then all 24 slots are spent. The fix is simple: on **every** single draw,
check **both** counters, and throw the document back if **either** of its
two groups is already full. That way the second feature acts as a brake the
whole time, not just at the end. This is the drawing rule behind the method
in [[stratified-sampling-balance-two-axes]].

## Evidence walk

A natural but wrong loop is: build both target tables, then fill one
subtype at a time — draw "To GP" narratives until the To-GP row is full
(counting cancer types only as a bystander), then move to the next subtype.

The spirit is right (draw randomly, count both axes, stop when a group is
full), but there is one flaw: **finishing one subtype row before starting
the next gives the cancer-type axis no say during that stage.** By chance
your 24 To-GP letters could come out 20 Breast / 0 Digestive. Now Digestive
is starving, and 24 of your 50 slots are already used — unfixable. One axis
was satisfied at the other's expense.

**The fix — guard both counters on every draw:**

1. Draw one random narrative.
2. Read its two labels (for example "To GP + Breast").
3. Keep it only if the To-GP row **and** the Breast column are both still
   under target; otherwise throw it back and redraw.
4. Repeat until all 50 slots are filled and every row and column total is
   satisfied.

Why the single guard matters: near the end, if Digestive is already full
but you still need 2 more To-GP letters, a "To GP + Digestive" draw must be
**rejected** (Digestive is full). The one-axis-first version would accept it
and overshoot Digestive. Checking both counters on every draw is exactly
what protects the second axis.

## Caveats / open questions

- [[roberts-2008-clef-corpus]] does not print its exact draw procedure, so
  this loop is a reconstruction of a correct marginal-matching draw, not a
  quoted algorithm from the paper. It is the reasoning behind the numbers
  in Table 1, not a claim about the authors' code.

## Further reading

- [[stratified-sampling-balance-two-axes]] — the full two-axis balancing
  method this rule belongs to.
- [[stratified-sampling]] — the base idea of copying the corpus's real
  proportions.

## Fact-check log

**2026-07-19 — confirmed by Flash Hu.**

- **Layer A (quotes):** no direct paper quotes in this note.
- **Layer B (claims):**
  - The note is an explicit reconstruction of a correct marginal-matching
    draw, not a quoted algorithm — the paper does not print its draw
    procedure (flagged in-text and in the Caveats). CONFIRMED as a fair
    reconstruction, consistent with
    [[stratified-sampling-balance-two-axes]].
  - The endgame reasoning (reject a draw when either counter is full)
    follows logically from the marginal targets; no external source needed.

Applies to the content as of 2026-07-19; re-run Layer B for anything edited
after this date.
