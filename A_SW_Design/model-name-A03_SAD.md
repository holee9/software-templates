# SW 아키텍처 설계서 (Software Architecture Design)

> **문서 번호**: model-name-A03  
> **버전**: 0.1 (Draft)  
> **작성일**: ____-__-__  
> **작성자**: ____________  
> **검토자**: ____________  
> **승인자**: ____________  
> **제품**: model-name Console SW  
> **회사**: company-name  
> **분류**: ✅ 최소 필수  
> **적용 시장**: FDA ✅ / MFDS ✅ / EU MDR ✅  
> **근거 규격**: IEC 62304 §5.3, FDA SW Guidance (2019) Section IV-C  
> **IEC 62304 Class**: B (Basic Level)

---

## 변경 이력

| 버전 | 일자 | 변경 내용 | 작성자 |
|------|------|-----------|--------|
| 0.1  |      | 최초 작성  |        |

---

## 1. 목적

본 문서는 SRS(model-name-A02) 요구사항을 충족하기 위한 SW 구성 요소(컴포넌트), 인터페이스, 데이터 흐름을 정의한다.  
IEC 62304 Class B에서 요구하는 아키텍처 수준 명세를 제공하며, FDA eSTAR에서 요구하는 SW 아키텍처 다이어그램의 문서 형태이다.  
본 설계서를 기반으로 구현(코딩) 및 통합 시험 계획이 수립된다.

---

## 2. 범위

| 항목 | 내용 |
|------|------|
| 적용 SW | model-name Console SW v[작성 필요] |
| 설계 수준 | 아키텍처 레벨 (IEC 62304 Class B 최소 요건) |
| 상세 설계서(SDD) | Class B에서 선택적 — 본 문서에서 대체 |
| 운영 환경 | Windows 10/11 64-bit 워크스테이션 |
| 제외 범위 | 검출기 펌웨어, PACS 서버 내부 구조 |

---

## 3. 관련 문서

| 문서 번호 | 문서명 | 관계 |
|-----------|--------|------|
| model-name-A02 | SW 요구사항 명세서 (SRS) | 본 SAD의 입력 |
| model-name-A04 | SOUP 목록 | SOUP 연동 참조 |
| model-name-B01 | 통합 시험 결과서 | 본 SAD 기반 시험 |
| model-name-B03 | 추적성 매트릭스 (RTM) | SRS ↔ SAD 추적 |
| model-name-D01 | 위험 관리 파일 | 안전 아키텍처 근거 |
| IEC 62304:2006+AMD1:2015 | SW 수명주기 표준 | 근거 규격 §5.3 |

---

## 4. 본문

### 4.1 아키텍처 개요

#### 4.1.1 설계 원칙

- **모듈화**: 각 기능은 독립적인 컴포넌트로 분리하여 변경 영향 최소화
- **SOUP 격리**: 모든 SOUP(제3자 라이브러리)는 Wrapper 또는 Adapter 패턴으로 감싸 직접 의존성 최소화
- **보안 내재화**: 인증·암호화·감사 로그는 별도 Security Module이 전담
- **단방향 의존성**: 상위 레이어는 하위 레이어에만 의존 (순환 의존 금지)

#### 4.1.2 시스템 블록 다이어그램 (개념)

