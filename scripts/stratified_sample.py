"""Stratified random sampling of categorised data-clinic requests.

Draws a representative random sample of requests from
``categoried-requests.json``, preserving the real proportions of both the
``asked-question`` axis and the ``medical-topic`` axis.
"""

import argparse
import json
import random
import sys
from collections import Counter
from pathlib import Path


AXES = ("asked-question", "medical-topic")

DEFAULT_INPUT_PATH = (
    Path(__file__).resolve().parent.parent / "Ideas" / "Requests" / "categoried-requests.json"
)


class StalledSampleError(Exception):
    """Raised when the draw loop stalls: some axis/category still needs
    more requests, but no eligible candidate remains in the pool."""


class VerificationError(Exception):
    """Raised by verify_sample when an achieved-vs-target or
    reproducibility assertion fails."""


def _format_request_id(raw_id):
    return f"R-{int(raw_id):03d}"


def load_requests(path):
    """Load categoried-requests.json and reconstruct per-request labels.

    The input file holds two rows per request-id (one per axis: an
    ``asked-question`` row and a ``medical-topic`` row). This collapses
    those pairs into a single record per request-id.

    Returns a dict keyed by formatted request-id (e.g. "R-042") mapping to
    {"request-id": ..., "asked-question": ..., "medical-topic": ...}.
    """
    with open(path) as f:
        rows = json.load(f)

    records = {}
    for row in rows:
        request_id = _format_request_id(row["request-id"])
        record = records.setdefault(request_id, {"request-id": request_id})
        record[row["axes"]] = row["category"]

    return records


def _largest_remainder_round(counts, n, total):
    """Round each category's proportional share of n down, then distribute
    the remaining slots to the categories with the largest fractional
    remainder, so the results sum exactly to n."""
    exact = {category: n * count / total for category, count in counts.items()}
    floors = {category: int(value) for category, value in exact.items()}
    remainder = n - sum(floors.values())

    remainders = sorted(
        exact.keys(), key=lambda category: exact[category] - floors[category], reverse=True
    )
    for category in remainders[:remainder]:
        floors[category] += 1

    return floors


def compute_targets(records, n):
    """Compute per-axis, per-category sample targets proportional to each
    category's share of all records, scaled to n and rounded with
    largest-remainder rounding so each axis's targets sum exactly to n.
    """
    total = len(records)
    targets = {}
    for axis in AXES:
        counts = Counter(record[axis] for record in records.values())
        targets[axis] = _largest_remainder_round(counts, n, total)
    return targets


def _is_eligible(record, achieved, targets):
    return all(
        achieved[axis][record[axis]] < targets[axis].get(record[axis], 0)
        for axis in AXES
    )


def _find_blocked_target(records, pool, achieved, targets):
    """Find an axis/category that still needs more requests but has no
    eligible candidate remaining in the pool, for reporting a stall.

    Because every accepted draw advances both axes' achieved counts in
    lockstep, a genuine stall commonly blocks a category on both axes at
    once. Axes are checked in a fixed order (medical-topic before
    asked-question) so the report is deterministic when that happens.
    """
    for axis in reversed(AXES):
        for category, target in targets[axis].items():
            needed = target - achieved[axis][category]
            if needed <= 0:
                continue
            eligible_count = sum(
                1
                for request_id in pool
                if records[request_id][axis] == category
                and _is_eligible(records[request_id], achieved, targets)
            )
            if eligible_count == 0:
                return axis, category, needed
    return None


def draw_sample(records, targets, rng):
    """Draw a stratified random sample guarding both axis counters.

    Repeatedly draws a candidate uniformly at random from the pool of
    not-yet-selected request-ids. A candidate is accepted only if both its
    asked-question counter and its medical-topic counter are still under
    target; otherwise it is put back (left in the pool) and another draw is
    made. No request-id is selected more than once.

    If the remaining pool cannot satisfy the remaining targets, raises
    StalledSampleError reporting which axis/category is blocked instead of
    looping forever.
    """
    n = sum(targets[AXES[0]].values())
    pool = list(records.keys())
    achieved = {axis: Counter() for axis in AXES}
    selected = []

    while len(selected) < n:
        if not pool:
            blocked = _find_blocked_target(records, pool, achieved, targets)
            if blocked is not None:
                axis, category, needed = blocked
                raise StalledSampleError(
                    f'stalled: {axis} "{category}" needs {needed} more but '
                    "0 eligible candidates remain"
                )
            raise StalledSampleError("stalled: pool exhausted before targets were met")
        candidate = rng.choice(pool)
        record = records[candidate]
        if _is_eligible(record, achieved, targets):
            for axis in AXES:
                achieved[axis][record[axis]] += 1
            selected.append(candidate)
            pool.remove(candidate)
        else:
            blocked = _find_blocked_target(records, pool, achieved, targets)
            if blocked is not None:
                axis, category, needed = blocked
                raise StalledSampleError(
                    f'stalled: {axis} "{category}" needs {needed} more but '
                    "0 eligible candidates remain"
                )

    return selected


