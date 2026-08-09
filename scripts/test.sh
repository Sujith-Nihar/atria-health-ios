#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

echo "==> Ensuring workspace is generated"
mise exec -- tuist generate --no-open

# xcodebuild test requires a concrete simulator; resolve by name (no hardcoded UUIDs).
IOS_DESTINATION="${ATRIA_IOS_TEST_DESTINATION:-platform=iOS Simulator,name=iPhone 17}"
WATCH_DESTINATION="${ATRIA_WATCH_TEST_DESTINATION:-platform=watchOS Simulator,name=Apple Watch Series 11 (46mm)}"

echo "==> Running AtriaTests on ${IOS_DESTINATION}"
xcodebuild \
  -workspace Atria.xcworkspace \
  -scheme Atria \
  -destination "${IOS_DESTINATION}" \
  -configuration Debug \
  test

if xcodebuild -list -workspace Atria.xcworkspace 2>/dev/null | grep -q 'AtriaWatch'; then
  echo "==> Running AtriaWatchTests on ${WATCH_DESTINATION}"
  xcodebuild \
    -workspace Atria.xcworkspace \
    -scheme AtriaWatch \
    -destination "${WATCH_DESTINATION}" \
    -configuration Debug \
    test
else
  echo "==> AtriaWatch scheme not listed; skipping watch tests"
fi

echo "==> Tests finished"
