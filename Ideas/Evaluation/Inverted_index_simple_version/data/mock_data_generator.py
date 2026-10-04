"""Generates a synthetic clinical-record dataset that mirrors the real
dataset's schema (structured fields + free-text fields), so the indexing
evaluation pipeline can be built and validated without touching real
patient data. No real patient data is used or referenced here.
"""
import csv
import random
import uuid
from pathlib import Path

random.seed(42)

N_RECORDS = 2000

CONDITIONS = [
    "type 2 diabetes mellitus", "hypertension", "chronic kidney disease",
    "atrial fibrillation", "heart failure", "COPD", "asthma",
    "community acquired pneumonia", "urinary tract infection", "anaemia",
    "hypothyroidism", "depression", "osteoarthritis", "gout",
    "ischaemic heart disease", "stroke", "epilepsy", "migraine",
]

SYMPTOMS = [
    "chest pain", "shortness of breath", "fatigue", "dizziness",
    "nausea", "fever", "cough", "headache", "abdominal pain",
    "swelling in the legs", "palpitations", "joint pain", "weight loss",
]

TREATMENTS = [
    "metformin", "lisinopril", "atorvastatin", "furosemide", "amlodipine",
    "salbutamol inhaler", "levothyroxine", "sertraline", "warfarin",
    "insulin", "paracetamol", "ibuprofen", "amoxicillin",
]

NEGATION_TEMPLATES = [
    "denies {symptom}", "no evidence of {condition}", "no {symptom}",
    "family history of {condition} not relevant", "without {symptom}",
]

POSITIVE_TEMPLATES = [
    "reports {symptom}", "presents with {symptom}",
    "known history of {condition}", "diagnosed with {condition}",
    "currently on {treatment} for {condition}",
]


def _sentence():
    kind = random.choice(["positive", "positive", "negation"])
    if kind == "negation":
        template = random.choice(NEGATION_TEMPLATES)
    else:
        template = random.choice(POSITIVE_TEMPLATES)
    return template.format(
        symptom=random.choice(SYMPTOMS),
        condition=random.choice(CONDITIONS),
        treatment=random.choice(TREATMENTS),
    )


def _free_text(min_sentences=2, max_sentences=6):
    n = random.randint(min_sentences, max_sentences)
    sentences = [_sentence() for _ in range(n)]
    return ". ".join(s.capitalize() for s in sentences) + "."


def generate_record(index: int) -> dict:
    return {
        "patient_id": f"MOCK{index:05d}-{uuid.uuid4().hex[:6]}",
        "date_of_encounter": f"2023-{random.randint(1, 12):02d}-{random.randint(1, 28):02d}",
        "hemoglobin": round(random.uniform(9.0, 17.5), 1),
        "wbc_count": round(random.uniform(3.0, 15.0), 1),
        "glucose": round(random.uniform(3.5, 15.0), 1),
        "creatinine": round(random.uniform(40, 150), 0),
        "problem_list": "; ".join(random.sample(CONDITIONS, k=random.randint(1, 3))),
        "notes": _free_text(3, 8),
        "subjective_history": _free_text(2, 5),
        "physical_examination": _free_text(1, 4),
        "letters": _free_text(2, 6),
    }


def main():
    out_path = Path(__file__).parent / "mock_dataset.csv"
    fieldnames = list(generate_record(0).keys())
    with out_path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        for i in range(N_RECORDS):
            writer.writerow(generate_record(i))
    print(f"Wrote {N_RECORDS} synthetic records to {out_path}")


if __name__ == "__main__":
    main()
