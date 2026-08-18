---
title: "Non-verify CLI run crashes with unhandled traceback on stall instead of a clean report"
status: fixed
original_story: "[[001-stratified-random-sampling-script]]"
ac: 4
found: 2026-08-18
---

# Bug

## Expected

When the plain (non `--verify`) CLI path stalls (the draw loop cannot
satisfy the remaining targets from the remaining pool), the script detects
the stall and reports which axis/category is blocked, e.g.:

```
stalled: medical-topic "Sarcoma" needs 2 more but 0 eligible candidates remain
```

with a non-zero exit code and no partial output files written, matching the
clean handling that AC 4 (Termination) requires and that the `--verify`
branch already provides.

## Actual

Running `python3 scripts/stratified_sample.py --n 30 --seed 7` (no
`--verify`) raises an uncaught `StalledSampleError`, dumping a full Python
traceback to stderr with exit code 1. Only the `--verify` code path in
`main()` (previously lines 292-299) catches `StalledSampleError`; the plain
sampling path (previously lines 301-307) has no `try`/`except` around the
call to `sample()`.

## Reproduction

`n=30 --seed 7` (as stated in the story's `bugs:` entry) does not actually
stall — it completes successfully. To find a genuine stall, a small script
searched `n` in `[2, 156)` and `seed` in `[1, 50)` for a combination that
raises `StalledSampleError`, and found `n=5, seed=3`.

Command:

```
cd /Users/husongtao/Projects/Notebook && python3 scripts/stratified_sample.py --n 5 --seed 3
```

Observed output (verbatim) before fix — raw unhandled traceback, exit code 1:

```
Traceback (most recent call last):
  File "/Users/husongtao/Projects/Notebook/scripts/stratified_sample.py", line 312, in <module>
    sys.exit(main())
             ^^^^^^
  File "/Users/husongtao/Projects/Notebook/scripts/stratified_sample.py", line 301, in main
    selected_ids = sample(args.input, args.n, args.seed)
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/husongtao/Projects/Notebook/scripts/stratified_sample.py", line 174, in sample
    return draw_sample(records, targets, rng=rng)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/husongtao/Projects/Notebook/scripts/stratified_sample.py", line 160, in draw_sample
    raise StalledSampleError(
StalledSampleError: stalled: medical-topic "Operational / service / equity / documentation" needs 1 more but 0 eligible candidates remain
```

Exit code: 1 (accidental, via unhandled exception, not intentional
handling). No `.json`/`.md` output files are written (correct behavior,
but for the wrong reason — the crash happens before `write_output` is
reached).

## Fix

Wrapped the plain (non `--verify`) sampling call in `main()` in a
`try`/`except StalledSampleError` block, printing `stalled sample: {exc}`
to stderr and returning exit code 1, mirroring the existing `--verify`
branch's handling. See `scripts/stratified_sample.py`.
