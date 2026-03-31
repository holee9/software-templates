# Predicate / 동등기기 비교표 (Substantial Equivalence Comparison)

> **문서 번호**: model-name-E01
> **버전**: 0.1 (Draft)
> **작성일**: ____-__-__
> **작성자**: ____________
> **검토자**: ____________
> **승인자**: ____________
> **제품**: model-name Console SW
> **회사**: company-name
> **분류**: ✅ 최소 필수 — FDA 510(k) 심사에서 실질적 동등성(SE) 입증의 핵심 문서. eSTAR v6.1 Section 10에 직접 삽입/참조. 이 문서 없이 510(k) 심사 진입 불가.
> **적용 시장**: FDA (510(k) 전용)
> **근거 규격**: 21 CFR §807.87(f), FDA 510(k) Substantial Equivalence Decision Making Process Guidance, FDA eSTAR v6.1 Section 10

---

## 1. 문서 정보

### 1.1 문서 목적

FDA eSTAR 510(k) 제출을 위해 model-name Console SW(Subject Device)와 Predicate Device 3종의 의도된 사용 및 기술 특성 비교를 정형화된 표 형식으로 제공하여, FDA 심사관이 실질적 동등성(Substantial Equivalence, SE)을 신속하게 확인할 수 있도록 한다.

본 문서는 model-name-B05(임상 평가/동등성 비교)의 표 형식 요약이며, eSTAR v6.1 Section 10에 직접 활용된다.

### 1.2 실질적 동등성 판단 기준 (21 CFR §807.87(f))

FDA는 다음 두 조건을 모두 충족할 때 SE를 인정한다:
1. Subject Device와 Predicate Device가 **동일한 의도된 사용(Intended Use)**을 가짐
2. Subject Device와 Predicate Device가 **동일하거나 다른 기술 특성**을 가지되, 다른 경우 ① 새로운 안전성/유효성 문제를 제기하지 않고 ② 적어도 Predicate Device만큼 안전하고 효과적임을 데이터로 지지

---

## 2. Subject Device (제출 제품) 요약

| 항목 | 내용 |
|---|---|
| 제품명 | model-name Console SW |
| 제조사 | company-name |
| 제조 국가 | 대한민국 |
| 제품 코드 | LLZ |
| 분류 규정 | 21 CFR 892.2050 (Picture Archiving and Communications System) |
| 분류 등급 | Class II |
| 제출 유형 | 510(k) 사전 시장 인허가 |
| SW 분류 | IEC 62304 Class B / FDA Basic Level |
| 버전 | [X.X.X] |
| 의도된 사용 | model-name Console SW는 면허를 보유한 의료 전문가가 디지털 방사선(DR) 검출기로 취득한 X-ray 영상을 표시, 처리(후처리 기능), 저장 및 PACS로 전송하기 위한 처방용 의료기기 소프트웨어이다. |

---

## 3. Predicate Device 요약

| 항목 | Predicate 1 | Predicate 2 | Predicate 3 |
|---|---|---|---|
| 제품명 | **DRTECH EConsole1** | **Vieworks VXvue** | **Rayence XmaruView** |
| 제조사 | DRTECH Corp. | Vieworks Co., Ltd. | Rayence Co., Ltd. |
| 510(k) 번호 | **K231225** | **K251410** | **K160579** |
| 허가 일자 | 2023년 | 2025년 | 2016년 |
| 제품 코드 | LLZ | LLZ | LLZ |
| 분류 규정 | 21 CFR 892.2050 | 21 CFR 892.2050 | 21 CFR 892.2050 |
| 제조 국가 | 대한민국 | 대한민국 | 대한민국 |
| 활용 전략 | 보조 Predicate | **주 Predicate** (최신, 2025년) | 기술 특성 보완 Predicate |

