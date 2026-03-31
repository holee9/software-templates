#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# Medical Device SW Template — 초기화 스크립트
# 사용법: bash scripts/init.sh --product "HnVue" --company "H&abyz Co., Ltd."
# ============================================================

PRODUCT=""
COMPANY=""
RISK_MIN="no"

usage() {
  echo "사용법: bash scripts/init.sh --product <제품명> --company <회사명> [--risk-min]"
  echo ""
  echo "옵션:"
  echo "  --product   제품/모델명 (필수). 예: HnVue, MyDevice"
  echo "  --company   회사 정식 명칭 (필수). 예: 'H&abyz Co., Ltd. (에이치앤아비즈)'"
  echo "  --risk-min  리스크 최소화 산출물(⭐) 활성화 안내 포함 (선택)"
  echo ""
  echo "예시:"
  echo "  bash scripts/init.sh --product HnVue --company 'H&abyz Co., Ltd. (에이치앤아비즈)'"
  exit 1
}

while [[ $# -gt 0 ]]; do
  case $1 in
    --product)  PRODUCT="$2"; shift 2 ;;
    --company)  COMPANY="$2"; shift 2 ;;
    --risk-min) RISK_MIN="yes"; shift ;;
    -h|--help)  usage ;;
    *)          echo "알 수 없는 옵션: $1"; usage ;;
  esac
done

if [[ -z "$PRODUCT" || -z "$COMPANY" ]]; then
  echo "❌ --product 와 --company 는 필수입니다."
  usage
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

echo "============================================================"
echo "Medical Device SW Template 초기화"
echo "============================================================"
echo "제품명:  $PRODUCT"
echo "회사명:  $COMPANY"
echo "리스크 최소화: $RISK_MIN"
echo "대상 폴더: $REPO_DIR"
echo "============================================================"
echo ""

# 1. 파일 내용 치환
echo "[1/3] 파일 내용 치환 중..."
find "$REPO_DIR" -name '*.md' -exec sed -i "s/model-name/$PRODUCT/g" {} +
PRODUCT_COUNT=$(grep -r "$PRODUCT" "$REPO_DIR" --include="*.md" | wc -l)
echo "  → model-name → $PRODUCT: ${PRODUCT_COUNT}건 치환"

find "$REPO_DIR" -name '*.md' -exec sed -i "s|company-name|$COMPANY|g" {} +
COMPANY_COUNT=$(grep -r "$COMPANY" "$REPO_DIR" --include="*.md" | wc -l)
echo "  → company-name → $COMPANY: ${COMPANY_COUNT}건 치환"

# 2. 파일명 치환
echo ""
echo "[2/3] 파일명 치환 중..."
RENAMED=0
for f in $(find "$REPO_DIR" -name 'model-name-*' -type f); do
  newname="$(echo "$f" | sed "s/model-name/$PRODUCT/g")"
  mv "$f" "$newname"
  RENAMED=$((RENAMED + 1))
done
echo "  → ${RENAMED}개 파일명 변경 완료"

# 3. 결과 요약
echo ""
echo "[3/3] 결과 요약"
echo "============================================================"
TOTAL_FILES=$(find "$REPO_DIR" -name '*.md' -not -path '*/.git/*' | wc -l)
echo "총 파일 수: ${TOTAL_FILES}개"
echo ""

echo "--- 필수 산출물 (✅) ---"
grep -rl "✅ 최소 필수" "$REPO_DIR" --include="*.md" | wc -l
echo "개 (작성 필수)"

echo ""
echo "--- 리스크 최소화 산출물 (⭐) ---"
grep -rl "⭐ 리스크 최소화" "$REPO_DIR" --include="*.md" | wc -l
echo "개 (권장)"

if [[ "$RISK_MIN" == "yes" ]]; then
  echo ""
  echo "ℹ️  --risk-min 활성화됨: ⭐ 산출물도 작성 대상에 포함하세요."
  echo "   해당 파일:"
  grep -rl "⭐ 리스크 최소화" "$REPO_DIR" --include="*.md" | sed 's|.*/||'
fi

echo ""
echo "============================================================"
echo "✅ 초기화 완료. 각 산출물의 ____ 및 [작성 필요] 부분을 채워주세요."
echo "============================================================"
