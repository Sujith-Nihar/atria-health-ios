#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

echo "==> Ensuring workspace is generated"
mise exec -- tuist generate --no-open

echo "==> Building Atria for iOS Simulator"
xcodebuild \
  -workspace Atria.xcworkspace \
  -scheme Atria \
  -destination 'generic/platform=iOS Simulator' \
  -configuration Debug \
  build

echo "==> iOS build succeeded"
