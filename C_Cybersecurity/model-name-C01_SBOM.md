# SBOM 관리 문서 (Software Bill of Materials — Cover Sheet)

> **문서 번호**: model-name-C01  
> **버전**: 0.1 (Draft)  
> **작성일**: ____-__-__  
> **작성자**: ____________  
> **검토자**: ____________  
> **승인자**: ____________  
> **제품**: model-name Console SW  
> **회사**: company-name  
> **분류**: ✅ 최소 필수 (FDA / EU MDR) | ⭐ 리스크 최소화 (MFDS)  
> **적용 시장**: FDA (필수), EU MDR (필수), MFDS (권장)  
> **근거 규격**: FD&C Act §524B(b)(3), FDA Cybersecurity Guidance (Feb 2026), Executive Order 14028 (SBOM), SPDX 2.3 또는 CycloneDX 1.5  

---

## ⚠️ 본 문서의 성격에 대한 중요 안내

> **SBOM 파일 자체는 기계 판독 가능한 JSON 또는 XML 형식**으로 별도 생성·첨부된다.  
> 본 문서(model-name-C01)는 해당 SBOM 파일의 **관리 문서(Cover Sheet)**로서:  
> - SBOM 생성 방법, 도구, 형식, 버전 정보를 기록하고  
> - SBOM 컴포넌트의 주요 항목을 인간 가독 형식으로 요약하며  
> - NTIA 최소 요소 충족 여부 및 CVE 교차검증 결과를 확인한다.  
>
> FDA 제출 시 반드시 SBOM 원본 JSON/XML 파일(`model-name-vX.X.X-sbom.spdx.json` 등)을 함께 첨부해야 한다.

---

## 1. 문서 정보

| 항목 | 내용 |
|---|---|
| 제품명 | model-name Console SW |
| 회사명 | company-name |
| SW 버전 | v[작성 필요] |
| SBOM 파일명 | `model-name-v[작성 필요]-sbom.[spdx.json / bom.json]` |
| SBOM 파일 해시 (SHA-256) | [작성 필요] |
| 기준 날짜 | ____-__-__ |
| 의존 문서 | model-name-A04 (SOUP 목록) |

---

## 2. SBOM 생성 방법

### 2.1 생성 도구

