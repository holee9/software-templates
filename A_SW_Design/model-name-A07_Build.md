# 소스코드 및 빌드 환경 (Source Code & Build Environment)

> **문서 번호**: model-name-A07  
> **버전**: 0.1 (Draft)  
> **작성일**: ____-__-__  
> **작성자**: ____________  
> **검토자**: ____________  
> **승인자**: ____________  
> **제품**: model-name Console SW  
> **회사**: company-name  
> **분류**: ✅ 최소 필수  
> **적용 시장**: FDA ✅ / MFDS ✅ / EU MDR △  
> **근거 규격**: IEC 62304 §5.5, §8.1, FDA SW Guidance (2019) Section IV-H, MFDS 안내서-1425-01  
> **IEC 62304 Class**: B (Basic Level)

---

## 변경 이력

| 버전 | 일자 | 변경 내용 | 작성자 |
|------|------|-----------|--------|
| 0.1  |      | 최초 작성  |        |

---

## 1. 목적

본 문서는 FDA 및 MFDS 요청 또는 감사 시, 허가된 버전의 model-name Console SW를 정확히 재현할 수 있도록 소스코드 위치와 빌드 환경 전체를 문서화한다.  
소스코드 자체를 포함하지 않으며, 소스코드의 위치·접근 방법·재현 가능한 빌드 절차의 명세서로서 기능한다.  
형상관리 계획서(model-name-A05)와 연계하여 모든 릴리즈 버전의 소스코드 및 빌드 환경을 추적한다.

---

## 2. 범위

| 항목 | 내용 |
|------|------|
| 적용 SW | model-name Console SW v[작성 필요] |
| 적용 대상 | 소스코드, 빌드 도구, 의존성(SOUP), 빌드 스크립트, 코드서명 환경 |
| 적용 시장 | FDA (필수) / MFDS (필수) / EU MDR (참조 활용) |
| 소스코드 자체 | 본 문서에 포함하지 않음 — 위치 및 접근 방법만 기재 |

---

## 3. 관련 문서

| 문서 번호 | 문서명 | 관계 |
|-----------|--------|------|
| model-name-A05 | 형상관리 계획서 (CMP) | 형상 항목 관리 기준 |
| model-name-A04 | SOUP 목록 | 의존성 라이브러리 버전 참조 |
| model-name-A06 | SW 릴리즈 기록 | 릴리즈별 빌드 정보 연계 |
| IEC 62304:2006+AMD1:2015 | SW 수명주기 표준 | 근거 규격 §5.5, §8.1 |
| FDA SW Guidance (2019) | FDA SW 심사 가이던스 | Section IV-H |

---

## 4. 본문

### 4.1 형상관리 도구

| 도구 | 용도 | 버전/설정 |
|------|------|----------|
| Git | 분산 버전 관리 시스템 | [작성 필요] |
| [GitHub/Azure DevOps/GitLab] | 원격 저장소 호스팅 | [작성 필요] |
| 브랜칭 전략 | Git Flow (model-name-A05 §4.3.2 참조) | - |
| 태그 정책 | `v[MAJOR.MINOR.PATCH]` (예: v1.0.0) | model-name-A05 §4.3.4 |

---

### 4.2 소스코드 정보

#### 4.2.1 저장소 정보

