# Medical Device Software — Regulatory Document Templates

> 의료기기 소프트웨어 인허가를 위한 산출물 템플릿 패키지입니다.  
> FDA 510(k), EU MDR Class IIa, MFDS 2등급 제출에 필요한 **28종 문서 템플릿**을 포함합니다.

---

## 이 저장소가 왜 존재하는가

### 문제: 의료기기 SW는 "증빙"이 없으면 팔 수 없다

의료기기 소프트웨어(SaMD/SiMD)는 미국·한국·EU 3개 시장 모두에서 규제 기관의 허가를 받아야만 판매가 가능하다. 허가를 받기 위해서는 소프트웨어를 **어떻게 설계하고, 어떻게 시험하고, 어떤 위험을 관리했는지**를 문서로 증명해야 한다. 이를 DHF(Design History File)라고 부른다.

문서가 미비하면 벌어지는 일:

- **FDA**: RTA(Refuse to Accept) — 제출 자체를 접수 거부. Technical Screening Hold 발행
- **EU MDR**: Notified Body가 적합성 평가 심사 자체를 시작하지 않음. CE 마킹 불가
- **MFDS**: 보완 요구(기술 문서 재제출 요청) → 심사 시계 리셋

어떤 경우든 결과는 동일하다: **시장 진출이 6~12개월 지연**된다.

### 해결: 빈칸만 채우면 바로 제출 가능한 템플릿

이 저장소는 3개 시장 동시 진출을 목표로, **IEC 62304 Class B / FDA Basic Level** 기준에서 인허가 제출에 직접 사용할 수 있는 수준의 템플릿 28종을 제공한다.

- **최소 필수 22종**: 어떤 시장이든 이것 없이는 심사 시작 불가
- **Risk 최소화 6종**: 법적 필수는 아니나, 없으면 심사관/NB가 추가 질의를 발행할 가능성이 높아 실무적으로 준필수
- **Placeholder 방식**: `model-name`, `company-name`을 실제 값으로 일괄 치환하면 즉시 편집 가능한 상태가 됨

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

### 기호 실무 의미

각 기호는 단순한 분류가 아니라 **규제 기관이 취하는 실제 행동**을 반영한다.

| 기호 | 명칭 | 실무적 의미 |
|------|------|------------|
| ✅ | **필수** | 이 문서가 없으면 **FDA는 접수 자체를 거부(RTA)**하거나, **EU MDR Notified Body는 적합성 평가를 시작하지 않음**. 협상의 여지가 없음 |
| ⭐ | **리스크 최소화** | 법적으로 필수는 아니나, **없으면 FDA 심사관이 AI(Additional Information) 질의를 발행하거나, NB가 부적합 지적**을 할 가능성이 높음. 제출 일정 리스크를 허용하지 않는다면 실무적으로 "준필수"로 취급 |
| ○ | **해당 없음** | 해당 시장의 규제에서 이 문서를 요구하지 않음. 제출 불필요 |
| △ | **참조 활용** | 직접 제출 대상은 아니나, 다른 필수 문서의 근거 자료로 활용됨 |

