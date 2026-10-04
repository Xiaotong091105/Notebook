"""Brute-force reference scanners, used only to verify the inverted index
(ground truth) and as the latency baseline, not as competing retrieval methods.

Two scanners with different jobs:
- regex_scan: INDEPENDENT oracle. Matches whole words in the raw lowercased
  text with a regex and never calls tokenize(), so a tokenizer bug cannot hide
  by appearing in both the index and the check.
- linear_scan: tokenizes every document per query (the fair "no index"
  latency baseline). Shares tokenize() with the index, so it is NOT a
  correctness oracle.
"""
import re

from indexing.inverted_index import tokenize


def regex_scan(documents: dict[str, str], term: str) -> set[str]:
    """Documents containing `term` as a whole alphanumeric word."""
    pattern = re.compile(rf"(?<![a-z0-9]){re.escape(term.lower())}(?![a-z0-9])")
    return {doc_id for doc_id, text in documents.items() if pattern.search(text.lower())}


def regex_phrase_scan(documents: dict[str, str], words: list[str]) -> set[str]:
    """Documents where `words` occur adjacently (separated by non-alphanumerics)."""
    sep = r"[^a-z0-9]+"
    pattern = re.compile(
        r"(?<![a-z0-9])" + sep.join(re.escape(w.lower()) for w in words) + r"(?![a-z0-9])"
    )
    return {doc_id for doc_id, text in documents.items() if pattern.search(text.lower())}


def linear_scan(documents: dict[str, str], term: str) -> set[str]:
    term = term.lower()
    matches = set()
    for doc_id, text in documents.items():
        if term in tokenize(text):
            matches.add(doc_id)
    return matches
