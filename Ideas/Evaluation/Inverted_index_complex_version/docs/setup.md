# Setup — complex version

Nothing here has been installed or run. Do the steps in order; each unlocks the next.

## 1. Python packages

```bash
pip install -r requirements.txt
python -m spacy download en_core_web_sm   # medspacy needs a spaCy model
```

Install `pyserini` last and only if Java works (step 2). The benchmark runs without it (omit `--pyserini`).

## 2. Java (only for the Pyserini/Lucene reference)

```bash
java -version      # need JDK 11+
```

If missing, install a JDK and make sure `java` is on PATH. Not verified on this Windows machine; if it fails, keep SQLite FTS5 as the only reference.

## 3. Data, easiest first

1. **Zipf fallback (offline, immediate):** `python data/zipf_generator.py --docs 100000` writes `data/generated/zipf_notes.csv` and `zipf_gold_queries.json`. Copy that file's `queries` into `evaluation/gold_queries.json`.
2. **Synthea notes:** generate records with [Synthea](https://github.com/synthetichealth/synthea) and render notes with [ClinicalNoteForge](https://github.com/tristan-hooper/clinical-note-forge). Check that tool's actual output layout, then set `file_path`, `id_column`, `text_columns` of the `synthea_notes` profile in `data/schema_config.json`. Its annotations can supply gold queries.
3. **MIMIC-IV-Note (realistic text):** apply for PhysioNet credentialed access, complete CITI training and sign the data use agreement ([MIMIC-IV-Note](https://physionet.org/content/mimic-iv-note/2.2/)). Place files under `data/raw/` (git-ignored) and verify column names for the `mimic_note` profile. Work only inside the approved environment; do not commit any file or result containing note text.

## 4. Run

```bash
python evaluation/benchmark_complex.py --profile zipf --sizes 1000,10000,100000
python evaluation/benchmark_complex.py --profile zipf --pyserini   # needs Java + pyserini
```

Optional: add `data/negation_labels.json` (`{"examples": [{"text": "...", "negated_terms": ["fever"]}]}`) to evaluate the negation tagger.