> **Predicate 선정 전략**: K251410(VXvue, 2025년)을 주 Predicate로 사용. 최신 허가로 현재 규제 기준 반영. EConsole1(K231225, 2023년)을 보조 Predicate로 사용하여 Split Predicate 전략도 허용. XmaruView(K160579)는 기술 특성 세부 항목 보완 참조.

---

## 4. 의도된 사용 비교

### 4.1 의도된 사용 비교 테이블

| 비교 항목 | model-name Console SW | EConsole1 (K231225) | VXvue (K251410) | XmaruView (K160579) | SE 판정 |
|---|---|---|---|---|---|
| **의도된 사용 핵심 문구** | DR X-ray 영상 취득·표시·처리·저장·전송 | [Predicate 기재 사항 — K231225 확인 후 기재] | [Predicate 기재 사항 — K251410 확인 후 기재] | [Predicate 기재 사항 — K160579 확인 후 기재] | ✅ 동등 |
| **처방 목적** | 진단 보조 (진단 결정은 의료인 담당) | 진단 보조 | 진단 보조 | 진단 보조 | ✅ 동등 |
| **영상 모달리티** | 디지털 방사선(DR), X-ray | DR, X-ray | DR, X-ray | DR, X-ray | ✅ 동등 |
| **적응증 (해부학적 부위)** | 전신 (성인/소아) | 전신 | 전신 | 전신 | ✅ 동등 |
| **대상 환자** | 성인 및 소아 | 성인 및 소아 | 성인 및 소아 | 성인 및 소아 | ✅ 동등 |
| **대상 사용자** | 면허를 보유한 방사선 기사, 방사선과 전문의 | 의료 전문가 | 의료 전문가 | 의료 전문가 | ✅ 동등 |
| **처방용/OTC** | 처방용 (Prescription Use Only, Rx Only) | Rx Only | Rx Only | Rx Only | ✅ 동등 |
| **사용 환경** | 병원 촬영실, 영상 판독실 | 병원/클리닉 | 병원/클리닉 | 병원/클리닉 | ✅ 동등 |

**의도된 사용 비교 결론**: model-name Console SW는 Predicate Device 3종과 의도된 사용이 동일하다.

---

## 5. 기술 특성 비교

### 5.1 기술 특성 비교 테이블

| 기술 특성 항목 | model-name | EConsole1 (K231225) | VXvue (K251410) | 차이 여부 | SE 판정 |
|---|---|---|---|---|---|
| **SW 유형** | 독립형 SW (Stand-alone Software) | 독립형 SW | 독립형 SW | 없음 | ✅ |
| **운영 플랫폼** | Windows 10/11 (PC) | Windows | Windows | 없음 | ✅ |
| **DICOM 표준 지원** | DICOM 3.0 (C-STORE, C-FIND, C-MOVE) | DICOM 3.0 | DICOM 3.0 | 없음 | ✅ |
| **영상 취득 (Acquisition)** | DR 검출기 연동 취득 지원 | ✅ | ✅ | 없음 | ✅ |
| **영상 표시 (Display)** | 고해상도 DICOM 영상 표시 | ✅ | ✅ | 없음 | ✅ |
| **영상 후처리 기능** | 윈도우/레벨, 줌, 이동, 회전, 반전, 필터 | [기재] | [기재] | [있음/없음 확인 후 기재] | ✅ |
| **측정 기능** | 길이, 각도, 면적 측정 | [기재] | [기재] | [있음/없음] | ✅ |
| **PACS 전송** | DICOM C-STORE via Ethernet | ✅ | ✅ | 없음 | ✅ |
| **AI/ML 기능** | 없음 (No AI/ML Component) | 없음 | 없음 | 없음 | ✅ |
| **클라우드 기능** | 없음 (On-premise 전용) | [기재] | [기재] | [있음/없음] | ✅ |
| **사이버보안 — TLS** | TLS 1.2+ (필수 적용) | [기재] | [기재] | 있음 (강화) | ✅ (더 안전) |
| **사이버보안 — RBAC** | 역할 기반 접근 통제 (RBAC) | [기재] | [기재] | 있음 | ✅ |
| **사이버보안 — SBOM** | SBOM 제공 (CycloneDX) | [기재] | [기재] | 있음 (추가됨) | ✅ (더 안전) |
| **IEC 62304 분류** | Class B / FDA Basic Level | [기재] | [기재] | [있음/없음] | ✅ |
| **IEC 62366 사용적합성** | IEC 62366-1 적용 | [기재] | [기재] | [있음/없음] | ✅ |
| **UDI 지원** | UDI-DI/UDI-PI 지원 | ✅ | ✅ | [기재] | ✅ |

