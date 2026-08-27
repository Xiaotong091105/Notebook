# 2026-08-08 — Chat summary: NLPM config explained, decided not to install

## Context

A PR comment on Action Log #3 introduced `.claude/nlpm.local.md`, a new config file that sets up [NLPM](https://github.com/xiaolai/nlpm) (Natural-Language Programming Manager) — a linter for the markdown files that drive AI behavior (`CLAUDE.md`, skills, agents, rules), scoring them 0–100 with `strictness: standard` and a `score_threshold: 70`. The user asked what this meant, where the change lived, and whether it was actually working.

## What was done

1. Explained NLPM's purpose and what the `strictness`/`score_threshold` settings in the config do.
2. Investigated the repo and found `.claude/nlpm.local.md` exists only on the `Action` branch (commit `7610b5d`), not on `add-previous-requests-revision`; confirmed NLPM itself isn't installed anywhere in this repo or session — no skill, package, or command definitions exist beyond the static config file, so `/nlpm:score` couldn't actually be run.
3. When asked to run it, confirmed this limitation directly rather than faking output; explained NLPM would need to be installed from its GitHub repo first.
4. Gave a recommendation on whether to install it: hold off for now, since `CLAUDE.md` is still short and low-risk to eyeball, and NLPM is unverified third-party software — worth revisiting once more skills/agents/rules accumulate and cross-file consistency gets harder to track manually.

## Outcome

No repo changes were needed regarding NLPM itself — it remains an inert, unused config file on the `Action` branch. Decision: not installing NLPM at this time.
