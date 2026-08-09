#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

echo "==> Cleaning Tuist derived data and local build products"
rm -rf Derived
rm -rf DerivedData
rm -rf build
rm -rf *.xcodeproj
rm -rf *.xcworkspace

echo "==> Clean complete"
