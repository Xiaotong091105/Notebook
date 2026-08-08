# 2026-08-08 — Chat summary: clarify `_index.md` selection rule

## Context

A PR review comment on the "Previous Requests Revision" work flagged that `CLAUDE.md` described `_index.md` as indexing "the concept/learning-map docs," which understates its scope — `_index.md` actually spans all project folders (Concepts, Action, Memo, Ideas, Learning-maps), and the real selection rule is file format, not folder: only the curated `.md` file in each folder is indexed, not any `.epub`/`.plain.md`/`covers/` siblings. Those extra files are leftover output from a local, gitignored EPUB-conversion script and won't exist in a fresh clone.

## What was done

1. Updated `CLAUDE.md` to replace "concept/learning-map" with "Markdown," explicitly naming the format-based selection rule and its exclusions.
2. Created `Action/2026-08-08.md` logging today's actions (the Previous Requests Revision doc, the review, and the CLAUDE.md clarification).
3. Added a 2026-08-08 entry to `_index.md` under Action.
4. Committed and pushed the changes to `add-previous-requests-revision` (commit `8c4f8de`).

## Outcome

`CLAUDE.md`'s working conventions now correctly describe `_index.md`'s scope and selection rule, removing the outdated two-folder implication.