### 5.2 사이버보안 특성 상세 비교

| 사이버보안 항목 | model-name | EConsole1 | VXvue | 차이점 분석 |
|---|---|---|---|---|
| 암호화 통신 | TLS 1.2 이상 | [기재] | [기재] | model-name는 TLS 1.3도 지원 — 차이 있으나 더 안전 |
| 인증 방식 | RBAC + 패스워드 정책 | [기재] | [기재] | 동등 이상 |
| SBOM 제공 | ✅ CycloneDX | [기재] | [기재] | FDA §524B 요건 충족 |
| VEX 제공 | ✅ | [기재] | [기재] | FDA §524B 요건 충족 |
| 보안 패치 정책 | 30/90일 SLA | [기재] | [기재] | 동등 이상 |

---

## 6. 차이점 분석 (Difference Analysis)

### 6.1 식별된 기술 특성 차이점

| # | 차이점 | model-name | Predicate (VXvue K251410) | 새로운 위험 여부 | 분석 |
|---|---|---|---|---|---|
| DIFF-001 | TLS 버전 | TLS 1.2/1.3 지원 | TLS 1.2 지원 (추정) | ❌ 새로운 위험 없음 | TLS 1.3은 1.2 대비 보안 강화. 호환성 역시 TLS 1.2 기기와 협상 가능. 성능 또는 안전성 저하 없음. |
| DIFF-002 | SBOM 제공 | CycloneDX 형식 제공 | [확인 필요] | ❌ 새로운 위험 없음 | SBOM은 투명성 향상 도구. 위험 증가 요소 없음. FDA §524B 요건 충족. |
| [DIFF-XXX] | [작성 필요] | | | | |

### 6.2 차이점 분석 결론

> "상기 식별된 기술 특성 차이점은 모두 model-name의 보안 강화에 해당하며, 새로운 안전성 또는 유효성 문제를 제기하지 않는다. 각 차이점은 Predicate Device 대비 동등하거나 더 안전한 성능을 제공한다."

---

## 7. 실질적 동등성 결론

### 7.1 SE 판정 요약

| SE 판정 기준 | 판정 결과 |
|---|---|
| 동일한 의도된 사용 | ✅ 동일 |
| 동일하거나 안전성 문제 없는 기술 특성 | ✅ 동일 또는 더 안전 |
| 새로운 안전성/유효성 문제 없음 | ✅ 없음 |
| 최종 SE 판정 | ✅ **실질적으로 동등(Substantially Equivalent)** |

### 7.2 SE 결론 선언

> "model-name Console SW는 Vieworks VXvue (K251410) 및 DRTECH EConsole1 (K231225)와 동일한 의도된 사용을 가지며, 기술 특성에서의 차이점이 새로운 안전성 또는 유효성 문제를 제기하지 않음을 비교 분석을 통해 확인하였다. 따라서 model-name Console SW는 상기 Predicate Device와 실질적으로 동등하다.
>
> (model-name Console SW has the same intended use as Vieworks VXvue (K251410) and DRTECH EConsole1 (K231225), and the differences in technological characteristics do not raise new questions of safety and effectiveness, as supported by the comparative analysis above. Therefore, model-name Console SW is Substantially Equivalent to the predicate devices.)"

---

