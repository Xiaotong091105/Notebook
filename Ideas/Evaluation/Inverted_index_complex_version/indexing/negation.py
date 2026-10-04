"""Index-time assertion tagging: which term occurrences are negated?

Two taggers:
- window_negated_positions: dependency-free rule (NegEx-like). A term is negated
  if it follows a cue within WINDOW tokens with no sentence break between.
- medspacy_assertions: medSpaCy ConText (negation, family, historical) over a
  given target vocabulary. Requires `pip install medspacy`; untested here.

Evaluate either against a small hand-labelled set before trusting it
(evaluation/benchmark_complex.py reports precision/recall if
data/negation_labels.json exists).
"""
import re

WINDOW = 5
SINGLE_CUES = {"no", "not", "without", "denies", "denied", "none", "absent", "nil", "neg"}
PHRASE_CUES = [("negative", "for"), ("ruled", "out"), ("no", "evidence", "of"), ("free", "of")]
_SENTENCE_BREAK = re.compile(r"[.;:!?\n]")
_WORD = re.compile(r"[a-z0-9]+")


def window_negated_positions(text: str) -> set[int]:
    """Token positions (over `_WORD` tokens of the lowercased text) judged negated."""
    negated: set[int] = set()
    pos = 0
    for sentence in _SENTENCE_BREAK.split(text.lower()):
        tokens = _WORD.findall(sentence)
        i = 0
        while i < len(tokens):
            cue_len = 0
            for phrase in PHRASE_CUES:
                if tuple(tokens[i:i + len(phrase)]) == phrase:
                    cue_len = len(phrase)
                    break
            if not cue_len and tokens[i] in SINGLE_CUES:
                cue_len = 1
            if cue_len:
                start = i + cue_len
                negated.update(pos + j for j in range(start, min(start + WINDOW, len(tokens))))
                i = start
            else:
                i += 1
        pos += len(tokens)
    return negated


def medspacy_assertions(text: str, target_terms: list[str]) -> list[dict]:
    """Returns [{text, is_negated, is_family, is_historical}] for each target mention."""
    import medspacy
    from medspacy.target_matcher import TargetRule

    nlp = medspacy.load()
    matcher = nlp.get_pipe("medspacy_target_matcher")
    matcher.add([TargetRule(t, "TARGET") for t in target_terms])
    doc = nlp(text)
    return [{"text": e.text, "is_negated": e._.is_negated,
             "is_family": e._.is_family, "is_historical": e._.is_historical}
            for e in doc.ents]