```
┌──────────────────────────────────────────────────────────┐
│                   model-name Console SW                        │
│                                                           │
│  ┌──────────────┐   ┌──────────────┐   ┌─────────────┐  │
│  │  UI Module   │   │ Image        │   │  Security   │  │
│  │  (Presenta-  │◄──│ Processing   │   │  Module     │  │
│  │   tion)      │   │  Module      │   │             │  │
│  └──────┬───────┘   └──────┬───────┘   └──────┬──────┘  │
│         │                  │                   │          │
│  ┌──────▼───────────────────▼───────────────────▼──────┐ │
│  │              Business Logic Layer                     │ │
│  │  (Worklist, Study Management, Report Generation)      │ │
│  └──────────────────────────┬────────────────────────── ┘ │
│                             │                             │
│  ┌──────────────────────────▼────────────────────────── ┐ │
│  │                  Data Access Layer                     │ │
│  │    (DICOM Engine / Local Storage / Config Manager)    │ │
│  └──────┬────────────────────────────────────┬──────────┘ │
│         │                                    │             │
│  ┌──────▼──────┐                    ┌────────▼─────────┐  │
│  │  HW Abstrac-│                    │  Network Stack   │  │
│  │  tion Layer │                    │  (TLS/DICOM Net) │  │
│  └──────┬──────┘                    └────────┬─────────┘  │
└─────────┼──────────────────────────────────── ┼───────────┘
          │                                     │
   ┌──────▼──────┐                    ┌─────────▼────────┐
   │  DR 검출기   │                    │  PACS / HIS/RIS  │
   └─────────────┘                    └──────────────────┘
```

> **주의**: 위 다이어그램은 개념적 표현이다. 실제 구현 시 상세 블록 다이어그램(UML Component Diagram 또는 Block Diagram)을 첨부하여 본 섹션을 대체한다.

#### 4.1.3 레이어 구조

| 레이어 | 구성 모듈 | 책임 |
|--------|-----------|------|
| Presentation Layer | UI Module | 사용자 인터페이스, 영상 렌더링, 이벤트 처리 |
| Business Logic Layer | Worklist Manager, Study Manager, Report Generator | 임상 워크플로우 로직 |
| Data Access Layer | DICOM Engine, Local Storage, Config Manager | 데이터 I/O 추상화 |
| HW Abstraction Layer | Detector Interface | 검출기 드라이버 추상화 |
| Network Stack | DICOM Network, TLS Manager | 네트워크 통신 |
| Security Module | Auth Manager, Session Manager, Audit Logger | 보안 기능 (횡단 관심사) |

---

### 4.2 SW 컴포넌트 목록

| 컴포넌트 ID | 컴포넌트명 | 기능 요약 | IEC 62304 클래스 | SOUP 여부 | 관련 SRS |
|-------------|-----------|----------|-----------------|----------|---------|
| COMP-001 | UI Module | 영상 표시, WL/WW 조절, Pan/Zoom, 주석 도구 | B | No | SWR-010~SWR-034 |
| COMP-002 | DICOM Engine | DICOM 파싱·생성·C-STORE·C-FIND·MWL | B | Yes (DCMTK) | SWR-040~SWR-043 |
| COMP-003 | Image Processing Module | 히스토그램, LUT, 노이즈 저감, 측정 계산 | B | No | SWR-020~SWR-023 |
| COMP-004 | Security Module | 사용자 인증(RBAC), 세션 관리, TLS, 감사 로그 | B | Yes (OpenSSL) | SWR-050~SWR-054 |
| COMP-005 | Detector Interface | 검출기 드라이버 Wrapper, 영상 데이터 수신 | B | Yes (검출기 SDK) | SWR-001~SWR-004 |
| COMP-006 | Local Storage Manager | DICOM 파일 I/O, 환자 데이터 로컬 저장, 암호화 | B | No | SWR-SEC-002 |
| COMP-007 | Worklist Manager | MWL 조회, 환자 정보 연동, HIS/RIS 인터페이스 | B | No | SWR-IF-012, SWR-IF-013 |
| COMP-008 | Config Manager | 시스템 설정 관리, DICOM 노드 설정 | B | No | - |
| COMP-009 | Update Manager | SW 자동 업데이트, 버전 검증 | B | No | SWR-SEC-003 |

---

### 4.3 컴포넌트 간 인터페이스