## 8. 참조 Predicate 510(k) 요약 정보

> *(FDA AIMDD/510(k) 데이터베이스 조회 후 작성)*

| 항목 | EConsole1 (K231225) | VXvue (K251410) | XmaruView (K160579) |
|---|---|---|---|
| Decision Date | 2023년 [작성 필요] | 2025년 [작성 필요] | 2016년 [작성 필요] |
| Decision | Substantially Equivalent | Substantially Equivalent | Substantially Equivalent |
| Primary Predicate (of Predicate) | [K번호 기재] | [K번호 기재] | [K번호 기재] |
| Review Time | [일수 기재] | [일수 기재] | [일수 기재] |

---

## 9. 변경 이력

| 버전 | 변경 일자 | 변경 내용 | 변경자 |
|---|---|---|---|
| 0.1 | ____-__-__ | 초안 작성 | |
| | | | |

## 10. 승인

| 역할 | 성명 | 서명 | 일자 |
|---|---|---|---|
| 작성자 | | | |
| 검토자 (RA) | | | |
| 승인자 | | | |

---

---
## 비고: 이 문서가 필요한 이유

### 이 문서가 없으면?
510(k)의 핵심 논리는 "이 제품은 이미 허가된 기기와 실질적으로 동등하다"는 증명이다. Predicate Comparison 없이는 이 논리 자체를 제시할 수 없으므로 FDA 510(k) 제출이 불가능하다. 21 CFR §807.87(f)는 Predicate Device와의 비교 정보 포함을 의무화하며, FDA eSTAR의 Section 10(Substantial Equivalence Comparison)이 이 문서의 내용을 직접 입력·참조한다. 이 문서 없이 eSTAR를 완성할 수 없고, eSTAR 미완성은 곧 접수 불가(RTA)를 의미한다.

### 시장별 요구 수준
| 시장 | 요구 수준 | 설명 |
|------|----------|------|
| FDA | 필수 | 21 CFR §807.87(f) 명시 의무. eSTAR Section 10에 직접 입력 필요. 미포함 시 RTA(접수 거절) |
| MFDS | 해당 없음 | MFDS 허가 경로는 Predicate 비교 방식이 아닌 기술 문서 심사 방식으로 진행 |
| EU MDR | 해당 없음 | EU MDR은 Predicate 비교 대신 GSPR(E03) 및 CER(F01) 기반 적합성 평가 방식 사용 |

### 최소 필수 vs 리스크 최소화
- **최소 필수**: 의도된 사용(Intended Use) 비교, 기술 특성(Technical Characteristics) 비교, 차이점 설명 및 "새로운 위험 없음" 논거. 이 세 가지 없이 510(k) 심사관이 실질적 동등성을 판단할 수 없어 Additional Information(AI) 요청이 확실시된다.
- **리스크 최소화**: 성능 데이터 비교표(감도·특이도·정확도)와 소프트웨어 버전별 검증 데이터까지 포함하면 심사관이 AI 요청 없이 독자적으로 판단 가능해 심사 기간을 평균 30~60일 단축할 수 있다. 최신 Predicate(K251410, VXvue 2025년)를 주 Predicate로 활용하면 현행 FDA 심사 기준 충족에 유리하다.

### 외주 개발 시 유의사항
Predicate의 의도된 사용 원문은 반드시 FDA 510(k) 데이터베이스(https://www.fda.gov/medical-devices/510k-clearances)에서 해당 K번호 결정 서한을 직접 조회하여 기재해야 한다. 외주 RA 컨설턴트가 작성하더라도 company-name 내부 담당자가 원문과 대조·검토하지 않으면 인용 오류로 FDA AI 요청을 받는 사례가 빈번하다. Split Predicate 전략(의도된 사용과 기술 특성을 서로 다른 Predicate에서 인용) 사용 시 사전에 FDA Pre-Sub 미팅을 통해 전략 유효성을 확인하는 것을 권장한다.