| 항목 | 내용 |
|---|---|
| 도구 이름 | [예: Syft v1.x / Microsoft SBOM Tool v1.x / CycloneDX Generator / FOSSA] |
| 도구 버전 | v[작성 필요] |
| 도구 출처 | [URL: 예: https://github.com/anchore/syft] |
| 실행 명령어 (참고용) | `syft model-name-v[버전].exe -o spdx-json > model-name-sbom.spdx.json` |

> **권장 도구 설명**  
> - **Syft (Anchore)**: 바이너리 및 소스코드 분석, SPDX / CycloneDX 양쪽 출력 지원. 무료 오픈소스.  
> - **Trivy (Aqua Security)**: 컨테이너·파일시스템 스캔. CVE 연동(Grype) 가능.  
> - **FOSSA**: 상용, 라이선스 컴플라이언스 특화. 대규모 조직에 적합.  
> - **Microsoft SBOM Tool**: Windows 환경 .NET 프로젝트에 최적화.

### 2.2 SBOM 형식

| 항목 | 선택 |
|---|---|
| SPDX 2.3 (ISO/IEC 5962:2021) | ☐ 선택 |
| CycloneDX 1.5 (OWASP) | ☐ 선택 |
| 양쪽 모두 생성 | ☐ 선택 (권장 — FDA와 EU 모두 커버) |

> **형식 선택 지침**: FDA는 SPDX와 CycloneDX 모두 수용한다. CycloneDX는 VEX(model-name-C02) 연동이 더 자연스럽다. 양쪽 모두 생성 시 커버리지가 가장 넓다.

### 2.3 생성 환경 및 SW 버전

| 항목 | 내용 |
|---|---|
| 빌드 환경 OS | [예: Windows 11 22H2 / Ubuntu 22.04] |
| .NET SDK 버전 | [예: .NET 8.0.xxx] |
| 빌드 도구 | [예: Visual Studio 2022 17.x / MSBuild 17.x] |
| CI/CD 파이프라인 통합 여부 | ☐ 예 (자동 생성) / ☐ 아니오 (수동 생성) |
| SBOM 재생성 트리거 | ☐ 릴리즈 빌드 시 자동 / ☐ 수동 |

---

## 3. SBOM 구성 요소 요약

| 구분 | 컴포넌트 수 | 비고 |
|---|---|---|
| 1st Party (자체 개발 모듈) | [작성 필요] | company-name 내부 개발 |
| 3rd Party — 오픈소스 (OSS) | [작성 필요] | 라이선스 검토 필요 |
| 3rd Party — 상용 라이브러리 | [작성 필요] | 공급사 계약 확인 |
| 3rd Party — OS/런타임 의존성 | [작성 필요] | .NET Runtime, Windows 구성 요소 등 |
| **총합** | **[작성 필요]** | |

---

## 4. SBOM 컴포넌트 목록 (주요 항목)

> **작성 지침**: SBOM 파일(JSON/XML)에는 모든 컴포넌트가 포함된다. 본 표는 주요 항목만 기재한다. 전체 목록은 첨부 SBOM 파일을 참조.

| # | 패키지 이름 | 버전 | 공급사 | PURL (Package URL) | 라이선스 | 해시 (SHA-256, 앞 8자리) | EOS 날짜 | 관계 |
|---|---|---|---|---|---|---|---|---|
| 1 | model-name.Core | [작성 필요] | company-name | `pkg:nuget/model-name.Core@[버전]` | Proprietary | [작성 필요] | [해당 없음] | DESCRIBES |
| 2 | model-name.Viewer | [작성 필요] | company-name | `pkg:nuget/model-name.Viewer@[버전]` | Proprietary | [작성 필요] | [해당 없음] | CONTAINS |
| 3 | DCMTK | 3.6.8 | OFFIS e.V. | `pkg:github/DCMTK/DCMTK@3.6.8` | BSD-3-Clause | [작성 필요] | [작성 필요] | CONTAINS |
| 4 | OpenSSL | 3.x.x | OpenSSL Project | `pkg:openssl/openssl@3.x.x` | Apache-2.0 | [작성 필요] | [작성 필요] | CONTAINS |
| 5 | .NET Runtime | 8.0.x | Microsoft | `pkg:nuget/Microsoft.NETCore.App@8.0.x` | MIT | [작성 필요] | 2026-11-10 | CONTAINS |
| 6 | [라이브러리명] | [작성 필요] | [작성 필요] | `pkg:[type]/[name]@[버전]` | [작성 필요] | [작성 필요] | [작성 필요] | [작성 필요] |
| ... | | | | | | | | |

> **컬럼 설명**  
> - **PURL**: Package URL 형식 (`pkg:type/namespace/name@version`). 기계 판독 가능 식별자.  
> - **EOS 날짜**: End of Support 날짜. 이 날짜 이후 해당 컴포넌트의 보안 패치가 제공되지 않으므로 VMP에서 관리 필요.  
> - **관계**: SPDX 관계 유형 (`DESCRIBES`, `CONTAINS`, `DEPENDS_ON` 등).

---

## 5. NTIA 최소 요소 체크리스트

> NTIA(미국 통신정보청)가 정의한 SBOM 최소 요소 7가지 준수 여부를 확인한다.  
> FDA는 NTIA 최소 요소 충족을 기본 요건으로 명시하고 있다.

| # | NTIA 최소 요소 | 해당 SBOM 필드 | 충족 여부 | 비고 |
|---|---|---|---|---|
| 1 | **공급자 이름 (Supplier Name)** | `supplier` / `organization` | ☐ 충족 / ☐ 미충족 | |
| 2 | **컴포넌트 이름 (Component Name)** | `name` | ☐ 충족 / ☐ 미충족 | |
| 3 | **컴포넌트 버전 (Version of the Component)** | `version` | ☐ 충족 / ☐ 미충족 | |
| 4 | **기타 고유 식별자 (Other Unique Identifiers)** | `purl` / `cpe` | ☐ 충족 / ☐ 미충족 | PURL 또는 CPE 중 하나 이상 |
| 5 | **종속성 관계 (Dependency Relationship)** | `relationships` / `dependencies` | ☐ 충족 / ☐ 미충족 | |
| 6 | **SBOM 데이터 저작자 (Author of SBOM Data)** | `creator` / `authors` | ☐ 충족 / ☐ 미충족 | |
| 7 | **타임스탬프 (Timestamp)** | `created` / `timestamp` | ☐ 충족 / ☐ 미충족 | ISO 8601 형식 |

> **NTIA 미충족 항목 처리**: 미충족 항목이 있을 경우 해결 계획을 아래 7절에 기재한다.

---

## 6. CVE 교차검증 결과 요약

> SBOM 생성 직후 취약점 스캐너를 실행하여 알려진 CVE를 조회한 결과를 요약한다.  
> 상세 분석은 VEX 리포트(model-name-C02)에서 수행한다.

### 6.1 스캔 도구 및 결과 개요

| 항목 | 내용 |
|---|---|
| 스캔 도구 | [예: Grype v0.x / Trivy v0.x / Snyk] |
| 스캔 실행 일자 | ____-__-__ |
| NVD 데이터 기준일 | ____-__-__ |
| 스캔 대상 SBOM | `model-name-v[버전]-sbom.[spdx.json / bom.json]` |

### 6.2 CVE 탐지 요약

| 심각도 | 탐지 CVE 수 | VEX 분석 완료 | Not Affected | Fixed | Affected (패치 필요) | 조사 중 |
|---|---|---|---|---|---|---|
| Critical (CVSS 9.0+) | [작성 필요] | ☐ | [작성 필요] | [작성 필요] | [작성 필요] | [작성 필요] |
| High (CVSS 7.0~8.9) | [작성 필요] | ☐ | [작성 필요] | [작성 필요] | [작성 필요] | [작성 필요] |
| Medium (CVSS 4.0~6.9) | [작성 필요] | ☐ | [작성 필요] | [작성 필요] | [작성 필요] | [작성 필요] |
| Low (CVSS 0.1~3.9) | [작성 필요] | ☐ | [작성 필요] | [작성 필요] | [작성 필요] | [작성 필요] |
| **합계** | **[작성 필요]** | | | | | |

> **참조**: 개별 CVE에 대한 상세 분석 결과(착취 가능성, 판정 근거, 완화 조치)는 **model-name-C02 (VEX 리포트)**를 참조한다.

### 6.3 즉시 조치 필요 항목 (Affected 판정)

| CVE ID | 컴포넌트 | CVSS | 조치 계획 | 목표 완료일 |
|---|---|---|---|---|
| [작성 필요] | [작성 필요] | [작성 필요] | [작성 필요] | ____-__-__ |

---

## 7. SBOM 업데이트 정책

| 트리거 | SBOM 업데이트 의무 |
|---|---|
| 정기 SW 릴리즈 (Major/Minor/Patch) | ✅ 의무 — 릴리즈 빌드와 동시 재생성 |
| 긴급 보안 패치 릴리즈 | ✅ 의무 |
| 의존성(라이브러리) 추가·변경·삭제 | ✅ 의무 |
| 연간 정기 검토 | ✅ 의무 — 변경 없어도 재확인 |
| 위협 모델 주요 업데이트 | ⭐ 권장 |

> **CI/CD 통합 권장**: SBOM 재생성을 릴리즈 파이프라인에 통합(예: GitHub Actions, Azure DevOps)하면 수작업 오류를 방지할 수 있다.

---

## 8. 첨부 파일 목록

| # | 파일명 | 형식 | 설명 | 해시 (SHA-256) |
|---|---|---|---|---|
| 1 | `model-name-v[버전]-sbom.spdx.json` | JSON (SPDX 2.3) | SBOM 원본 파일 (기계 판독) | [작성 필요] |
| 2 | `model-name-v[버전]-bom.json` | JSON (CycloneDX 1.5) | SBOM 원본 파일 (기계 판독) | [작성 필요] |
| 3 | `model-name-v[버전]-cve-scan.txt` | Text | 취약점 스캔 원시 출력 | [작성 필요] |

---

## 9. 변경 이력

| 버전 | 변경일 | 변경자 | 변경 내용 |
|---|---|---|---|
| 0.1 | ____-__-__ | ____________ | 초안 작성 |

---

## 10. 승인

| 역할 | 이름 | 서명 | 일자 |
|---|---|---|---|
| 작성자 | ____________ | ____________ | ____-__-__ |
| 검토자 (사이버보안 담당) | ____________ | ____________ | ____-__-__ |
| 승인자 (QA/RA 책임자) | ____________ | ____________ | ____-__-__ |

---

## 비고: 이 문서가 필요한 이유

### 이 문서가 없으면?

SBOM(Software Bill of Materials)은 단순한 산출물이 아니라 법적 의무다. FD&C Act §524B(b)(3)는 2023년 12월부터 모든 신규 의료기기 SW 510(k) 제출 시 SBOM을 필수로 요구하며, 이를 제출하지 않으면 FDA는 기술 검토 착수 전에 eSTAR Technical Screening Hold를 발행한다. 즉, 접수 자체가 거부된다. 단순 지연이 아니라 심사 절차 진입 자체가 불가능해지는 것이다. SBOM 형식도 중요한데, 표 형식 PDF나 Word 문서는 수용되지 않으며 반드시 기계 판독 가능한 형식(CycloneDX JSON/XML 또는 SPDX)이어야 한다.

- **FDA**: §524B(b)(3) 법적 의무. SBOM 미제출 또는 비적합 형식(PDF 등) 제출 시 eSTAR Technical Screening Hold(접수 거부). 심사 지연이 아니라 접수 불가다. SOUP 목록(A04)과 교차검증 시 불일치하면 두 문서 모두 deficiency 대상이 된다.
- **MFDS**: 현재 공식 의무화하지 않았으나, 2025년 이후 강화된 디지털의료기기 사이버보안 안내서 개정에서 SBOM 요건 포함이 예고되어 있다. 지금 준비하지 않으면 인허가 후 보완 요구를 받는다.
- **EU MDR**: Annex I §17.2 사이버보안 요건 및 UDI 기술 문서의 일부로 SW 구성 요소 목록을 요구한다. SBOM은 이 요건의 가장 효율적인 이행 수단이다.

### 시장별 요구 수준

| 시장 | 요구 수준 | 설명 |
|------|----------|------|
| FDA | 필수 | §524B(b)(3) 법적 의무. 미제출 시 eSTAR Technical Screening Hold(접수 거부). 기계 판독 형식 필수 |
| MFDS | 권장 | 현재 의무 없으나 안내서 개정 예고. 조기 준비 시 추후 재작업 불필요 |
| EU MDR | 필수 | Annex I §17.2 + UDI 기술 문서 요건. SBOM이 가장 효율적인 이행 수단 |

### 최소 필수 vs 리스크 최소화

- **최소 필수로 작성할 경우**: CycloneDX 1.4 이상 또는 SPDX 2.2 이상 형식으로 모든 SW 컴포넌트(1st party 포함)를 포함한다. NTIA 최소 필수 요소(컴포넌트명, 버전, 공급업체, 고유 식별자, 의존성 관계, 작성자, 타임스탬프)를 빠짐없이 기재한다. Syft 또는 FOSSA 등 자동화 도구를 사용하면 수동 작성 대비 오류가 크게 줄어든다.
- **리스크 최소화로 확장할 경우**: CI/CD 파이프라인에 SBOM 자동 생성을 통합하면 릴리즈마다 최신 SBOM이 자동으로 업데이트된다. VEX(C02)와 연동하여 CVE 상태를 SBOM에 함께 관리하면 FDA 사이버보안 심사관의 교차검증에서 모든 취약점 상태를 즉시 제시할 수 있다. SOUP 목록(A04)에서 SBOM을 파생 생성하는 워크플로를 구축하면 두 문서의 일관성이 자동으로 유지된다.

### 외주 개발 시 유의사항

외주 개발 시 SBOM의 완전성이 큰 문제가 된다. 외주사가 사용한 모든 라이브러리가 SBOM에 포함되어야 하며, 외주사가 통보하지 않은 컴포넌트가 있을 수 있다. SOW에 다음을 명시할 것: ① 외주사는 납품 산출물과 함께 CycloneDX 형식 SBOM 제출 의무, ② company-name은 납품 후 독립적으로 Syft/FOSSA 스캔을 실시하여 외주사 제출 SBOM과 비교 검증, ③ SBOM 불일치 발견 시 외주사는 즉시 보완 의무. SBOM의 법적 정확성에 대한 최종 책임은 company-name에 있으므로 외주사 제출 SBOM을 그대로 FDA에 제출하지 말고 반드시 내부 검증을 거쳐야 한다.
