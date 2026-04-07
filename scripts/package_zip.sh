#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUTPUT_PATH="${1:-$ROOT_DIR/../providerapp_full.zip}"

cd "$ROOT_DIR"
zip -r "$OUTPUT_PATH" . -x ".git/*" -x "build/*" -x ".dart_tool/*"
echo "Created: $OUTPUT_PATH"
