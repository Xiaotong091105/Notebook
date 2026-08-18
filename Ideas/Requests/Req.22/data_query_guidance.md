# ICI toxicity audit

Related previous projects – please note this data query is similar to and builds upon the IO toxicity steroid complications query (TreatmentPlanImmunotherapy_20240927) and ICI Colitis audit query (BIP-4633 Gastrointestinal toxicity).

- All solid tumour patients started on Immunotherapy drugs from Jan 2020 : Nivolumab, ipilimumab, pembrolizumab, atezolizumab, durvalumab, cemiplimab, avelumab, tremelimumab, dostarlimab, relatlimab,botensilimab, Balstilimab

Patient information required:
- Demographics: age at time of treatment, sex, date of birth, date of death, MRN, post code
- Cancer info: diagnosis, specialty (oncology not haematology), tumour stage at diagnosis
- Suggested way to get accurate cancer stage: Within Beacon, there is a heading called ‘Associated problems’ that contains it

Immunotherapy information required:

- Immunotherapy info: treatment plan status, treatment plan, drug name, treatment goal, is adjuvant treatment?, start date, end date, discontinue date, discontinued reason/comments, treatment dose dose, schedule (e.g. 3 weekly vs 6 weekly), line (1st or 2nd line – if not be easily available, omit)

Immunosuppressant drug information required:
- Prescription of any of the following immunosuppressant drugs within the window of IO start date and 2 years from the IO end date:
- Primary immunosuppression: prednisolone, methylprednisolone, hydrocortisone
- Secondary immunosuppression: Budesonide , mycophenolate mofetil (MMF), etanercept , infliximab, abatacept, tacrolimus,  tocilizumab, vedolizumab
- Topical steroids
For all: earliest Med Date, latest med date, dose at earliest Med Date

Among only patients within this cohort, we would like to perform the following specific searches to identify patients with toxicity:

In all of the reports detailed below, please search for the following general terms:
drug toxicity, drug induced inflammation, immune related adverse event (irAE), immunotherapy toxicity, immune-mediated inflammation

The time window of reports detailed below to search should be: from immunotherapy start date to within 2 years of the last dose of immunotherapy

Search for lung toxicity/pneumonitis:
Imaging scan search:
Types scan reports to search: CT chest, CTCAP (chest abdomen and pelvis), HRCT (high resolution CT chest), CTPA (CT pulmonary angiogram)
Scan report headings to search within: “Conclusion”, “Opinion”, “Interpretation”, “Clinical details”
Specific terms to search within these scan reports: pneumonitis, immunotherapy granulomatosis, organising pneumonia, interstitial lung disease

Procedure report search:
Types procedure reports to search: Bronchoscopy with or without  lavage
Specific terms to search within these scan reports: pneumonitis, organising pneumonia, inflammation
Procedure report headings to search within: “Indication”, “Result”, “Conclusion”

Search for gut toxicity/colitis: (similar to BIP 4633 Gastrointestinal toxicity)

Imaging scan search:
Types scan reports to search: CTAP (abdomen and pelvis), CTCAP (chest abdomen and pelvis)
Scan report headings to search within: “Conclusion”, “Opinion”, “Interpretation”, “Clinical details”
Terms to search within these scan reports: colitis, gastritis, oesophagitis, duodenitis, enteritis, patchy inflammation, mucositis

Procedure report search:
Types of procedure reports to search:  Colonoscopy,  flexible sigmoidoscopy, OGD (OesophagoGastroDuodenoscopy)
Specific terms to search within these reports: mucosal oedema, colitis, gastritis, esophagitis, erosions, ulcerations
Procedure report headings to search within: “Indication”, “Result”, “Conclusion”

Search for cardiac toxicity:

Imaging scan search:
Types scan reports to search: CT chest, CTCAP (chest abdomen and pelvis), HRCT (high resolution CT chest), CTPA (CT pulmonary angiogram), cardiac MRI
Scan report headings to search within: order, “Conclusion”, “Opinion”, “Interpretation”, “Clinical details”
Terms to search within these scan reports: pericardial effusion, pericardial thickening, myocarditis

If possible – we would like to perform a search of specific blood tests:
We would like to identify patients with any troponin (called Troponin T or Troponin I) found to be >50 AND a NT-proBNP >400 that occurred during immunotherapy treatment and up to 2 years following the last dose of immunotherapy

Search for Hepatitis:
Types scan reports to search: Ultrasound liver, MRI liver, CTAP (abdomen and pelvis)  , CTCAP (chest abdomen and pelvis), MRCP (Magnetic Resonance Cholangiopancreatography)
Scan report headings to search within: order, “Conclusion”, “Opinion”, “Interpretation”, “Clinical details”
Terms to search within these scan reports: hepatitis, transaminitis, cholangiopathy, Cholangitis, hepatotoxicity, drug induced liver injury

Search for skin toxicity/dermatitis:

We wondered – is it feasible to search the problem list of the immunotherapy treated patients for the following terms:
dermatomyositis, severe cutaneous adverse reactions, stevens-johnson syndrome (SJS), toxic epidermal necrolysis (TEN), pemphigoid, pemphigus, linear IgA dermatosis, eosinophilia, exanthematous pustulosis, sweet syndrome, pyoderma gangrenosum, cutaneous vasculitis, erythroderma, alopecia areata, eosinophilic fasciitis, scleroderma, erythema nodosum, Sjogren syndrome, suprabasal acantholytic dermatoses
