# Medical Device Software — Regulatory Document Templates

> 의료기기 소프트웨어 인허가를 위한 산출물 템플릿 패키지입니다.  
> FDA 510(k), EU MDR Class IIa, MFDS 2등급 제출에 필요한 **28종 문서 템플릿**을 포함합니다.

---

## 개요

본 Repository는 의료기기 소프트웨어(SaMD/SiMD)의 인허가 제출에 필요한 기술 문서 템플릿을 제공합니다.

- **총 28종**: 최소 필수 22종 + Risk 최소화 6종
- **Placeholder**: `model-name` — 실제 제품명으로 일괄 치환하여 사용
- **빈칸 표기**: `____` 또는 `[작성 필요]` — 실제 내용으로 채워야 하는 부분
- **IEC 62304 SW Class B** 기준으로 작성

---

## 사용 방법

### 1단계: 제품명 및 회사명 치환

모든 파일과 파일명에서 placeholder를 실제 값으로 일괄 치환합니다.

```bash
# 제품명 치환 (파일 내용)
find . -name '*.md' -exec sed -i 's/model-name/YourProduct/g' {} +

# 회사명 치환 (파일 내용)
find . -name '*.md' -exec sed -i 's/company-name/YourCompany Co., Ltd./g' {} +

# 파일명 치환
for f in $(find . -name 'model-name-*'); do
  mv "$f" "$(echo $f | sed 's/model-name/YourProduct/g')"
done
```

> 또는 `scripts/init.sh` 스크립트를 사용하면 한 번에 처리됩니다.
> ```bash
> bash scripts/init.sh --product "YourProduct" --company "YourCompany Co., Ltd."
> ```

### 2단계: 작성 순서에 따라 문서 작성

