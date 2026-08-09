#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

echo "==> Ensuring workspace is generated"
mise exec -- tuist generate --no-open

echo "==> Building AtriaWatch for watchOS Simulator"
xcodebuild \
  -workspace Atria.xcworkspace \
  -scheme AtriaWatch \
  -destination 'generic/platform=watchOS Simulator' \
  -configuration Debug \
  build

echo "==> watchOS build succeeded"
