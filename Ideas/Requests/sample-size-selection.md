---
title: "Selecting a reasonable sample size for starting annotation"
related_notes:
  - "[[stratified-sampling-guard-both-counters]]"
  - "[[stratified-sampling-balance-two-axes]]"
last_updated: 2026-08-18
---

# Selecting a reasonable sample size for starting annotation

## Why this needed checking

`scripts/stratified_sample.py` (built for
[[001-stratified-random-sampling-script]]) draws a stratified sample from
the 156 categorised data-clinic requests using a **guard-both-counters**
draw loop: it accepts a candidate only if both its `asked-question` and
`medical-topic` category counters are still under target, otherwise it puts
the candidate back and draws again. That rule is deliberate (see
[[stratified-sampling-guard-both-counters]]) — filling one axis before the
other lets chance starve categories on the second axis — but it comes with
a cost: the algorithm never backtracks. If, late in a draw, every remaining
candidate would overfill some category, the script raises `StalledSampleError`
instead of looping forever (AC 4).

Whether a given `n` stalls depends on the random draw order, not just on
`n` itself — the same `n` can succeed with one seed and stall with another.
So "what's a reasonable `n`" isn't answerable from the target math alone; it
has to be checked empirically against the real 156-request dataset.

## How we checked it

Swept a range of `n` values against 200 seeds each, using the script's own
`--verify` mode (which asserts achieved == target on both axes and exits
non-zero on a stall):

```bash
for seed in $(seq 1 200); do
  python3 scripts/stratified_sample.py --n 30 --seed "$seed" --verify
done
```

| n   | successes / 200 seeds | success rate |
|-----|------------------------|--------------|
| 20  | 43                     | ~21%         |
| 30  | 19                     | ~10%         |
| 40  | 22                     | ~11%         |
| 50  | ~10                    | ~5%          |
| 60+ | ~0                     | <1%          |

Two things fell out of this:

- **Larger `n` stalls more often, not less.** Bigger samples mean tighter
  per-category targets relative to the pool, so there's less slack for the
  draw loop to route around a near-full category — the opposite of the
  naive intuition that "more data to draw from = fewer problems."
- **No `n` is guaranteed to succeed on the first seed you try.** Even the
  best-behaved sizes (20–40) only clear a verified draw on roughly 1 in 5
  to 1 in 10 seeds. This is inherent to the no-backtracking algorithm on
  this dataset's skewed category sizes (e.g. some `medical-topic`
  categories have single-digit totals), not a bug — the fix from the AC 4
  bugfix (`bug-001-...`) made the stall *reported cleanly*, it didn't make
  stalls stop happening.

## What we picked, and why

**`n = 30`, `seed = 19`.**

- **Size:** 30 out of 156 (~19%) is large enough to place at least one
  request in nearly every category on both axes (only the rarest
  `medical-topic` categories land at 0), while staying small enough to
  review by hand as a first annotation batch — big enough to be
  representative, small enough not to be a burden before the process is
  validated.
- **Seed:** `seed=19` is one of the verified-successful seeds found in the
  sweep above — confirmed via `--verify` that achieved counts match targets
  exactly on both axes, and that the draw is reproducible (same seed →
  same sample every time).
- **Not the story's own example seed:** the worked example in
  [[001-stratified-random-sampling-script]] uses `seed=7`, but `seed=7`
  actually stalls against the real dataset (it was illustrative, not
  verified against real data) — this was noted during `_qa`'s original
  review and the `bug-001` reproduction. `seed=19` was chosen specifically
  because it's confirmed to work.

## The generated sample

Produced with:

```bash
python3 scripts/stratified_sample.py --n 30 --seed 19 --output-dir Ideas/Requests
```

- [`sample-n30-seed19.json`](sample-n30-seed19.json) — machine-readable:
  selected request-ids, both category labels, the achieved-vs-target
  summary, and the `seed`/`n` needed to reproduce it.
- [`sample-n30-seed19.md`](sample-n30-seed19.md) — the same selection and
  summary as human-readable tables, for reviewing before annotation starts.

Every category on both axes reads `achieved == target` in that output —
confirmed by `--verify` before generating the final files.

## If a bigger batch is needed later

Re-run the sweep pattern above for the desired `n`, pick a seed from the
verified successes, and generate with `--output-dir`. Don't assume the
next round-number `n` (40, 50, ...) will work on the first seed you try —
per the table above, stall rates only get worse as `n` grows without also
scanning seeds.