아래 [권장 작성 순서](#권장-작성-순서)를 참고하여 단계별로 작성합니다.

### 3단계: 빈칸 채우기

각 문서의 `____`, `[작성 필요]`, `[TBD]` 표기 부분을 실제 내용으로 채웁니다.

---

## Repository 구조

```
software-templates/
├── README.md
│
├── A_SW_Design/                              ── Group A: SW 설계 및 개발 (8종)
│   ├── model-name-A01_SDP.md                    SW Development Plan
│   ├── model-name-A02_SRS.md                    SW Requirements Specification
│   ├── model-name-A03_SAD.md                    SW Architecture Design
│   ├── model-name-A04_SOUP.md                   SOUP List
│   ├── model-name-A05_CMP.md                    Configuration Management Plan
│   ├── model-name-A06_Release.md                SW Release Record
│   ├── model-name-A07_Build.md                  Source Code & Build Environment
│   └── model-name-A08_KnownAnomalies.md         Known Anomaly List
│
├── B_VnV/                                    ── Group B: Verification & Validation (5종)
│   ├── model-name-B01_IntegrationTest.md        Integration Test Report
│   ├── model-name-B02_SystemTest.md             System Test Report
│   ├── model-name-B03_RTM.md                    Requirements Traceability Matrix
│   ├── model-name-B04_Usability.md              Usability Engineering Summary
│   └── model-name-B05_ClinicalEquivalence.md    Clinical Evaluation / Equivalence
│
├── C_Cybersecurity/                          ── Group C: Cybersecurity (7종)
│   ├── model-name-C01_SBOM.md                   Software Bill of Materials
│   ├── model-name-C02_VEX.md                    VEX Report
│   ├── model-name-C03_SecurityControls.md       Cybersecurity Controls (8대 통제)
│   ├── model-name-C04_ThreatModel.md            Threat Model (STRIDE/DREAD)
│   ├── model-name-C05_SecurityRiskAssessment.md Cybersecurity Risk Assessment
│   ├── model-name-C06_PenTest.md                Penetration Test & Retest Report
│   └── model-name-C07_VMP.md                    Vulnerability Management Plan
│
├── D_Risk_Management/                        ── Group D: Risk Management (2종)
│   ├── model-name-D01_RiskManagement.md         Risk Management File (ISO 14971)
│   └── model-name-D02_IEC81001.md               IEC 81001-5-1 Compliance
│
├── E_Regulatory_Submission/                  ── Group E: Regulatory Submission (4종)
│   ├── model-name-E01_PredicateComparison.md    Predicate / SE Comparison
│   ├── model-name-E02_Labeling.md               Labeling & IFU
│   ├── model-name-E03_GSPR.md                   GSPR Checklist (EU MDR)
│   └── model-name-E04_eSTAR.md                  eSTAR v6.1 Submission Guide
│
└── F_PostMarket_Clinical/                    ── Group F: Post-Market & Clinical (2종)
    ├── model-name-F01_CER.md                    Clinical Evaluation Report
    └── model-name-F02_PMS_PMCF.md               PMS / PMCF Package
```

---

## 커버리지 매트릭스 (Coverage Matrix)

> 30종 산출물 × 3개 시장 전체 매핑. ✅ 필수 | ⭐ 리스크 최소화 | △ 참조 | ○ N/A

| # | 산출물 | 그룹 | FDA | MFDS | EU MDR | 작성 |
|---|--------|------|-----|------|--------|------|
| 1 | SW 요구사항 명세서 (SRS) | A | ✅ | ✅ | ✅ | ✅ |
| 2 | SW 아키텍처 설계서 (SAD) | A | ✅ | ✅ | ✅ | ✅ |
| 3 | SW 상세 설계서 (SDD) | A | ○ | △ | △ | ❌ |
| 4 | SOUP 목록 | A | ✅ | ✅ | ✅ | ✅ |
| 5 | SBOM (Machine-readable) | C | ✅ | ⭐ | ✅ | ✅ |
| 6 | VEX 리포트 | C | ⭐ | ○ | ⭐ | ✅ |
| 7 | 8대 보안 통제 명세서 | C | ⭐ | ⭐ | ✅ | ✅ |
| 8 | 통합 시험 결과서 | B | ✅ | ✅ | ✅ | ✅ |
| 9 | 시스템 시험 결과서 | B | ✅ | ✅ | ✅ | ✅ |
| 10 | 단위 시험 (Unit Test) | B | ○ | ○ | ○ | ❌ |
| 11 | 추적성 매트릭스 (RTM) | B | ✅ | ✅ | ✅ | ✅ |
| 12 | 위협 모델 (Threat Model) | C | ✅ | ⭐ | ✅ | ✅ |
| 13 | 보안 위험 평가 | C | ✅ | ⭐ | ✅ | ✅ |
| 14 | 침투 테스트 + Retest | C | ✅ | ○ | ⭐ | ✅ |
| 15 | 취약점 관리 계획 | C | ✅ | ⭐ | ✅ | ✅ |
| 16 | 위험 관리 파일 (ISO 14971) | D | ✅ | ✅ | ✅ | ✅ |
| 17 | 알려진 결함 목록 | A | ✅ | ✅ | ✅ | ✅ |
| 18 | SW 릴리즈 기록 | A | ✅ | ✅ | ✅ | ✅ |
| 19 | 소스코드/빌드 환경 | A | ✅ | ✅ | △ | ✅ |
| 20 | 사용적합성 평가 (Usability) | B | ✅ | ✅ | ✅ | ✅ |
| 21 | 임상 평가/동등성 비교 | B | ✅ | △ | ✅ | ✅ |
| 22 | 라벨링/IFU | E | ✅ | ✅ | ✅ | ✅ |
| 23 | IEC 81001-5-1 준수 문서 | D | ⭐ | ○ | ⭐ | ✅ |
| 24 | CER (임상 평가 보고서) | F | ○ | ○ | ✅ | ✅ |
| 25 | PMS/PMCF 통합 패키지 | F | ○ | ○ | ✅ | ✅ |
| 26 | GSPR 체크리스트 | E | ○ | ○ | ✅ | ✅ |
| 27 | SW 개발 계획서 (SDP) | A | ✅ | ✅ | ✅ | ✅ |
| 28 | 형상관리 계획서 (CMP) | A | ✅ | ✅ | ✅ | ✅ |
| 29 | Predicate 비교표 | E | ✅ | ○ | ○ | ✅ |
| 30 | eSTAR v6.1 제출 가이드 | E | ✅ | ○ | ○ | ✅ |

### 시장별 요약

| 시장 | 필수 (✅) | 리스크 최소화 (⭐) | 합계 |
|------|:---------:|:-----------------:|:----:|
| **FDA 510(k)** | 22 | 3 | 25 |
| **MFDS 2등급** | 17 | 6 | 23 |
| **EU MDR Class IIa** | 21 | 5 | 26 |

---

## 문서 상세 카탈로그

### Group A — SW Design & Development (SW 설계 및 개발)

| ID | 문서명 | 설명 | 근거 규격 | 분류 |
|----|--------|------|-----------|------|
| A01 | **SW Development Plan (SDP)** | SW 개발 생명주기, 프로세스, 도구, 조직 역할을 정의하는 최상위 계획 문서 | IEC 62304 §5.1 | ✅ 필수 |
| A02 | **SW Requirements Specification (SRS)** | Functional Requirements(FR) 및 Non-Functional Requirements(NFR)를 정의하고, Risk Control Measure와의 추적성을 확보 | IEC 62304 §5.2, FDA SW Guidance | ✅ 필수 |
| A03 | **SW Architecture Design (SAD)** | SW 아키텍처, Module 분할, Interface 정의, SOUP Integration 구조를 문서화 | IEC 62304 §5.3 | ✅ 필수 |
| A04 | **SOUP List** | 사용된 모든 SOUP(Software of Unknown Provenance) Component의 명칭, Version, License, 알려진 취약점, Risk 평가를 목록화 | IEC 62304 §8.1.2, FDA SW Guidance §IV-F | ✅ 필수 |
| A05 | **Configuration Management Plan (CMP)** | Version Control, Branching 전략, Build 절차, Release 기준, 변경 관리 프로세스를 정의 | IEC 62304 §8, FDA eSTAR | ✅ 필수 |
| A06 | **SW Release Record** | 각 Release의 Version 정보, 포함된 변경 사항, Test 결과 요약, 알려진 Anomaly, Release 승인 기록 | IEC 62304 §5.8 | ✅ 필수 |
| A07 | **Source Code & Build Environment** | Source Code Repository 위치, Build Tool Chain, Compiler Version, Build 재현 절차, 환경 구성을 기록 | IEC 62304 §5.8, FDA eSTAR | ✅ 필수 |
| A08 | **Known Anomaly List** | Release 시점에 알려진 미해결 Anomaly의 목록, 심각도, 영향 분석, Justification을 기록 | IEC 62304 §5.8, FDA Guidance | ✅ 필수 |

### Group B — Verification & Validation (검증 및 유효성 확인)

| ID | 문서명 | 설명 | 근거 규격 | 분류 |
|----|--------|------|-----------|------|
| B01 | **Integration Test Report** | SW Unit 간 Integration 시험 결과. Interface, Data Flow, Error Handling 검증을 포함 | IEC 62304 §5.6 | ✅ 필수 |
| B02 | **System Test Report** | SRS의 모든 FR/NFR에 대한 System Level 시험 결과. Acceptance Criteria 충족 여부를 판정 | IEC 62304 §5.7, IEC 82304 | ✅ 필수 |
| B03 | **Requirements Traceability Matrix (RTM)** | SRS Requirement → Design → Test Case → Test Result → Risk Control의 양방향 추적성을 제공하는 Matrix | IEC 62304 §5.7, FDA eSTAR | ✅ 필수 |
| B04 | **Usability Engineering Summary** | Formative/Summative Usability Evaluation 결과 요약. Use Error 분석 및 Risk Mitigation 조치를 포함 | IEC 62366-1, FDA HFE Guidance | ✅ 필수 |
| B05 | **Clinical Evaluation / Equivalence** | Predicate Device와의 임상적 동등성 비교. Literature Review, Clinical Data 분석을 포함 | FDA 510(k), EU MDR Annex XIV | ✅ 필수 |

### Group C — Cybersecurity (사이버보안)

| ID | 문서명 | 설명 | 근거 규격 | 분류 |
|----|--------|------|-----------|------|
| C01 | **SBOM** | CycloneDX/SPDX 형식의 Software Bill of Materials. 모든 Component, Version, License, 취약점 정보를 포함하는 Cover Sheet | FDA SBOM Guidance (2023), EO 14028 | ✅ 필수 |
| C02 | **VEX Report** | SBOM에서 식별된 취약점의 Exploitability 분석. 각 CVE에 대해 Affected/Not Affected/Under Investigation 상태를 판정 | CISA VEX, CSAF 2.0 | ✅ 필수 |
| C03 | **Cybersecurity Controls Specification** | FDA가 요구하는 8대 보안 통제(Authentication, Authorization, Encryption, Logging, Integrity, Resilience, Update, Anti-Malware) 명세 | FDA Cybersecurity Guidance (2023) | ✅ 필수 |
| C04 | **Threat Model** | STRIDE/DREAD 기반 위협 분석. System Boundary, Data Flow, Trust Zone, Attack Surface를 도식화하고 위협별 대응 전략을 기술 | FDA Cybersecurity Guidance, STRIDE | ✅ 필수 |
| C05 | **Cybersecurity Risk Assessment** | Threat Model에서 도출된 위협의 Risk Scoring, Risk Control Measure, Residual Risk 판정. ISO 14971과 통합 운영 | FDA Cybersecurity Guidance, AAMI TIR57, ISO 14971 | ✅ 필수 |
| C06 | **Penetration Test & Retest Report** | Production-Equivalent 환경에서의 침투 테스트 결과. 모든 심각도(Low~Critical)의 발견 사항에 대한 Retest 결과를 포함 (FDA 필수 요건) | FDA Cybersecurity Guidance §IV-C, OWASP, PTES | ✅ 필수 |
| C07 | **Vulnerability Management Plan** | 시판 후 취약점 모니터링, Disclosure, Patch 배포, Coordinated Disclosure 절차를 정의 | FD&C Act §524B, FDA Cybersecurity Guidance §V | ✅ 필수 |

### Group D — Risk Management (위험 관리)

| ID | 문서명 | 설명 | 근거 규격 | 분류 |
|----|--------|------|-----------|------|
| D01 | **Risk Management File** | ISO 14971 전 과정(Hazard 식별 → Risk 분석 → Risk Evaluation → Risk Control → Residual Risk)을 포괄하는 Living Document. 개발 중 지속 업데이트되며 Release 전 최종 Residual Risk 평가 완료 필요 | ISO 14971:2019, IEC 62304 | ✅ 필수 |
| D02 | **IEC 81001-5-1 Compliance** | Cybersecurity Lifecycle 전반(요구 분석, 설계, 구현, V&V, Release, 시판 후)에 대한 IEC 81001-5-1 조항별 준수 증거 매핑 | IEC 81001-5-1:2021, EU MDR | ⭐ Risk 최소화 |

### Group E — Regulatory Submission (인허가 제출)

| ID | 문서명 | 설명 | 근거 규격 | 분류 |
|----|--------|------|-----------|------|
| E01 | **Predicate / SE Comparison** | Subject Device와 Predicate Device 간 Intended Use, Technology, Performance 비교표. FDA 심사관의 Substantial Equivalence 판단 근거 | FDA 510(k), 21 CFR §807.87(f) | ✅ 필수 |
| E02 | **Labeling & IFU** | FDA 21 CFR §801 및 EU MDR Annex I Chapter III 준수 라벨/사용설명서. FDA용 영문 라벨 및 EU MDR용 다국어 IFU를 파트별로 구분하여 작성 | FDA 21 CFR §801, EU MDR Annex I Ch.III | ✅ 필수 |
| E03 | **GSPR Checklist** | EU MDR 2017/745 Annex I의 23개 General Safety and Performance Requirements 조항별 준수 증거 매핑. Notified Body 기술 문서 심사의 첫 번째 관문 | EU MDR Annex I, MDCG 2019-11 | ⭐ Risk 최소화 |
| E04 | **eSTAR v6.1 Submission Guide** | FDA eSTAR 각 Section에 어떤 산출물을 매핑/첨부해야 하는지 정리한 제출 준비 가이드. 2024년부터 510(k) 전자 제출에 eSTAR 형식 의무화 | FDA eSTAR v6.1, 21 CFR §807 Subpart E | ✅ 필수 |

### Group F — Post-Market & Clinical (시판 후 / 임상)

| ID | 문서명 | 설명 | 근거 규격 | 분류 |
|----|--------|------|-----------|------|
| F01 | **Clinical Evaluation Report (CER)** | Literature Review, Clinical Data 분석, 동등성 논증을 종합한 임상 평가 보고서. EU MDR Annex XIV 및 MEDDEV 2.7/1 Rev.4 준수 | EU MDR Annex XIV, MEDDEV 2.7/1 | ⭐ Risk 최소화 |
| F02 | **PMS / PMCF Package** | Post-Market Surveillance 계획 및 Post-Market Clinical Follow-up 계획/보고를 통합한 패키지. Vigilance, Trend Reporting, PSUR 포함 | EU MDR Art.83-86, MDCG 2020-7/8 | ⭐ Risk 최소화 |

---

## 분류 범례

| 표기 | 의미 | 설명 |
|------|------|------|
| ✅ **필수** | Mandatory | FDA 510(k) 제출에 반드시 필요. 누락 시 RTA(Refuse to Accept) 또는 Technical Screening Hold |
| ⭐ **Risk 최소화** | Risk-mitigation | FDA Additional Information(AI) 요청 방지 또는 EU MDR/MFDS 대응에 강력 권장. 누락 시 추가 질의 또는 Notified Body 지적 Risk |

---

## 시장별 Coverage Matrix

| 시장 | 필수 문서 | Risk 최소화 문서 | 합계 |
|------|:---------:|:---------------:|:----:|
| **FDA 510(k)** | 22 | 3 | 25 |
| **MFDS 2등급** (한국) | 17 | 6 | 23 |
| **EU MDR Class IIa** | 21 | 5 | 26 |

### 시장별 주요 차이점

- **FDA**: eSTAR v6.1 형식 의무(E04), SBOM/VEX 필수(C01, C02), Penetration Test Retest 전 항목 필수(C06)
- **EU MDR**: GSPR Checklist(E03) 필수, CER(F01) 및 PMS/PMCF(F02) 필수, IEC 81001-5-1(D02) 준수 요구
- **MFDS**: 한글 기술 문서 요구, 일부 Cybersecurity 문서는 권장 수준

---

## 권장 작성 순서

```
Phase 1 ─ Foundation (기반 문서)
  └─ A01 SDP → A02 SRS → A03 SAD → A04 SOUP → A05 CMP

Phase 2 ─ Risk Management (위험 관리, B/C Group의 Input)
  └─ D01 Risk Management File

Phase 3 ─ V&V + Cybersecurity (병렬 진행 가능)
  ├─ B01 Integration Test    ┐              ┌─ C01 SBOM
  ├─ B02 System Test         │              ├─ C02 VEX
  ├─ B03 RTM                 ├── 병렬 ──────┤ C03 Security Controls
  ├─ B04 Usability           │              ├─ C04 Threat Model
  └─ B05 Equivalence         ┘              ├─ C05 Security Risk Assessment
                                            ├─ C06 Pen Test
                                            └─ C07 VMP

Phase 4 ─ Release Artifacts (릴리즈 산출물)
  └─ A06 Release Record → A07 Build Environment → A08 Known Anomalies

Phase 5 ─ Extended Compliance (추가 준수 문서)
  └─ D02 IEC 81001-5-1

Phase 6 ─ Submission & Post-Market (인허가 제출 및 시판 후)
  └─ E01 Predicate → E02 Labeling → E03 GSPR → E04 eSTAR
  └─ F01 CER → F02 PMS/PMCF
```

---

## 적용 규격 목록

| 규격 | Edition | 적용 범위 |
|------|---------|----------|
| IEC 62304 | Ed.1.1 (2015) | Medical Device SW Lifecycle |
| IEC 82304-1 | Ed.1 (2016) | Health Software — General Requirements |
| IEC 62366-1 | Ed.1.1 (2020) | Usability Engineering |
| ISO 14971 | Ed.3 (2019) | Risk Management |
| IEC 81001-5-1 | Ed.1 (2021) | Cybersecurity Lifecycle |
| AAMI TIR57 | 2016 | Cybersecurity Risk Management (보충) |
| FDA eSTAR | v6.1 | Electronic Submission Template |
| FDA SW Guidance | 2023 | Content of Premarket Submissions for Device SW |
| FDA Cybersecurity Guidance | 2023 (Feb 2026 개정) | Cybersecurity in Medical Devices |
| EU MDR | 2017/745 | Medical Device Regulation (EU) |
| MDCG 2019-11 | Rev.1 | GSPR Guidance |
| MDCG 2020-7/8 | Rev.1 | PMS/PMCF Guidance |

---

## 문서 간 의존 관계

```
A02 SRS ──────────┬──→ B03 RTM (추적성 원본)
                  ├──→ B02 System Test (Test Case 도출)
                  └──→ D01 Risk Management (Risk Control Measure 추적)

A04 SOUP ─────────┬──→ C01 SBOM (Component 목록 원본)
                  └──→ C02 VEX (취약점 분석 대상)

C04 Threat Model ──┬──→ C05 Security Risk Assessment (위협→위험 평가)
                   └──→ C03 Security Controls (대응 통제 설계)

D01 Risk Management ──→ C05 Security Risk Assessment (통합 운영)
                   ──→ B04 Usability (Use Error Risk)

E04 eSTAR ─────────────→ 전체 문서 (FDA 제출 시 매핑 가이드)
E03 GSPR ──────────────→ 전체 문서 (EU MDR 심사 시 증거 매핑)
```

---

## License

본 템플릿 패키지는 의료기기 인허가 용도로 제공됩니다.  
조직의 QMS(Quality Management System) 및 Regulatory Strategy에 맞게 조정하여 사용하십시오.