| 인터페이스 ID | 제공자 | 소비자 | 설명 | 데이터 형식 | 방향 |
|--------------|--------|--------|------|------------|------|
| IF-001 | COMP-002 (DICOM Engine) | COMP-001 (UI Module) | 영상 픽셀 데이터 전달 | Internal Buffer (16-bit/Pixel) | → |
| IF-002 | COMP-005 (Detector Interface) | COMP-002 (DICOM Engine) | 검출기 원시 데이터 → DICOM 변환 | Raw Image Data | → |
| IF-003 | COMP-001 (UI Module) | COMP-003 (Image Processing) | 처리 요청 및 결과 수신 | API Call / Callback | ↔ |
| IF-004 | COMP-004 (Security Module) | COMP-001, 002, 006, 007 | 인증 상태 확인, 세션 토큰 | API / Event | → |
| IF-005 | COMP-002 (DICOM Engine) | COMP-006 (Local Storage) | DICOM 파일 저장/로드 | DICOM File (*.dcm) | ↔ |
| IF-006 | COMP-007 (Worklist Manager) | COMP-001 (UI Module) | 환자 워크리스트 표시 | HL7/DICOM MWL | → |
| IF-007 | COMP-002 (DICOM Engine) | 외부 PACS | C-STORE, C-FIND, C-MOVE | DICOM over TLS | ↔ |

---

### 4.4 외부 인터페이스 상세

#### 4.4.1 검출기 인터페이스

| 항목 | 내용 |
|------|------|
| 연결 방식 | USB 3.0 / GigE (검출기 모델별 상이 — 지원 모델 목록 별도 관리) |
| 드라이버 계층 | COMP-005 Detector Interface (Wrapper 패턴) |
| 검출기 SDK | [작성 필요 — SOUP-00x 참조] |
| 데이터 형식 | 원시 X-ray 이미지 데이터 → DICOM 변환 |
| 오류 처리 | 연결 실패/타임아웃 시 사용자 알림 및 로그 기록 |

#### 4.4.2 PACS 인터페이스

| DICOM 서비스 | 역할 | 프로토콜 | 포트 |
|-------------|------|---------|------|
| C-STORE SCU | PACS로 영상 전송 | DICOM over TLS | [작성 필요] |
| C-FIND SCU | PACS에서 영상 조회 | DICOM over TLS | [작성 필요] |
| C-MOVE SCU | PACS에서 영상 수신 | DICOM over TLS | [작성 필요] |
| C-ECHO SCU | PACS 연결 확인 | DICOM | [작성 필요] |

#### 4.4.3 네트워크 보안

- 모든 DICOM 네트워크 통신은 TLS 1.2 이상 적용
- 허용 Cipher Suite: [작성 필요]
- 인증서 관리: [작성 필요]

---

### 4.5 데이터 흐름도 (Data Flow)

#### 4.5.1 주요 시나리오: 영상 획득 및 PACS 전송

```
[DR 검출기] → (Raw Image) → [COMP-005 Detector I/F]
    → (Raw Image) → [COMP-002 DICOM Engine]
    → (DICOM 생성) → [COMP-006 Local Storage] (로컬 저장)
    → (DICOM 영상 데이터) → [COMP-001 UI Module] (화면 표시)
    ← (전송 요청) ← [사용자 조작]
    → [COMP-002 DICOM Engine] → (C-STORE over TLS) → [외부 PACS]
```

#### 4.5.2 주요 시나리오: 워크리스트 조회

```
[사용자] → (환자 검색 요청) → [COMP-007 Worklist Manager]
    → (DICOM MWL C-FIND) → [HIS/RIS 또는 PACS]
    ← (환자 목록) ← [COMP-007]
    → (화면 표시) → [COMP-001 UI Module]
```

---

### 4.6 배포 구성 (Deployment Architecture)

