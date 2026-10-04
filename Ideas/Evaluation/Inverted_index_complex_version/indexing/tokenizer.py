"""Configurable tokenizer for the ablation: stopwords, stemming, abbreviation
expansion, and hyphen/decimal handling can each be switched on or off.

Differences from the simple version: `as` and `or` are NOT stopwords (they are
clinical abbreviations: aortic stenosis, operating room), and negation cues are
a superset of the original five.
"""
import re
from dataclasses import dataclass

NEGATION_TERMS = {"no", "not", "without", "denies", "denied", "none", "negative",
                  "absent", "nil", "neg"}

STOPWORDS = {
    "a", "an", "the", "is", "are", "was", "were", "be", "been", "being",
    "of", "in", "on", "at", "for", "to", "and", "with", "by",
    "this", "that", "it", "has", "have", "had",
} - NEGATION_TERMS

# Small illustrative map; extend from a real clinical abbreviation list.
ABBREVIATIONS = {
    "htn": "hypertension", "t2dm": "type 2 diabetes mellitus", "hf": "heart failure",
    "sob": "shortness of breath", "cp": "chest pain", "mi": "myocardial infarction",
    "copd": "chronic obstructive pulmonary disease", "ckd": "chronic kidney disease",
    "af": "atrial fibrillation", "uti": "urinary tract infection",
}

_SIMPLE_RE = re.compile(r"[a-z0-9]+")
# keeps 5-fu, 7.4, hba1c, non-small-cell as single tokens
_KEEP_RE = re.compile(r"[a-z0-9]+(?:[-.][a-z0-9]+)*")


@dataclass(frozen=True)
class TokenizerConfig:
    stopwords: bool = True
    stem: bool = False
    expand_abbrev: bool = False
    keep_hyphen_decimal: bool = False

    @property
    def name(self) -> str:
        flags = [n for n, on in (("stop", self.stopwords), ("stem", self.stem),
                                 ("abbr", self.expand_abbrev), ("keep", self.keep_hyphen_decimal)) if on]
        return "+".join(flags) or "raw"


_stemmer = None


def _get_stemmer():
    global _stemmer
    if _stemmer is None:
        from nltk.stem import PorterStemmer  # lazy: only needed when stem=True
        _stemmer = PorterStemmer()
    return _stemmer


def make_tokenizer(config: TokenizerConfig):
    pattern = _KEEP_RE if config.keep_hyphen_decimal else _SIMPLE_RE

    def tokenize(text: str) -> list[str]:
        tokens = pattern.findall(text.lower())
        if config.expand_abbrev:
            expanded = []
            for t in tokens:
                expanded.extend(ABBREVIATIONS.get(t, t).split())
            tokens = expanded
        if config.stopwords:
            tokens = [t for t in tokens if t not in STOPWORDS]
        if config.stem:
            stem = _get_stemmer().stem
            tokens = [stem(t) for t in tokens]
        return tokens

    return tokenize


# Configurations compared in the ablation.
ABLATION_CONFIGS = [
    TokenizerConfig(stopwords=False),
    TokenizerConfig(),
    TokenizerConfig(keep_hyphen_decimal=True),
    TokenizerConfig(expand_abbrev=True),
    TokenizerConfig(stem=True),
    TokenizerConfig(stem=True, expand_abbrev=True, keep_hyphen_decimal=True),
]
