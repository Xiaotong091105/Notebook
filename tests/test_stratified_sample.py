import json
from collections import Counter
from pathlib import Path

import pytest

from scripts.stratified_sample import (
    StalledSampleError,
    VerificationError,
    compute_targets,
    draw_sample,
    load_requests,
    main,
    sample,
    verify_sample,
    write_output,
)


@pytest.fixture
def sample_data_file(tmp_path):
    rows = [
        {
            "request-id": 42,
            "category": "Treatment Pattern & Safety",
            "axes": "asked-question",
            "summary": "some summary",
        },
        {
            "request-id": 42,
            "category": "Sarcoma",
            "axes": "medical-topic",
            "summary": "some summary",
        },
        {
            "request-id": 108,
            "category": "Outcome, Response & Survival",
            "axes": "asked-question",
            "summary": "another summary",
        },
        {
            "request-id": 108,
            "category": "Gynaecological cancer",
            "axes": "medical-topic",
            "summary": "another summary",
        },
    ]
    path = tmp_path / "categoried-requests.json"
    path.write_text(json.dumps(rows))
    return path


def test_load_requests_reconstructs_pair_of_labels_per_request_id(sample_data_file):
    records = load_requests(sample_data_file)

    assert records["R-042"] == {
        "request-id": "R-042",
        "asked-question": "Treatment Pattern & Safety",
        "medical-topic": "Sarcoma",
    }
    assert records["R-108"] == {
        "request-id": "R-108",
        "asked-question": "Outcome, Response & Survival",
        "medical-topic": "Gynaecological cancer",
    }
    assert len(records) == 2


def _build_records(asked_question_counts, medical_topic_counts):
    """Build a 156-record dict from per-axis category counts (independent)."""
    aq_labels = []
    for category, count in asked_question_counts.items():
        aq_labels.extend([category] * count)
    mt_labels = []
    for category, count in medical_topic_counts.items():
        mt_labels.extend([category] * count)

    assert len(aq_labels) == len(mt_labels) == 156

    records = {}
    for i in range(156):
        request_id = f"R-{i + 1:03d}"
        records[request_id] = {
            "request-id": request_id,
            "asked-question": aq_labels[i],
            "medical-topic": mt_labels[i],
        }
    return records


def test_compute_targets_uses_largest_remainder_rounding_and_sums_to_n():
    # Chosen so plain rounding of each category individually would sum to 9,
    # not 10 -- largest-remainder rounding is required to hit n exactly.
    asked_question_counts = {"A": 70, "B": 50, "C": 36}
    medical_topic_counts = {"Sarcoma": 9, "Other": 147}
    records = _build_records(asked_question_counts, medical_topic_counts)

    targets = compute_targets(records, n=10)

    assert targets["asked-question"] == {"A": 5, "B": 3, "C": 2}
    assert sum(targets["asked-question"].values()) == 10

    targets_30 = compute_targets(records, n=30)
    assert targets_30["medical-topic"]["Sarcoma"] == 2
    assert sum(targets_30["medical-topic"].values()) == 30


class _ScriptedRng:
    """A stand-in for random.Random that returns a pre-scripted sequence of
    choices, so a draw loop's exact sequence of draws can be controlled and
    asserted on in a test."""

    def __init__(self, scripted_choices):
        self._queue = list(scripted_choices)

    def choice(self, pool):
        candidate = self._queue.pop(0)
        assert candidate in pool, f"{candidate} not in pool {pool}"
        return candidate


def test_draw_sample_rejects_candidate_when_either_axis_counter_is_at_target():
    # R-001's medical-topic ("Sarcoma") is already at its target (0), so it
    # must be rejected and put back even though its asked-question axis
    # ("AQ-A") still has room. R-002 (medical-topic "Other") is then drawn
    # and accepted.
    records = {
        "R-001": {"request-id": "R-001", "asked-question": "AQ-A", "medical-topic": "Sarcoma"},
        "R-002": {"request-id": "R-002", "asked-question": "AQ-A", "medical-topic": "Other"},
    }
    targets = {
        "asked-question": {"AQ-A": 1},
        "medical-topic": {"Sarcoma": 0, "Other": 1},
    }
    # Scripted draws: R-001 (rejected, put back), R-001 again (rejected
    # again since it's still in the pool), then R-002 (accepted).
    rng = _ScriptedRng(["R-001", "R-001", "R-002"])

    selected = draw_sample(records, targets, rng=rng)

    assert selected == ["R-002"]
    assert len(selected) == len(set(selected))