| 항목 | 내용 |
|------|------|
| 운영 OS | Windows 10 (22H2 이상) / Windows 11 64-bit |
| 설치 방식 | MSI 인스톨러 (코드 서명 적용) |
| 설치 경로 | `C:\Program Files\model-name\` (기본값) |
| 데이터 저장 경로 | `[작성 필요]` (DICOM 로컬 저장소) |
| 로그 파일 경로 | `[작성 필요]` |
| 다중 인스턴스 | 지원 여부: [작성 필요] |
| 최소 HW 사양 | CPU: [작성 필요], RAM: [작성 필요] GB, Disk: [작성 필요] GB |
| 권장 HW 사양 | CPU: [작성 필요], RAM: [작성 필요] GB, GPU: [작성 필요] |

---

### 4.7 SOUP 연동 아키텍처

> SOUP 상세 정보는 SOUP 목록(model-name-A04) 참조

| SOUP | 연동 컴포넌트 | 연동 방식 | 격리 전략 |
|------|-------------|----------|----------|
| .NET Runtime | 전체 애플리케이션 | 런타임 환경 | OS 레벨 분리 |
| DCMTK | COMP-002 DICOM Engine | Wrapper 클래스 | DicomEngineWrapper 클래스로 격리 |
| OpenSSL | COMP-004 Security Module | Wrapper 클래스 | CryptoWrapper 클래스로 격리 |
| 검출기 SDK | COMP-005 Detector Interface | Adapter 패턴 | DetectorAdapter 인터페이스로 격리 |
| [추가 SOUP] | [컴포넌트] | [방식] | [격리 전략] |

**SOUP 격리 원칙**: 모든 SOUP는 직접 호출 대신 Wrapper/Adapter 클래스를 통해 호출한다. 이를 통해 SOUP 버전 변경 시 영향 범위를 Wrapper 클래스로 한정한다.

---

### 4.8 보안 아키텍처

#### 4.8.1 인증 및 인가 흐름

```
[사용자 로그인] → [COMP-004 Auth Manager]
    → 비밀번호 해시 검증 (bcrypt/PBKDF2)
    → 세션 토큰 발급 (JWT 또는 동등 메커니즘)
    → RBAC 역할 확인 (Radiographer / Radiologist / Admin)
    → 역할별 기능 접근 제어