> **기호 ❌(작성 열)**: SDD(#3)와 Unit Test(#10)는 28종 템플릿에 포함되지 않음. IEC 62304 Class B에서 상세 설계서와 단위 시험 기록은 필수가 아니며, FDA·MFDS·EU MDR 심사에서도 이 두 문서를 직접 요구하지 않는다.

---

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

## 왜 3개 시장인가 — 시장별 규제 배경

### FDA 510(k) — 미국 시장

미국 의료기기 시장은 전 세계 최대 규모이며, FDA의 510(k) 심사를 통과해야만 진입 가능하다. 2023년 이후 몇 가지 중요한 제도 변화가 있었다.

- **Cyber Device 조항(§524B)**: SW를 포함하는 의료기기("cyber device")는 FD&C Act §524B에 따라 SBOM, 취약점 관리 계획, 사이버보안 테스트 결과를 의무 제출해야 한다. 이를 미충족하면 **Technical Screening Hold** 발행
- **eSTAR 전자 제출 의무화**: 2023년 10월부터 510(k) 신청은 eSTAR v6.1 형식으로 전자 제출해야 한다. 기존 PDF 방식 접수 불가
- **SW Guidance 2023**: FDA는 2023년 소프트웨어 제출 가이드를 개정하여, Level of Concern 기준 강화 및 사이버보안 요구 사항을 대폭 확대했다

### MFDS — 한국 시장

식품의약품안전처(MFDS)는 한국의 의료기기 인허가 기관으로, 독립형 디지털의료기기 소프트웨어는 2등급으로 분류된다.

- **디지털의료제품법(2025.1.24 시행)**: 2025년 1월부터 별도의 법체계가 적용된다. AI·디지털 의료기기에 특화된 허가·심사 기준이 신설되었으며, 빠른 업데이트 주기를 허용하는 허가 후 변경 관리 특례도 포함된다
- **안내서-1425-01 기준**: MFDS 기술 문서 제출 기준에 따라 한글 기술 문서 제출이 원칙이다. 소프트웨어 관련 문서는 IEC 62304에 따른 개발 생명주기 증빙을 요구한다
- **사이버보안**: FDA 대비 상대적으로 요구 수준이 낮지만(SBOM은 권장, 침투 테스트는 해당 없음), MFDS도 점진적으로 사이버보안 요구를 강화하는 추세다

### EU MDR CE — 유럽 시장

EU는 의료기기 규제(MDR 2017/745)에 따라 CE 마킹을 요구한다. 소프트웨어의 경우 Rule 11에 따라 대부분 Class IIa 이상으로 분류된다.

- **Notified Body 심사 필수**: Class IIa 이상은 제조사가 자체적으로 CE 마킹을 선언할 수 없다. EU MDR 인증을 받은 Notified Body의 심사를 통과해야 한다. **GSPR 체크리스트, CER, PMS/PMCF 없이는 심사 자체가 시작되지 않는다**
- **지속적 의무**: CE 마킹은 한 번 받으면 끝이 아니다. 시판 후 감시(PMS), 시판 후 임상 추적(PMCF), 주기적 안전성 갱신 보고서(PSUR)를 지속적으로 제출하지 않으면 CE 마킹 유지가 불가하다
- **사이버보안**: IEC 81001-5-1 준수가 실질적으로 요구되며, GSPR Annex I 항목에 사이버보안 요건이 포함된다

---

## 6개 그룹의 역할 — 인허가 프로세스에서 각 그룹이 하는 일

각 그룹은 규제 기관이 던지는 서로 다른 질문에 답하는 역할을 한다.

### Group A — SW 설계 및 개발: "어떻게 만들었는가"를 증명

IEC 62304의 핵심이 되는 그룹이다. 규제 기관은 소프트웨어가 체계적인 프로세스에 따라 개발되었는지를 이 그룹의 문서로 판단한다. 외주 개발을 진행하는 경우, A그룹 문서들은 **SOW(Statement of Work)에 명시해야 할 납품물** 목록이기도 하다. SDP가 없으면 개발 전체의 방향이 없는 것이고, SRS가 없으면 테스트 설계 자체가 불가하다.

### Group B — Verification & Validation: "제대로 만들었는가"를 증명

설계한 대로 구현이 되었는지(Verification), 그리고 사용 목적에 맞는 성능을 내는지(Validation)를 객관적인 시험 결과로 증명한다. RTM은 요구사항 → 설계 → 시험 케이스 → 결과의 연결 고리를 끊김 없이 보여주어야 한다. RTM에 빈칸이 있으면 FDA 심사관은 "이 요구사항은 시험하지 않았다"고 판단한다.

### Group C — 사이버보안: "안전하게 만들었는가"를 증명

**2023년 이후 FDA에서 RTA 및 deficiency가 가장 많이 발생하는 영역**이다. 2026년 기준으로 사이버보안은 의료기기 SW 인허가에서 최대 규제 리스크 영역이다. SBOM이 없거나, SBOM은 있지만 VEX(취약점 분석)가 없거나, 침투 테스트 결과에 Retest 기록이 없으면 FDA는 접수를 보류한다. 사이버보안 문서 7종은 서로 연결되어 있어 하나가 빠지면 전체 논리가 무너진다.

### Group D — 위험 관리: "위험을 관리했는가"를 증명

ISO 14971은 FDA, MFDS, EU MDR 모두의 기반 규격이다. 위험 관리 파일은 단독으로 완결되는 문서가 아니라, **B그룹과 C그룹의 모든 문서가 이것으로부터 파생**된다. 어떤 테스트를 해야 하는지(B그룹), 어떤 위협을 모델링해야 하는지(C그룹)의 입력값이 D그룹에서 나온다. 따라서 위험 관리 파일은 B/C그룹보다 먼저 작성되어야 한다.

### Group E — 인허가 제출: 규제 기관에 실제로 제출하는 양식/형식 문서

A~D그룹이 "내용"이라면, E그룹은 "형식"이다. 시장별로 제출 형식이 다르다. FDA는 eSTAR 형식, EU MDR은 GSPR 체크리스트, MFDS는 한글 기술 문서 양식을 요구한다. 내용이 아무리 좋아도 형식을 갖추지 못하면 접수되지 않는다.

### Group F — 시판후 관리: "시판 후에도 관리하겠는가"를 증명

EU MDR에서 특히 중요하다. PMS/PMCF 계획이 없으면 Notified Body는 기술 문서를 완성으로 보지 않으며, CE 마킹 유지가 불가하다. FDA에서도 §524B에 따라 시판 후 취약점 관리(C07 VMP)가 지속적으로 요구된다.

---

## "최소 필수 22종만으로 충분한가?"

진출하는 시장에 따라 실제로 필요한 문서 수가 달라진다.

| 진출 시장 | 최소 필수 | 실무 권장 | 이유 |
|-----------|:---------:|:---------:|------|
| **FDA만** | 22종 | **24종** | VEX(#6)와 8대 통제(#7) 없으면 deficiency 리스크 높음. 실무적으로 ⭐ 2종 추가 권장 |
| **FDA + EU MDR** | 26종 | **27종** | CER(#24), PMS/PMCF(#25), GSPR(#26) 추가. IEC 81001-5-1(#23)도 추가 권장 |
| **3개 시장 전부** | — | **28종** | SDD(#3)·Unit Test(#10) 제외한 28종 전체 |

> **실무 원칙**: 제출 일정이 빡빡할수록 ⭐ 문서를 생략하고 싶은 유혹이 생긴다. 하지만 AI 질의가 한 번 발행되면 FDA 심사 시계는 멈추고, 회신에 평균 30~60일이 추가 소요된다. ⭐ 문서 6종을 처음부터 작성하는 시간보다 AI 대응 시간이 더 길다.

---

## 시장별 Coverage Matrix

| 시장 | 필수 문서 | Risk 최소화 문서 | 합계 |
|------|:---------:|:---------------:|:----:|
| **FDA 510(k)** | 22 | 3 | 25 |
| **MFDS 2등급** (한국) | 17 | 6 | 23 |
| **EU MDR Class IIa** | 21 | 5 | 26 |

### 시장별 주요 차이점

- **FDA**: eSTAR v6.1 형식 의무(E04), SBOM/VEX 필수(C01, C02), Penetration Test Retest 전 항목 필수(C06). §524B "cyber device" 해당 시 사이버보안 문서 세트 전체 필수
- **EU MDR**: GSPR Checklist(E03) 필수, CER(F01) 및 PMS/PMCF(F02) 필수, IEC 81001-5-1(D02) 준수 요구. Notified Body마다 요구 수준이 다를 수 있음
- **MFDS**: 한글 기술 문서 요구, 일부 Cybersecurity 문서는 권장 수준. 디지털의료제품법(2025.1.24 시행) 적용 대상 여부 사전 확인 필요

---

## 문서 상세 카탈로그

### Group A — SW Design & Development (SW 설계 및 개발)

> **이 그룹의 역할**: IEC 62304가 요구하는 "소프트웨어 개발 생명주기(SDLC)"의 증빙 문서 세트. 외주 개발 시 SOW에 납품물로 명시해야 할 목록이기도 하다. SDP가 모든 문서의 마스터 계획 역할을 하며, SRS가 확정되어야 테스트 설계(B그룹)가 시작 가능하다.

| ID | 문서명 | 설명 | 근거 규격 | 분류 |
|----|--------|------|-----------|------|
| A01 | **SW Development Plan (SDP)** | SW 개발 생명주기, 프로세스, 도구, 조직 역할을 정의하는 최상위 계획 문서. 이 문서가 없으면 다른 모든 A그룹 문서의 근거가 없어진다 | IEC 62304 §5.1 | ✅ 필수 |
| A02 | **SW Requirements Specification (SRS)** | Functional Requirements(FR) 및 Non-Functional Requirements(NFR)를 정의하고, Risk Control Measure와의 추적성을 확보. SRS 없이는 RTM 작성 불가 | IEC 62304 §5.2, FDA SW Guidance | ✅ 필수 |
| A03 | **SW Architecture Design (SAD)** | SW 아키텍처, Module 분할, Interface 정의, SOUP Integration 구조를 문서화 | IEC 62304 §5.3 | ✅ 필수 |
| A04 | **SOUP List** | 사용된 모든 SOUP(Software of Unknown Provenance) Component의 명칭, Version, License, 알려진 취약점, Risk 평가를 목록화. SBOM(C01)의 원본 데이터 소스 | IEC 62304 §8.1.2, FDA SW Guidance §IV-F | ✅ 필수 |
| A05 | **Configuration Management Plan (CMP)** | Version Control, Branching 전략, Build 절차, Release 기준, 변경 관리 프로세스를 정의 | IEC 62304 §8, FDA eSTAR | ✅ 필수 |
| A06 | **SW Release Record** | 각 Release의 Version 정보, 포함된 변경 사항, Test 결과 요약, 알려진 Anomaly, Release 승인 기록 | IEC 62304 §5.8 | ✅ 필수 |
| A07 | **Source Code & Build Environment** | Source Code Repository 위치, Build Tool Chain, Compiler Version, Build 재현 절차, 환경 구성을 기록 | IEC 62304 §5.8, FDA eSTAR | ✅ 필수 |
| A08 | **Known Anomaly List** | Release 시점에 알려진 미해결 Anomaly의 목록, 심각도, 영향 분석, Justification을 기록. "없음"도 반드시 명시해야 함 | IEC 62304 §5.8, FDA Guidance | ✅ 필수 |

### Group B — Verification & Validation (검증 및 유효성 확인)

> **이 그룹의 역할**: "설계한 대로 만들었는가(Verification)"와 "의도한 용도에 맞게 작동하는가(Validation)"를 객관적 시험 결과로 증명한다. RTM은 SRS의 모든 요구사항이 빠짐없이 시험되었음을 연결 고리로 보여주어야 하며, 단 하나의 요구사항도 시험 결과와 연결되지 않으면 결함으로 지적된다.

| ID | 문서명 | 설명 | 근거 규격 | 분류 |
|----|--------|------|-----------|------|
| B01 | **Integration Test Report** | SW Unit 간 Integration 시험 결과. Interface, Data Flow, Error Handling 검증을 포함 | IEC 62304 §5.6 | ✅ 필수 |
| B02 | **System Test Report** | SRS의 모든 FR/NFR에 대한 System Level 시험 결과. Acceptance Criteria 충족 여부를 판정 | IEC 62304 §5.7, IEC 82304 | ✅ 필수 |
| B03 | **Requirements Traceability Matrix (RTM)** | SRS Requirement → Design → Test Case → Test Result → Risk Control의 양방향 추적성을 제공하는 Matrix | IEC 62304 §5.7, FDA eSTAR | ✅ 필수 |
| B04 | **Usability Engineering Summary** | Formative/Summative Usability Evaluation 결과 요약. Use Error 분석 및 Risk Mitigation 조치를 포함 | IEC 62366-1, FDA HFE Guidance | ✅ 필수 |
| B05 | **Clinical Evaluation / Equivalence** | Predicate Device와의 임상적 동등성 비교. Literature Review, Clinical Data 분석을 포함 | FDA 510(k), EU MDR Annex XIV | ✅ 필수 |

### Group C — Cybersecurity (사이버보안)

> **이 그룹의 역할**: "안전하게 만들었는가"를 증명한다. 2023년 이후 FDA에서 RTA 및 deficiency가 가장 많이 발생하는 영역이며, 2026년 기준 의료기기 SW 인허가의 최대 규제 리스크다. 7종이 논리적으로 연결되어 있어(SOUP→SBOM→VEX, Threat Model→Security Risk Assessment→Security Controls), 하나를 빠뜨리면 전체 논리가 무너진다.

| ID | 문서명 | 설명 | 근거 규격 | 분류 |
|----|--------|------|-----------|------|
| C01 | **SBOM** | CycloneDX/SPDX 형식의 Software Bill of Materials. 모든 Component, Version, License, 취약점 정보를 포함하는 Cover Sheet | FDA SBOM Guidance (2023), EO 14028 | ✅ 필수 |
| C02 | **VEX Report** | SBOM에서 식별된 취약점의 Exploitability 분석. 각 CVE에 대해 Affected/Not Affected/Under Investigation 상태를 판정. VEX 없이 SBOM만 제출하면 "취약점이 있는데 대응하지 않았다"는 지적을 받음 | CISA VEX, CSAF 2.0 | ⭐ 리스크 최소화 |
| C03 | **Cybersecurity Controls Specification** | FDA가 요구하는 8대 보안 통제(Authentication, Authorization, Encryption, Logging, Integrity, Resilience, Update, Anti-Malware) 명세 | FDA Cybersecurity Guidance (2023) | ⭐ 리스크 최소화 |
| C04 | **Threat Model** | STRIDE/DREAD 기반 위협 분석. System Boundary, Data Flow, Trust Zone, Attack Surface를 도식화하고 위협별 대응 전략을 기술 | FDA Cybersecurity Guidance, STRIDE | ✅ 필수 |
| C05 | **Cybersecurity Risk Assessment** | Threat Model에서 도출된 위협의 Risk Scoring, Risk Control Measure, Residual Risk 판정. ISO 14971과 통합 운영 | FDA Cybersecurity Guidance, AAMI TIR57, ISO 14971 | ✅ 필수 |
| C06 | **Penetration Test & Retest Report** | Production-Equivalent 환경에서의 침투 테스트 결과. 모든 심각도(Low~Critical)의 발견 사항에 대한 Retest 결과를 포함. **Retest 기록이 없으면 FDA는 미완료로 간주** | FDA Cybersecurity Guidance §IV-C, OWASP, PTES | ✅ 필수 |
| C07 | **Vulnerability Management Plan** | 시판 후 취약점 모니터링, Disclosure, Patch 배포, Coordinated Disclosure 절차를 정의 | FD&C Act §524B, FDA Cybersecurity Guidance §V | ✅ 필수 |

### Group D — Risk Management (위험 관리)

> **이 그룹의 역할**: ISO 14971은 FDA, MFDS, EU MDR 모든 의료기기 규제의 공통 기반 규격이다. 위험 관리 파일은 B그룹(어떤 테스트를 해야 하는지)과 C그룹(어떤 위협을 모델링해야 하는지)의 입력값을 제공한다. 따라서 이 그룹은 B/C그룹보다 반드시 먼저 시작되어야 한다.

| ID | 문서명 | 설명 | 근거 규격 | 분류 |
|----|--------|------|-----------|------|
| D01 | **Risk Management File** | ISO 14971 전 과정(Hazard 식별 → Risk 분석 → Risk Evaluation → Risk Control → Residual Risk)을 포괄하는 Living Document. 개발 중 지속 업데이트되며 Release 전 최종 Residual Risk 평가 완료 필요 | ISO 14971:2019, IEC 62304 | ✅ 필수 |
| D02 | **IEC 81001-5-1 Compliance** | Cybersecurity Lifecycle 전반(요구 분석, 설계, 구현, V&V, Release, 시판 후)에 대한 IEC 81001-5-1 조항별 준수 증거 매핑 | IEC 81001-5-1:2021, EU MDR | ⭐ 리스크 최소화 |

### Group E — Regulatory Submission (인허가 제출)

> **이 그룹의 역할**: A~D그룹이 "내용"이라면 E그룹은 "형식"이다. 각 규제 기관이 요구하는 형식에 맞게 내용을 포장하고 매핑하는 문서다. 형식이 맞지 않으면 내용과 무관하게 접수 단계에서 반려된다.

| ID | 문서명 | 설명 | 근거 규격 | 분류 |
|----|--------|------|-----------|------|
| E01 | **Predicate / SE Comparison** | Subject Device와 Predicate Device 간 Intended Use, Technology, Performance 비교표. FDA 심사관의 Substantial Equivalence 판단 근거 | FDA 510(k), 21 CFR §807.87(f) | ✅ 필수 |
| E02 | **Labeling & IFU** | FDA 21 CFR §801 및 EU MDR Annex I Chapter III 준수 라벨/사용설명서. FDA용 영문 라벨 및 EU MDR용 다국어 IFU를 파트별로 구분하여 작성 | FDA 21 CFR §801, EU MDR Annex I Ch.III | ✅ 필수 |
| E03 | **GSPR Checklist** | EU MDR 2017/745 Annex I의 23개 General Safety and Performance Requirements 조항별 준수 증거 매핑. Notified Body 기술 문서 심사의 첫 번째 관문. 이것 없이는 NB 심사 시작 불가 | EU MDR Annex I, MDCG 2019-11 | ✅ 필수 (EU MDR) |
| E04 | **eSTAR v6.1 Submission Guide** | FDA eSTAR 각 Section에 어떤 산출물을 매핑/첨부해야 하는지 정리한 제출 준비 가이드. 2023년 10월부터 510(k) 전자 제출에 eSTAR 형식 의무화 | FDA eSTAR v6.1, 21 CFR §807 Subpart E | ✅ 필수 (FDA) |

### Group F — Post-Market & Clinical (시판 후 / 임상)

> **이 그룹의 역할**: "시판 후에도 관리하겠는가"를 증명한다. EU MDR에서는 CE 마킹 취득 후에도 PMS/PMCF를 지속 운영하지 않으면 CE 유지가 불가하다. 시판 후 관리는 "나중에 할 일"이 아니라 허가 신청 시점에 계획을 제출해야 하는 사전 의무다.

| ID | 문서명 | 설명 | 근거 규격 | 분류 |
|----|--------|------|-----------|------|
| F01 | **Clinical Evaluation Report (CER)** | Literature Review, Clinical Data 분석, 동등성 논증을 종합한 임상 평가 보고서. EU MDR Annex XIV 및 MEDDEV 2.7/1 Rev.4 준수. EU MDR에서는 ✅ 필수, FDA에서는 B05로 대체 가능 | EU MDR Annex XIV, MEDDEV 2.7/1 | ✅ 필수 (EU MDR) |
| F02 | **PMS / PMCF Package** | Post-Market Surveillance 계획 및 Post-Market Clinical Follow-up 계획/보고를 통합한 패키지. Vigilance, Trend Reporting, PSUR 포함. EU MDR에서는 ✅ 필수 | EU MDR Art.83-86, MDCG 2020-7/8 | ✅ 필수 (EU MDR) |

---

## 분류 범례

| 표기 | 의미 | 설명 |
|------|------|------|
| ✅ **필수** | Mandatory | FDA 510(k) 제출에 반드시 필요. 누락 시 RTA(Refuse to Accept) 또는 Technical Screening Hold |
| ⭐ **Risk 최소화** | Risk-mitigation | FDA Additional Information(AI) 요청 방지 또는 EU MDR/MFDS 대응에 강력 권장. 누락 시 추가 질의 또는 Notified Body 지적 Risk |

---

## 권장 작성 순서

각 단계는 선후 관계가 있다. 순서를 어기면 앞 단계가 완료되지 않아 뒤 단계를 작성할 수 없거나, 나중에 앞 문서를 대폭 수정해야 하는 상황이 발생한다.

```
Phase 1 ─ Foundation (기반 문서)
  └─ A01 SDP → A02 SRS → A03 SAD → A04 SOUP → A05 CMP
```
> **이유**: SDP가 모든 문서의 마스터 계획이다. SRS가 확정되어야 테스트 케이스(B그룹)를 설계할 수 있다. SOUP 목록이 확정되어야 SBOM(C01)을 작성할 수 있다.

```
Phase 2 ─ Risk Management (위험 관리, B/C Group의 Input)
  └─ D01 Risk Management File
```
> **이유**: D01이 B그룹과 C그룹의 입력값이다. "어떤 시험을 해야 하는지"는 위험 관리에서 식별된 Risk Control Measure에서 도출되고, "어떤 위협을 모델링해야 하는지"도 위험 분석 결과에서 나온다. D01 없이 B·C그룹을 시작하면 시험 범위가 근거 없이 임의로 설정된다.

```
Phase 3 ─ V&V + Cybersecurity (병렬 진행 가능)
  ├─ B01 Integration Test    ┐              ┌─ C01 SBOM
  ├─ B02 System Test         │              ├─ C02 VEX
  ├─ B03 RTM                 ├── 병렬 ──────┤ C03 Security Controls
  ├─ B04 Usability           │              ├─ C04 Threat Model
  └─ B05 Equivalence         ┘              ├─ C05 Security Risk Assessment
                                            ├─ C06 Pen Test
                                            └─ C07 VMP
```
> **이유**: B그룹(기능 시험)과 C그룹(보안 시험)은 서로 독립적으로 진행 가능하다. 두 그룹을 병렬로 진행하면 전체 일정을 단축할 수 있다. 단, 두 그룹 모두 Phase 2(D01)가 완료된 후에 시작해야 한다.

```
Phase 4 ─ Release Artifacts (릴리즈 산출물)
  └─ A06 Release Record → A07 Build Environment → A08 Known Anomalies
```
> **이유**: 개발이 완료된 후 최종 상태를 기록하는 문서들이다. 개발 중에는 작성할 수 없다.

```
Phase 5 ─ Extended Compliance (추가 준수 문서)
  └─ D02 IEC 81001-5-1
```
> **이유**: 전체 사이버보안 생명주기(C그룹 포함)가 완료된 후 조항별 준수 증거를 매핑한다.

```
Phase 6 ─ Submission & Post-Market (인허가 제출 및 시판 후)
  └─ E01 Predicate → E02 Labeling → E03 GSPR → E04 eSTAR
  └─ F01 CER → F02 PMS/PMCF
```
> **이유**: E그룹은 1~5단계 문서가 완성된 후 이를 규제 양식에 매핑하는 작업이다. F그룹(시판 후 계획)은 허가 신청 시 함께 제출해야 하므로 E그룹과 병렬로 준비한다.

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
| 디지털의료제품법 | 2025.1.24 시행 | 한국 디지털 의료기기 SW 규제 |

---

## License

본 템플릿 패키지는 의료기기 인허가 용도로 제공됩니다.  
조직의 QMS(Quality Management System) 및 Regulatory Strategy에 맞게 조정하여 사용하십시오.