def test_draw_sample_stops_successfully_when_all_targets_are_met_exactly():
    records = {
        "R-001": {"request-id": "R-001", "asked-question": "AQ-A", "medical-topic": "Sarcoma"},
        "R-002": {"request-id": "R-002", "asked-question": "AQ-B", "medical-topic": "Other"},
    }
    targets = {
        "asked-question": {"AQ-A": 1, "AQ-B": 1},
        "medical-topic": {"Sarcoma": 1, "Other": 1},
    }
    rng = _ScriptedRng(["R-001", "R-002"])

    selected = draw_sample(records, targets, rng=rng)

    assert sorted(selected) == ["R-001", "R-002"]
    achieved = {axis: Counter() for axis in ("asked-question", "medical-topic")}
    for request_id in selected:
        for axis in ("asked-question", "medical-topic"):
            achieved[axis][records[request_id][axis]] += 1
    for axis, category_targets in targets.items():
        for category, target in category_targets.items():
            assert achieved[axis][category] == target


def test_draw_sample_detects_stall_and_reports_blocked_axis_category():
    # Both remaining requests carry medical-topic "Sarcoma" (which still
    # needs 2 more) but their asked-question category "Full-AQ" is already
    # at its target of 0, so neither can ever be accepted.
    records = {
        "R-001": {"request-id": "R-001", "asked-question": "Full-AQ", "medical-topic": "Sarcoma"},
        "R-002": {"request-id": "R-002", "asked-question": "Full-AQ", "medical-topic": "Sarcoma"},
    }
    targets = {
        "asked-question": {"Full-AQ": 0, "Other-AQ": 2},
        "medical-topic": {"Sarcoma": 2, "Other-MT": 0},
    }
    rng = _ScriptedRng(["R-001"])

    with pytest.raises(StalledSampleError) as exc_info:
        draw_sample(records, targets, rng=rng)

    assert (
        str(exc_info.value)
        == 'stalled: medical-topic "Sarcoma" needs 2 more but 0 eligible candidates remain'
    )


REAL_DATA_PATH = Path(__file__).resolve().parent.parent / "Ideas" / "Requests" / "categoried-requests.json"


def test_sample_with_same_seed_reproduces_identical_sample_different_seed_differs():
    # Seeds 3 and 6 are known (empirically, against the real data file) not
    # to hit the AC-4 stall condition for n=30, unlike some other seeds.
    result_a = sample(REAL_DATA_PATH, n=30, seed=3)
    result_b = sample(REAL_DATA_PATH, n=30, seed=3)
    result_c = sample(REAL_DATA_PATH, n=30, seed=6)

    assert result_a == result_b
    assert result_a != result_c
    assert len(result_a) == 30


def test_write_output_writes_paired_json_and_md_files(tmp_path):
    records = {
        "R-042": {
            "request-id": "R-042",
            "asked-question": "Treatment Pattern & Safety",
            "medical-topic": "Sarcoma",
        },
        "R-108": {
            "request-id": "R-108",
            "asked-question": "Outcome, Response & Survival",
            "medical-topic": "Gynaecological cancer",
        },
    }
    selected_ids = ["R-042", "R-108"]
    targets = {
        "asked-question": {
            "Treatment Pattern & Safety": 1,
            "Outcome, Response & Survival": 1,
        },
        "medical-topic": {"Sarcoma": 1, "Gynaecological cancer": 1},
    }

    json_path, md_path = write_output(
        records, selected_ids, targets, seed=7, n=2, output_dir=tmp_path
    )

    assert json_path == tmp_path / "sample-n2-seed7.json"
    assert md_path == tmp_path / "sample-n2-seed7.md"
    assert json_path.exists()
    assert md_path.exists()

    payload = json.loads(json_path.read_text())
    assert payload == {
        "seed": 7,
        "n": 2,
        "selected": [
            {
                "request-id": "R-042",
                "asked-question": "Treatment Pattern & Safety",
                "medical-topic": "Sarcoma",
            },
            {
                "request-id": "R-108",
                "asked-question": "Outcome, Response & Survival",
                "medical-topic": "Gynaecological cancer",
            },
        ],
        "summary": {
            "asked-question": {
                "Treatment Pattern & Safety": {"achieved": 1, "target": 1},
                "Outcome, Response & Survival": {"achieved": 1, "target": 1},
            },
            "medical-topic": {
                "Sarcoma": {"achieved": 1, "target": 1},
                "Gynaecological cancer": {"achieved": 1, "target": 1},
            },
        },
    }

    md_text = md_path.read_text()
    assert "# Stratified sample (n=2, seed=7)" in md_text
    assert "| request-id | asked-question | medical-topic |" in md_text
    assert "| R-042 | Treatment Pattern & Safety | Sarcoma |" in md_text
    assert "| R-108 | Outcome, Response & Survival | Gynaecological cancer |" in md_text
    assert "## asked-question summary" in md_text
    assert "| Treatment Pattern & Safety | 1 | 1 ✓ |" in md_text
    assert "## medical-topic summary" in md_text
    assert "| Sarcoma | 1 | 1 ✓ |" in md_text


