#!/bin/bash
# Claude Code 설치 스크립트
# NOTE, hyunnnchoi, 2026.05.02
# Claude Code (Anthropic CLI) 설치 자동화 스크립트

set -e

echo "=== Claude Code 설치 시작 ==="

# npm 설치 여부 확인
if ! command -v npm &> /dev/null; then
    echo "[1/3] npm 설치 중..."
    apt-get update -qq
    apt-get install -y npm
    echo "npm 설치 완료: $(npm --version)"
else
    echo "[1/3] npm 이미 설치됨: $(npm --version)"
fi

# Node.js 버전 확인
echo "Node.js 버전: $(node --version)"

# Claude Code 설치
echo "[2/3] Claude Code 설치 중..."
npm install -g @anthropic-ai/claude-code

# 설치 확인
echo "[3/3] 설치 확인 중..."
if command -v claude &> /dev/null; then
    echo "Claude Code 설치 완료!"
    claude --version
else
    echo "경고: claude 명령어를 찾을 수 없습니다. PATH를 확인해주세요."
    echo "npm global bin 경로: $(npm bin -g 2>/dev/null || npm root -g | sed 's|/node_modules||')/bin"
fi

echo "=== 설치 완료 ==="
echo ""
echo "사용법: claude"
echo "문서: https://docs.anthropic.com/claude-code"
