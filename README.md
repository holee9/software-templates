# Medical Device Software — Regulatory Document Templates

> **Purpose**: Reusable template package for medical device software regulatory submissions  
> **Coverage**: FDA 510(k), EU MDR Class IIa, MFDS Class 2  
> **Total Documents**: 28 templates (22 mandatory + 6 risk-mitigation)  
> **Placeholder Convention**: `model-name` — replace with your actual product/model name

---

## Quick Start

1. Fork or clone this repository
2. **Find & Replace** `model-name` with your product name across all files and filenames
3. Start filling in templates following the [recommended order](#recommended-authoring-sequence)
4. Look for `____` or `[작성 필요]` placeholders to fill in actual content

---

## Repository Structure

```
software-templates/
├── README.md
├── A_SW_Design/                           — Group A: SW Design & Development (8)
│   ├── model-name-A01_SDP.md                 SW Development Plan
│   ├── model-name-A02_SRS.md                 SW Requirements Specification
│   ├── model-name-A03_SAD.md                 SW Architecture Design
│   ├── model-name-A04_SOUP.md                SOUP List
│   ├── model-name-A05_CMP.md                 Configuration Management Plan
│   ├── model-name-A06_Release.md              SW Release Record
│   ├── model-name-A07_Build.md                Source Code & Build Environment
│   └── model-name-A08_KnownAnomalies.md       Known Anomaly List
│
├── B_VnV/                                 — Group B: Verification & Validation (5)
│   ├── model-name-B01_IntegrationTest.md      Integration Test Report
│   ├── model-name-B02_SystemTest.md           System Test Report
│   ├── model-name-B03_RTM.md                  Requirements Traceability Matrix
│   ├── model-name-B04_Usability.md            Usability Engineering Summary
│   └── model-name-B05_ClinicalEquivalence.md  Clinical Evaluation / Equivalence
│
├── C_Cybersecurity/                       — Group C: Cybersecurity (7)
│   ├── model-name-C01_SBOM.md                 Software Bill of Materials
│   ├── model-name-C02_VEX.md                  VEX Report
│   ├── model-name-C03_SecurityControls.md     Cybersecurity Controls Specification
│   ├── model-name-C04_ThreatModel.md          Threat Model
│   ├── model-name-C05_SecurityRiskAssessment.md  Cybersecurity Risk Assessment
│   ├── model-name-C06_PenTest.md              Penetration Test & Retest Report
│   └── model-name-C07_VMP.md                  Vulnerability Management Plan
│
├── D_Risk_Management/                     — Group D: Risk Management (2)
│   ├── model-name-D01_RiskManagement.md       Risk Management File (ISO 14971)
│   └── model-name-D02_IEC81001.md             IEC 81001-5-1 Compliance
│
├── E_Regulatory_Submission/               — Group E: Regulatory Submission (4)
│   ├── model-name-E01_PredicateComparison.md  Predicate / SE Comparison
│   ├── model-name-E02_Labeling.md             Labeling & IFU
│   ├── model-name-E03_GSPR.md                 GSPR Checklist (EU MDR)
│   └── model-name-E04_eSTAR.md                eSTAR v6.1 Submission Guide
│
└── F_PostMarket_Clinical/                 — Group F: Post-Market & Clinical (2)
    ├── model-name-F01_CER.md                  Clinical Evaluation Report
    └── model-name-F02_PMS_PMCF.md             PMS / PMCF Package
```

---

## Document Catalog

### Group A — SW Design & Development

| ID | Document | Standard Reference | Priority |
|----|----------|-------------------|----------|
| A01 | SW Development Plan (SDP) | IEC 62304 §5.1 | Mandatory |
| A02 | SW Requirements Specification (SRS) | IEC 62304 §5.2, FDA Guidance | Mandatory |
| A03 | SW Architecture Design (SAD) | IEC 62304 §5.3 | Mandatory |
| A04 | SOUP List | IEC 62304 §8 | Mandatory |
| A05 | Configuration Management Plan (CMP) | IEC 62304 §8 | Mandatory |
| A06 | SW Release Record | IEC 62304 §5.8 | Mandatory |
| A07 | Source Code & Build Environment | FDA eSTAR, IEC 62304 §5.8 | Mandatory |
| A08 | Known Anomaly List | IEC 62304 §5.8, FDA Guidance | Mandatory |

### Group B — Verification & Validation

| ID | Document | Standard Reference | Priority |
|----|----------|-------------------|----------|
| B01 | Integration Test Report | IEC 62304 §5.6 | Mandatory |
| B02 | System Test Report | IEC 62304 §5.7, IEC 82304 | Mandatory |
| B03 | Requirements Traceability Matrix (RTM) | IEC 62304 §5.7, FDA eSTAR | Mandatory |
| B04 | Usability Engineering Summary | IEC 62366-1, FDA HFE Guidance | Mandatory |
| B05 | Clinical Evaluation / Equivalence | FDA 510(k), EU MDR Annex XIV | Mandatory |

### Group C — Cybersecurity

| ID | Document | Standard Reference | Priority |
|----|----------|-------------------|----------|
| C01 | SBOM | FDA SBOM Guidance (2023), EO 14028 | Mandatory |
| C02 | VEX Report | CISA VEX, CSAF 2.0 | Mandatory |
| C03 | Cybersecurity Controls Specification | FDA Cyber Guidance (2023) | Mandatory |
| C04 | Threat Model | FDA Cyber Guidance, STRIDE/DREAD | Mandatory |
| C05 | Cybersecurity Risk Assessment | FDA Cyber Guidance, IEC 81001-5-1 | Risk-mitigation |
| C06 | Penetration Test & Retest Report | FDA Cyber Guidance | Risk-mitigation |
| C07 | Vulnerability Management Plan | FDA Cyber Guidance (2023) | Mandatory |

### Group D — Risk Management

| ID | Document | Standard Reference | Priority |
|----|----------|-------------------|----------|
| D01 | Risk Management File | ISO 14971:2019, IEC 62304 | Mandatory |
| D02 | IEC 81001-5-1 Compliance | IEC 81001-5-1:2021, EU MDR | Risk-mitigation |

### Group E — Regulatory Submission

| ID | Document | Standard Reference | Priority |
|----|----------|-------------------|----------|
| E01 | Predicate / SE Comparison | FDA 510(k), eSTAR Section 10 | Mandatory |
| E02 | Labeling & IFU | FDA 21 CFR 801, EU MDR Annex I Ch.III | Mandatory |
| E03 | GSPR Checklist | EU MDR Annex I, MDCG 2020-5 | Risk-mitigation |
| E04 | eSTAR v6.1 Submission Guide | FDA eSTAR Program | Mandatory |

### Group F — Post-Market & Clinical

| ID | Document | Standard Reference | Priority |
|----|----------|-------------------|----------|
| F01 | Clinical Evaluation Report (CER) | EU MDR Annex XIV, MEDDEV 2.7/1 | Risk-mitigation |
| F02 | PMS / PMCF Package | EU MDR Art.83-86, MDCG 2020-7/8 | Risk-mitigation |

---

## Recommended Authoring Sequence

```
Phase 1 ─ Foundation
  A01 SDP → A02 SRS → A03 SAD → A04 SOUP → A05 CMP

Phase 2 ─ Risk (feeds into B & C)
  D01 Risk Management File

Phase 3 ─ V&V + Cybersecurity (can run in parallel)
  B01 Integration Test ┐
  B02 System Test      ├─ parallel ─┤ C01 SBOM
  B03 RTM              │            │ C02 VEX
  B04 Usability        │            │ C03 Security Controls
  B05 Equivalence      ┘            │ C04 Threat Model
                                    │ C05 Security Risk Assessment
                                    │ C06 Pen Test
                                    └ C07 VMP

Phase 4 ─ Release Artifacts
  A06 Release Record → A07 Build Environment → A08 Known Anomalies

Phase 5 ─ Extended Risk & Compliance
  D02 IEC 81001-5-1

Phase 6 ─ Submission & Post-Market
  E01 Predicate Comparison → E02 Labeling → E03 GSPR → E04 eSTAR
  F01 CER → F02 PMS/PMCF
```

---

## Market Coverage Matrix

| Market | Mandatory | Risk-mitigation | Total |
|--------|:---------:|:---------------:|:-----:|
| **FDA 510(k)** | 22 | 3 | 25 |
| **MFDS Class 2** (Korea) | 17 | 6 | 23 |
| **EU MDR Class IIa** | 21 | 5 | 26 |

---

## Priority Legend

- **Mandatory** — Required for FDA 510(k) submission. Missing documents trigger RTA (Refuse to Accept) or Technical Screening Hold.
- **Risk-mitigation** — Strongly recommended to prevent FDA Additional Information (AI) requests, EU Notified Body findings, or MFDS supplementary inquiries.

---

## Applicable Standards & Guidance

| Standard | Edition | Scope |
|----------|---------|-------|
| IEC 62304 | Ed.1.1 (2015) | Medical device software lifecycle |
| IEC 82304-1 | Ed.1 (2016) | Health software — General requirements |
| IEC 62366-1 | Ed.1.1 (2020) | Usability engineering for medical devices |
| ISO 14971 | Ed.3 (2019) | Risk management for medical devices |
| IEC 81001-5-1 | Ed.1 (2021) | Health software cybersecurity lifecycle |
| FDA eSTAR | v6.1 | Electronic Submission Template and Resource |
| FDA Cybersecurity Guidance | 2023 | Cybersecurity in Medical Devices |
| EU MDR | 2017/745 | Medical Device Regulation (EU) |

---

## How to Customize

1. **Replace `model-name`** — Global find & replace in all file contents and filenames
2. **Fill metadata headers** — Each document starts with a metadata block (document number, version, product name, etc.)
3. **Complete placeholder sections** — Search for `____`, `[작성 필요]`, or `[TBD]` markers
4. **Review footnotes** — Each document's notes section explains mandatory vs. risk-mitigation rationale
5. **Remove inapplicable sections** — If targeting a single market, sections for other markets can be trimmed

---

## License

This template package is provided as-is for internal regulatory use. Adapt to your organization's QMS (Quality Management System) and regulatory strategy.