| 항목 | 내용 |
|------|------|
| 저장소 위치 (URL) | [작성 필요 — 예: https://github.com/h-abyz/model-name] |
| 접근 권한 | 내부 인원만 접근 (비공개 저장소) |
| 허가 제출 버전 태그 | v1.0.0 (또는 해당 버전) |
| 허가 제출 버전 Commit SHA | [작성 필요] (40자 해시) |
| 브랜치 | main (허가 버전) |

#### 4.2.2 디렉토리 구조 개요

```
model-name/
├── src/                    # 소스코드 루트
│   ├── UI/                 # UI Module (COMP-001)
│   ├── DICOM/              # DICOM Engine (COMP-002)
│   ├── ImageProcessing/    # Image Processing Module (COMP-003)
│   ├── Security/           # Security Module (COMP-004)
│   ├── Detector/           # Detector Interface (COMP-005)
│   ├── Storage/            # Local Storage Manager (COMP-006)
│   ├── Worklist/           # Worklist Manager (COMP-007)
│   └── Common/             # 공통 유틸리티
├── tests/                  # 시험 코드
│   ├── unit/               # 단위 시험
│   └── integration/        # 통합 시험
├── build/                  # 빌드 스크립트
│   ├── CMakeLists.txt      # (또는 .sln/.csproj)
│   └── scripts/            # 빌드 자동화 스크립트
├── deps/                   # 의존성 잠금 파일
│   └── packages.lock.json  # (또는 해당 패키지 관리 파일)
├── docs/                   # 문서 (또는 별도 저장소)
└── .github/                # CI/CD 워크플로우
    └── workflows/
```

> **주의**: 실제 프로젝트 디렉토리 구조에 맞게 위 내용을 수정한다.

#### 4.2.3 소스코드 보호 조치

| 보호 항목 | 조치 내용 |
|----------|----------|
| 접근 제어 | 역할 기반 접근 (Read/Write/Admin) — [작성 필요] |
| 직접 Push 금지 | `main` 브랜치 Push Protection 활성화 |
| 코드 서명 | GPG 서명 또는 [작성 필요] |
| 백업 정책 | [일일 자동 백업 / 미러 저장소 — 작성 필요] |
| 보존 기간 | 최소 허가 유효기간 + 5년 |

---

### 4.3 빌드 도구 및 버전

| 항목 | 명세 | 비고 |
|------|------|------|
| 빌드 OS | Windows Server [작성 필요] 64-bit / Windows 10 64-bit | 재현 빌드 환경 |
| .NET Runtime | .NET [작성 필요] (LTS) | SOUP-001 참조 |
| IDE | Visual Studio [작성 필요] | 빌드 및 디버깅 |
| 컴파일러 | MSVC v[작성 필요] | |
| 주 빌드 도구 | MSBuild [작성 필요] / CMake [작성 필요] | |
| CI/CD 도구 | [GitHub Actions / Jenkins — 작성 필요] | |
| 정적 분석 | [SonarQube/Coverity 등 — 작성 필요] | |
| 코드 커버리지 | [작성 필요] | |
| 코드서명 도구 | signtool.exe (Windows SDK) | MSI 서명 |
| 코드서명 인증서 | 발급기관: [작성 필요], 유효기간: [작성 필요] | EV Code Signing 권장 |

---

### 4.4 의존성 관리

#### 4.4.1 패키지 관리 도구

| 도구 | 용도 | 설정 파일 |
|------|------|----------|
| [NuGet/vcpkg/Conan 등 — 작성 필요] | .NET / C++ 의존성 관리 | packages.config / packages.lock.json |
| Git Submodule (해당 시) | 소스 형태 SOUP 관리 | .gitmodules |

#### 4.4.2 의존성 버전 고정

- 모든 의존성은 **정확한 버전 번호**로 고정한다 (범위 지정 금지).
- 의존성 잠금 파일(lock file)을 소스코드 저장소에 함께 커밋한다.
- 의존성 업데이트는 변경 통제 프로세스(model-name-A05 §4.5)를 통해서만 수행한다.

#### 4.4.3 주요 의존성 목록 (SOUP 참조)

| 패키지명 | 고정 버전 | 소스 | SOUP ID |
|---------|---------|------|---------|
| .NET Runtime | [작성 필요] | Microsoft | SOUP-001 |
| DCMTK | [작성 필요] | OFFIS / GitHub | SOUP-002 |
| OpenSSL | [작성 필요] | OpenSSL Project | SOUP-003 |
| [검출기 SDK] | [작성 필요] | [공급사] | SOUP-004 |
| [기타] | [작성 필요] | [작성 필요] | [작성 필요] |

---

### 4.5 재현 가능한 빌드 절차

#### 4.5.1 빌드 환경 설정

**전제 조건**:
- 빌드 OS: Windows [작성 필요] 64-bit (클린 설치)
- 필요 도구 설치: Visual Studio [작성 필요], Git [작성 필요], [추가 도구]
- 코드서명 인증서: 보안 저장소에서 로드

**Docker 이미지 (권장)**:
```
이미지명: model-name-build:[버전] (예: model-name-build:1.0.0)
저장 위치: [Docker Registry URL — 작성 필요]
이미지 SHA-256: [작성 필요]
```

또는 **VM 스냅샷**:
```
스냅샷명: model-name-Build-v[버전]
저장 위치: [작성 필요]
스냅샷 생성일: [작성 필요]
```

#### 4.5.2 단계별 빌드 명령어

```shell
# 1. 저장소 클론 (특정 태그)
git clone [저장소 URL]
cd model-name
git checkout v1.0.0  # 허가 제출 버전 태그

# 2. 의존성 복원
[패키지 관리 도구 명령어 — 작성 필요]
# 예: dotnet restore --locked-mode
#     vcpkg install --triplet x64-windows

# 3. 빌드 실행 (Release 모드)
[빌드 명령어 — 작성 필요]
# 예: msbuild model-name.sln /p:Configuration=Release /p:Platform=x64
#     cmake --build . --config Release

# 4. 빌드 결과물 확인
[작성 필요]

# 5. 설치 패키지 생성
[작성 필요]
# 예: msbuild model-nameSetup.wixproj /p:Configuration=Release

# 6. 코드 서명
signtool sign /fd SHA256 /t [타임스탬프 서버] model-name-v1.0.0-setup.msi

# 7. SHA-256 해시 생성 및 검증
certutil -hashfile model-name-v1.0.0-setup.msi SHA256
# 예상 해시: [작성 필요]
```

> **주의**: 위 명령어는 실제 빌드 환경에 맞게 수정한다. 빌드 스크립트 파일 위치: `build/scripts/build-release.[bat/sh]`

#### 4.5.3 빌드 재현 검증 방법

1. 위 절차에 따라 빌드 수행
2. 생성된 설치 패키지의 SHA-256 해시 계산
3. 본 문서 §4.3에 기록된 예상 해시와 비교
4. 일치 시: 재현 성공 ✅
5. 불일치 시: 빌드 환경 차이 조사 (타임스탬프 서버, 버전 불일치 등)

---

### 4.6 빌드 결과물

| 산출물명 | 파일명 | 버전 | SHA-256 해시 |
|---------|--------|------|-------------|
| 실행 파일 | model-name.exe | v[작성 필요] | [작성 필요] |
| 설치 패키지 | model-name-v[X.X.X]-setup.msi | v[작성 필요] | [작성 필요] |
| 코드서명 확인 | signtool verify /pa model-name-v[X.X.X]-setup.msi | - | - |

---

### 4.7 빌드 환경 보존

| 항목 | 내용 |
|------|------|
| 보존 방법 | Docker 이미지 태그 고정 / VM 스냅샷 |
| 이미지/스냅샷 저장 위치 | [작성 필요] |
| 보존 기간 | 최소 허가 유효기간 + 5년 |
| 과거 버전 재빌드 보장 | 각 릴리즈 태그에 대한 빌드 환경 스냅샷 유지 |
| 백업 주기 | [작성 필요] |

---

## 비고: 이 문서가 필요한 이유

### 이 문서가 없으면?

빌드 명세서가 없으면 "허가된 버전의 바이너리를 재현할 수 있다"는 것을 증명할 방법이 없다. FDA는 현장 감사(Inspection) 시 "허가 시 제출한 버전을 지금 당장 빌드해 보여달라"고 요청할 수 있으며, 이 요청에 응하지 못하면 품질 시스템 부적합 판정을 받는다. 더 심각한 실무 문제는, 보안 패치나 버그 수정이 필요할 때 허가 버전 기반의 빌드 환경이 없으면 패치 자체가 불가능해진다는 것이다. 빌드 환경은 문서로만 존재해야 하는 것이 아니라 실제로 재현 가능해야 한다.

- **FDA**: eSTAR 제출 시 빌드 환경과 재현 절차를 포함한 SW Documentation 제출이 필요하다. GMP Inspection 시 "허가된 버전을 재현할 수 있는가"는 핵심 감사 항목이다. 재현 불가 시 21 CFR Part 820 품질 시스템 규정 위반으로 Warning Letter 발행 사례가 있다.
- **MFDS**: 의료기기 소프트웨어 이력 관리 요건 하에 각 허가 버전의 빌드 이력 보관을 요구한다. 빌드 명세서 없이는 이력 관리가 불가능하다.
- **EU MDR**: Annex II §3.2에서 소프트웨어 제조 정보를 요구하며, ISO 13485의 생산 및 서비스 제공 관리 요건(§7.5.1)은 빌드 재현 가능성을 전제한다.

### 시장별 요구 수준

| 시장 | 요구 수준 | 설명 |
|------|----------|------|
| FDA | 필수 | GMP Inspection 핵심 항목. 재현 불가 시 Warning Letter 위험. 21 CFR Part 820 위반 |
| MFDS | 필수 | 소프트웨어 이력 관리 요건 이행 문서. 빌드 이력 없이는 버전 관리 증명 불가 |
| EU MDR | 필수 | Annex II §3.2 제조 정보 요건. ISO 13485 §7.5.1 빌드 재현 가능성 전제 |

### 최소 필수 vs 리스크 최소화

- **최소 필수로 작성할 경우**: 빌드 환경(OS, 컴파일러 버전, SDK/NDK 버전), 의존성 목록(패키지 매니저 lock 파일), 빌드 명령어(step-by-step), 산출물 해시(SHA-256), 빌드 담당자 및 일자를 포함한다. 완전한 바이트 동일성(bit-for-bit reproducible build)이 어렵다면 "기능적으로 동일함을 SHA-256 해시로 검증"하는 현실적 대안으로도 FDA 요건을 충족할 수 있다.
- **리스크 최소화로 확장할 경우**: Docker 이미지 또는 Dev Container로 빌드 환경을 컨테이너화하면 환경 재현 자체가 보장된다. CI/CD 파이프라인(GitHub Actions 등)에 빌드를 자동화하고 로그를 아티팩트로 보관하면 "빌드 기록"이 자동으로 누적된다. 릴리즈 태그(A06)와 빌드 산출물을 자동으로 연결하는 워크플로를 구축하면 FDA 감사 시 요청에 즉시 대응할 수 있다.

### 외주 개발 시 유의사항

빌드 환경은 반드시 company-name이 독립적으로 재현할 수 있어야 한다. 외주사만 빌드 가능한 환경은 계약 종료 후 재현 불가 상태가 된다. SOW에 다음을 명시할 것: ① 빌드 환경 명세서(본 문서 형식)를 납품 산출물에 포함, ② company-name 환경에서 빌드 재현 성공을 납품 완료의 조건으로 설정, ③ 빌드 스크립트 및 CI/CD 파이프라인 설정 파일 전체를 company-name 저장소에 커밋. 납품 검수 시 외주사 없이 company-name 환경에서 단독으로 빌드를 재현하는 테스트를 반드시 실시해야 한다.



## 6. 변경 이력

| 버전 | 일자 | 변경 내용 | 작성자 |
|------|------|-----------|--------|
| 0.1  |      | 최초 작성  |        |

---

## 7. 승인란

| 역할 | 성명 | 서명 | 일자 |
|------|------|------|------|
| 작성자 (SW 개발 책임자) | | | |
| 검토자 (QA 책임자) | | | |
| 검토자 (RA 담당자) | | | |
| 승인자 (대표이사/QA 총괄) | | | |