```

#### 4.8.2 데이터 암호화 범위

| 대상 | 암호화 방식 | 키 관리 |
|------|-----------|--------|
| 네트워크 전송 (DICOM) | TLS 1.2 이상 | 인증서 기반 |
| 로컬 저장 PHI | AES-256 | [작성 필요] |
| 설정 파일 (비밀번호 포함) | [작성 필요] | [작성 필요] |

#### 4.8.3 감사 로그 (Audit Log) 아키텍처

| 로그 이벤트 유형 | 기록 내용 |
|----------------|----------|
| 로그인/로그아웃 | 사용자 ID, 타임스탬프, IP |
| 영상 조회/출력 | 사용자 ID, 환자 ID, 영상 ID, 타임스탬프 |
| PACS 전송 | 사용자 ID, 대상 PACS, 전송 결과 |
| 설정 변경 | 사용자 ID, 변경 항목, 전/후 값 |
| 오류 이벤트 | 오류 코드, 스택 트레이스 (PHI 제외) |

- 로그 저장소: [작성 필요]  
- 로그 보존 기간: [최소 2년 이상 권장]  
- 로그 무결성 보호: [작성 필요]

---

## 비고: 이 문서가 필요한 이유

### 이 문서가 없으면?

SAD(Software Architecture Design)는 소프트웨어가 "어떻게 구성되어 있는가"를 설명하는 유일한 문서다. IEC 62304 Class B 이상에서 필수이며, 이 문서 없이는 SOUP(제3자 라이브러리) 연동의 위험 평가 근거도, 사이버보안 위협 모델의 분석 범위도 설정할 수 없다. FDA 심사관은 아키텍처 다이어그램만으로는 부족하다고 명시하고 있으며, 컴포넌트 설명과 인터페이스 명세가 함께 제출되어야 한다. EU MDR Notified Body는 SAD 없이는 SOUP 격리 전략과 사이버보안 설계 검토를 진행하지 않는다.

- **FDA**: eSTAR Section 12는 아키텍처 다이어그램(block diagram)을 명시적으로 요구한다. 다이어그램만 제출하고 컴포넌트 설명(§4.2)이 없으면 AI(Additional Information) 요청 대상이 된다.
- **MFDS**: 의료기기 소프트웨어 심사 시 시스템 구성도와 소프트웨어 구조 설명을 요구한다. SAD는 이 요건의 직접적 이행 문서다.
- **EU MDR**: Annex II §3.2는 "소프트웨어의 설계 및 제조 정보"를 요구하며, SOUP 격리 전략(§4.7)은 Notified Body 심사에서 특히 집중 검토된다.

### 시장별 요구 수준

| 시장 | 요구 수준 | 설명 |
|------|----------|------|
| FDA | 필수 | eSTAR Section 12 아키텍처 다이어그램 + 컴포넌트 설명 요구. 다이어그램만으로 불충분 |
| MFDS | 필수 | 시스템 구성도 및 SW 구조 설명 필수. Class B 이상에서 SAD 없이 허가 신청 불가 |
| EU MDR | 필수 | Annex II §3.2 직접 요건. SOUP 격리 전략은 Notified Body 필수 검토 항목 |

### 최소 필수 vs 리스크 최소화

- **최소 필수로 작성할 경우**: §4.1의 아키텍처 블록 다이어그램, §4.2의 컴포넌트 설명(역할·책임·인터페이스), §4.4의 외부 인터페이스 명세, §4.6의 SOUP 목록 참조를 포함한다. IEC 62304 Class B 최소 요건은 이것으로 충족된다. 상세 설계서(SDD)는 Class B에서 선택 사항이므로 SAD만으로 제출 가능하다.
- **리스크 최소화로 확장할 경우**: SOUP Wrapper 패턴(§4.7)을 적용하면 SOUP 버전 업데이트 시 광범위한 코드 변경과 재검증이 불필요해진다. 사이버보안 위협 모델(C04)의 신뢰 경계선과 SAD의 아키텍처를 일치시키면 C04~C07 전체 사이버보안 산출물의 일관성이 확보되어 FDA 심사관의 교차 검증에서 지적 사항이 줄어든다. AI/ML 컴포넌트가 있는 경우 해당 컴포넌트에 대한 SDD 수준의 상세화를 추가하면 FDA의 AI/ML 기반 SaMD 가이던스 요건을 사전 충족할 수 있다.

### 외주 개발 시 유의사항

SAD는 외주 개발 품질을 검증하는 가장 중요한 수단이다. 외주사에 SAD 작성을 요청할 때 SOW에 다음을 명시할 것: ① company-name의 SRS(A02)를 기반으로 아키텍처 설계, ② 신뢰 경계선(Trust Boundary) 포함 DFD 제출 의무(C04 위협 모델과 연계), ③ SOUP Wrapper 패턴 적용 여부 및 미적용 시 기술적 정당화 문서 제출. 외주사 납품 후 company-name의 SW 아키텍트 또는 RA 담당자가 SAD를 검토하여 SRS 요구사항과의 일치 여부를 반드시 확인해야 한다.



## 6. 변경 이력

| 버전 | 일자 | 변경 내용 | 작성자 |
|------|------|-----------|--------|
| 0.1  |      | 최초 작성  |        |

---

## 7. 승인란

| 역할 | 성명 | 서명 | 일자 |
|------|------|------|------|
| 작성자 (SW 아키텍트) | | | |
| 검토자 (QA 책임자) | | | |
| 검토자 (RA 담당자) | | | |
| 검토자 (사이버보안 담당) | | | |
| 승인자 (대표이사/QA 총괄) | | | |
