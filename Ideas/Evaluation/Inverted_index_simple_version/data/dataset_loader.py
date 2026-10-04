"""Loads a dataset per schema_config.json and produces {doc_id: concatenated_text}
plus the raw rows, so indexing code never needs to know column names directly.
"""
import csv
import json
from pathlib import Path

CONFIG_PATH = Path(__file__).parent / "schema_config.json"


def load_schema(profile: str = "mock") -> dict:
    with CONFIG_PATH.open(encoding="utf-8") as f:
        config = json.load(f)
    if profile not in config:
        raise KeyError(f"Unknown schema profile '{profile}'. Known: {list(config)}")
    return config[profile]


def load_documents(profile: str = "mock") -> dict[str, str]:
    """Returns {doc_id: concatenated free-text} for the given schema profile."""
    schema = load_schema(profile)
    file_path = Path(__file__).parent.parent / schema["file_path"]
    id_col = schema["id_column"]
    text_cols = schema["text_columns"]

    documents = {}
    with file_path.open(encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            doc_id = row[id_col]
            text = " ".join(row.get(col, "") or "" for col in text_cols)
            documents[doc_id] = text
    return documents


def load_rows(profile: str = "mock") -> list[dict]:
    """Returns the raw rows (structured + text columns) as a list of dicts."""
    schema = load_schema(profile)
    file_path = Path(__file__).parent.parent / schema["file_path"]
    with file_path.open(encoding="utf-8") as f:
        return list(csv.DictReader(f))
