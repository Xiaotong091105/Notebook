"""Reference systems the in-house index is measured against.

- SQLite FTS5 (stdlib): always available, used for latency/size comparison.
- Pyserini/Lucene (optional): needs Java and `pip install pyserini`. Building an
  index writes files under indexes/ and is never run automatically.
"""
import json
import shutil
import sqlite3
import subprocess
import sys
from pathlib import Path

PROJECT_ROOT = Path(__file__).parent.parent
INDEXES_DIR = PROJECT_ROOT / "indexes"


class FTS5Reference:
    """Contentless FTS5 table, so its size is comparable to an index."""

    def __init__(self, documents: dict[str, str]):
        self.conn = sqlite3.connect(":memory:")
        self.conn.execute("CREATE VIRTUAL TABLE docs USING fts5(body, content='')")
        self.doc_ids = list(documents)
        self.conn.executemany(
            "INSERT INTO docs(rowid, body) VALUES (?, ?)",
            ((i, documents[d]) for i, d in enumerate(self.doc_ids)))
        self.conn.commit()

    def search(self, term: str) -> set[str]:
        rows = self.conn.execute("SELECT rowid FROM docs WHERE docs MATCH ?", (f'"{term}"',)).fetchall()
        return {self.doc_ids[r[0]] for r in rows}

    def phrase(self, words: list[str]) -> set[str]:
        return self.search(" ".join(words))

    def size_bytes(self) -> int:
        return (self.conn.execute("PRAGMA page_count").fetchone()[0]
                * self.conn.execute("PRAGMA page_size").fetchone()[0])


def java_available() -> bool:
    return shutil.which("java") is not None


class PyseriniReference:
    """Lucene index via Pyserini. Raises RuntimeError with setup hints if Java
    or pyserini is missing."""

    def __init__(self, documents: dict[str, str], name: str = "lucene_ref"):
        if not java_available():
            raise RuntimeError("Java not found on PATH; install JDK 11+ (see docs/setup.md).")
        try:
            from pyserini.search.lucene import LuceneSearcher  # noqa: F401
        except ImportError as exc:
            raise RuntimeError("pip install pyserini (see docs/setup.md).") from exc
        corpus_dir = INDEXES_DIR / f"{name}_corpus"
        index_dir = INDEXES_DIR / name
        corpus_dir.mkdir(parents=True, exist_ok=True)
        with (corpus_dir / "docs.jsonl").open("w", encoding="utf-8") as f:
            for doc_id, text in documents.items():
                f.write(json.dumps({"id": doc_id, "contents": text}) + "\n")
        subprocess.run(
            [sys.executable, "-m", "pyserini.index.lucene", "--collection", "JsonCollection",
             "--input", str(corpus_dir), "--index", str(index_dir),
             "--generator", "DefaultLuceneDocumentGenerator", "--threads", "1", "--storePositions"],
            check=True)
        from pyserini.search.lucene import LuceneSearcher
        self.searcher = LuceneSearcher(str(index_dir))
        self.index_dir = index_dir

    def search(self, term: str, k: int = 100000) -> set[str]:
        return {hit.docid for hit in self.searcher.search(term, k=k)}

    def size_bytes(self) -> int:
        return sum(p.stat().st_size for p in self.index_dir.rglob("*") if p.is_file())
