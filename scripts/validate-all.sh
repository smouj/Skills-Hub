#!/usr/bin/env bash
set -euo pipefail
ROOT="${1:-$PWD/skills}"
for d in "$ROOT"/*; do
  [[ -d "$d" ]] || continue
  test -f "$d/README.md"
  test -f "$d/README.es.md"
  test -f "$d/SKILL.md"
  test -f "$d/SKILL.es.md"
  test -f "$d/ARCHITECTURE.md"
  test -f "$d/USE_CASES.md"
  test -f "$d/LIMITS.md"
  echo "✓ $(basename "$d")"
done
