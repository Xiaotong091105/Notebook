"""Loads {doc_id: text} for a profile in schema_config.json (zipf / synthea_notes /
mimic_note). CSV and JSONL are supported; indexing code never sees column names.
"""
import csv
import json
import sys
from pathlib import Path

CONFIG_PATH = Path(__file__).parent / "schema_config.json"
PROJECT_ROOT = Path(__file__).parent.parent

csv.field_size_limit(min(sys.maxsize, 2**31 - 1))  # real notes can exceed the 128 KB default


def load_schema(profile: str) -> dict:
    with CONFIG_PATH.open(encoding="utf-8") as f:
        config = json.load(f)
    if profile not in config:
        raise KeyError(f"Unknown profile '{profile}'. Known: {list(config)}")
    return config[profile]


def _iter_rows(path: Path, fmt: str):
    with path.open(encoding="utf-8", newline="") as f:
        if fmt == "csv":
            yield from csv.DictReader(f)
        elif fmt == "jsonl":
            for line in f:
                if line.strip():
                    yield json.loads(line)
        else:
            raise ValueError(f"Unsupported format '{fmt}'")


def load_documents(profile: str, limit: int | None = None) -> dict[str, str]:
    schema = load_schema(profile)
    path = PROJECT_ROOT / schema["file_path"]
    if not path.exists():
        raise FileNotFoundError(
            f"{path} not found. See docs/setup.md for how to obtain/generate the '{profile}' data.")
    documents = {}
    for i, row in enumerate(_iter_rows(path, schema["format"])):
        if limit is not None and i >= limit:
            break
        documents[str(row[schema["id_column"]])] = " ".join(
            row.get(col, "") or "" for col in schema["text_columns"])
    return documents