def sample(path, n, seed=None):
    """Load requests from path, compute per-axis targets for n, and draw a
    reproducible stratified sample using the given random seed."""
    records = load_requests(path)
    targets = compute_targets(records, n)
    rng = random.Random(seed)
    return draw_sample(records, targets, rng=rng)


def _compute_summary(records, selected_ids, targets):
    achieved = {axis: Counter() for axis in AXES}
    for request_id in selected_ids:
        record = records[request_id]
        for axis in AXES:
            achieved[axis][record[axis]] += 1

    summary = {}
    for axis in AXES:
        summary[axis] = {
            category: {"achieved": achieved[axis][category], "target": target}
            for category, target in targets[axis].items()
        }
    return summary


def _render_markdown(records, selected_ids, summary, seed, n):
    lines = [f"# Stratified sample (n={n}, seed={seed})", ""]

    lines.append("| request-id | asked-question | medical-topic |")
    lines.append("|------------|-----------------|----------------|")
    for request_id in selected_ids:
        record = records[request_id]
        lines.append(
            f"| {request_id} | {record['asked-question']} | {record['medical-topic']} |"
        )
    lines.append("")

    for axis in AXES:
        lines.append(f"## {axis} summary")
        lines.append("| category | achieved | target |")
        lines.append("|----------|----------|--------|")
        for category, counts in summary[axis].items():
            achieved = counts["achieved"]
            target = counts["target"]
            mark = " ✓" if achieved == target else ""
            lines.append(f"| {category} | {achieved} | {target}{mark} |")
        lines.append("")

    return "\n".join(lines).rstrip() + "\n"


def write_output(records, selected_ids, targets, seed, n, output_dir):
    """Write the paired .json and .md output files for a completed draw.

    Both files share the base filename ``sample-n{n}-seed{seed}`` and are
    regenerated (overwritten) on every call.
    """
    output_dir = Path(output_dir)
    base_name = f"sample-n{n}-seed{seed}"
    json_path = output_dir / f"{base_name}.json"
    md_path = output_dir / f"{base_name}.md"

    summary = _compute_summary(records, selected_ids, targets)
    selected = [records[request_id] for request_id in selected_ids]

    payload = {
        "seed": seed,
        "n": n,
        "selected": selected,
        "summary": summary,
    }
    json_path.write_text(json.dumps(payload, indent=2))

    md_text = _render_markdown(records, selected_ids, summary, seed, n)
    md_path.write_text(md_text)

    return json_path, md_path


def verify_sample(path, n, seed, sample_fn=sample):
    """Verify a draw: achieved marginal counts must equal the computed
    targets on both axes, the same seed must reproduce an identical
    sample, and a different seed must produce a different one.

    Returns True if all assertions pass; raises VerificationError naming
    the mismatching axis/category (or reproducibility assertion) if not.
    """
    records = load_requests(path)
    targets = compute_targets(records, n)

    selected_a = sample_fn(path, n, seed)
    summary = _compute_summary(records, selected_a, targets)
    for axis in AXES:
        for category, counts in summary[axis].items():
            if counts["achieved"] != counts["target"]:
                raise VerificationError(
                    f'{axis} "{category}" achieved {counts["achieved"]} '
                    f'!= target {counts["target"]}'
                )

    selected_b = sample_fn(path, n, seed)
    if selected_a != selected_b:
        raise VerificationError(
            f"same-seed runs (seed={seed}) produced different samples"
        )

    selected_c = sample_fn(path, n, seed + 1)
    if selected_a == selected_c:
        raise VerificationError(
            f"different seeds ({seed} and {seed + 1}) produced the same sample"
        )

    return True


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", default=str(DEFAULT_INPUT_PATH))
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument("--seed", type=int, default=None)
    parser.add_argument("--verify", action="store_true")
    parser.add_argument("--output-dir", default=".")
    args = parser.parse_args(argv)

    if args.verify:
        try:
            verify_sample(args.input, args.n, args.seed)
        except (VerificationError, StalledSampleError) as exc:
            print(f"verify failed: {exc}", file=sys.stderr)
            return 1
        print(f"verify passed: n={args.n} seed={args.seed}")
        return 0

    try:
        selected_ids = sample(args.input, args.n, args.seed)
    except StalledSampleError as exc:
        print(f"stalled sample: {exc}", file=sys.stderr)
        return 1
    records = load_requests(args.input)
    targets = compute_targets(records, args.n)
    json_path, md_path = write_output(
        records, selected_ids, targets, args.seed, args.n, args.output_dir
    )
    print(f"wrote {json_path} and {md_path}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
