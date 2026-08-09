#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

echo "==> Pre-commit check: whitespace"
git diff --check

echo "==> Pre-commit check: generate"
"${ROOT_DIR}/scripts/generate.sh"

echo "==> Pre-commit check: iOS build"
"${ROOT_DIR}/scripts/build-ios.sh"

echo "==> Pre-commit check: watchOS build"
"${ROOT_DIR}/scripts/build-watch.sh"

echo "==> Pre-commit check: tests"
"${ROOT_DIR}/scripts/test.sh"

echo "==> Pre-commit checks passed"