def test_write_output_regenerates_files_on_every_run(tmp_path):
    records = {
        "R-001": {"request-id": "R-001", "asked-question": "AQ-A", "medical-topic": "MT-A"},
    }
    targets = {"asked-question": {"AQ-A": 1}, "medical-topic": {"MT-A": 1}}

    json_path, _ = write_output(records, ["R-001"], targets, seed=1, n=1, output_dir=tmp_path)
    first_payload = json.loads(json_path.read_text())

    records["R-001"]["asked-question"] = "AQ-B"
    targets["asked-question"] = {"AQ-A": 0, "AQ-B": 1}
    json_path_2, _ = write_output(records, ["R-001"], targets, seed=1, n=1, output_dir=tmp_path)
    second_payload = json.loads(json_path_2.read_text())

    assert json_path == json_path_2
    assert first_payload != second_payload
    assert second_payload["selected"][0]["asked-question"] == "AQ-B"


def test_verify_sample_succeeds_when_achieved_matches_target_and_seeds_reproduce():
    # Seeds 19 and 20 are known (empirically, against the real data file)
    # not to hit the AC-4 stall condition for n=30, so verify_sample's
    # internal seed and seed+1 draws both succeed.
    assert verify_sample(REAL_DATA_PATH, n=30, seed=19) is True


def test_verify_sample_fails_when_achieved_does_not_match_target(tmp_path):
    records_path = tmp_path / "categoried-requests.json"
    records_path.write_text(
        json.dumps(
            [
                {"request-id": 1, "category": "AQ-A", "axes": "asked-question"},
                {"request-id": 1, "category": "MT-A", "axes": "medical-topic"},
            ]
        )
    )

    def broken_sample_fn(path, n, seed):
        # Always returns an empty selection, so achieved never matches target.
        return []

    with pytest.raises(VerificationError) as exc_info:
        verify_sample(records_path, n=1, seed=1, sample_fn=broken_sample_fn)

    assert "achieved" in str(exc_info.value)
    assert "target" in str(exc_info.value)


def test_verify_sample_fails_when_same_seed_does_not_reproduce(tmp_path):
    records_path = tmp_path / "categoried-requests.json"
    records_path.write_text(
        json.dumps(
            [
                {"request-id": 1, "category": "AQ-A", "axes": "asked-question"},
                {"request-id": 1, "category": "MT-A", "axes": "medical-topic"},
            ]
        )
    )
    call_count = {"n": 0}

    def flaky_sample_fn(path, n, seed):
        call_count["n"] += 1
        return ["R-001"] if call_count["n"] == 1 else []

    with pytest.raises(VerificationError) as exc_info:
        verify_sample(records_path, n=1, seed=1, sample_fn=flaky_sample_fn)

    assert "same-seed" in str(exc_info.value)


def test_verify_sample_fails_when_different_seeds_produce_same_sample(tmp_path):
    records_path = tmp_path / "categoried-requests.json"
    records_path.write_text(
        json.dumps(
            [
                {"request-id": 1, "category": "AQ-A", "axes": "asked-question"},
                {"request-id": 1, "category": "MT-A", "axes": "medical-topic"},
            ]
        )
    )

    def seed_blind_sample_fn(path, n, seed):
        return ["R-001"]

    with pytest.raises(VerificationError) as exc_info:
        verify_sample(records_path, n=1, seed=1, sample_fn=seed_blind_sample_fn)

    assert "different seeds" in str(exc_info.value)


def test_main_verify_mode_exits_zero_on_success(capsys):
    exit_code = main(["--verify", "--n", "30", "--seed", "19", "--input", str(REAL_DATA_PATH)])
    assert exit_code == 0


def test_main_plain_mode_reports_stall_cleanly_instead_of_crashing(tmp_path, capsys):
    exit_code = main(
        [
            "--n",
            "5",
            "--seed",
            "3",
            "--input",
            str(REAL_DATA_PATH),
            "--output-dir",
            str(tmp_path),
        ]
    )

    assert exit_code != 0
    captured = capsys.readouterr()
    assert "stalled" in captured.err
    assert list(tmp_path.iterdir()) == []


def test_main_verify_mode_exits_nonzero_and_prints_message_on_failure(tmp_path, capsys):
    records_path = tmp_path / "categoried-requests.json"
    records_path.write_text(
        json.dumps(
            [
                {"request-id": 1, "category": "AQ-A", "axes": "asked-question"},
                {"request-id": 1, "category": "MT-A", "axes": "medical-topic"},
                {"request-id": 2, "category": "AQ-B", "axes": "asked-question"},
                {"request-id": 2, "category": "MT-B", "axes": "medical-topic"},
            ]
        )
    )

    exit_code = main(["--verify", "--n", "5", "--seed", "1", "--input", str(records_path)])

    assert exit_code != 0
    captured = capsys.readouterr()
    assert "verify failed" in captured.err
