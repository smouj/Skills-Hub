#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-$PWD/skills}"
FAIL=0

check_contains() {
  local file="$1"
  local pattern="$2"
  if ! grep -q "$pattern" "$file"; then
    echo "  ✗ missing pattern '$pattern' in $(basename "$file")"
    FAIL=1
  fi
}

for d in "$ROOT"/*; do
  [[ -d "$d" ]] || continue
  echo "Checking $(basename "$d")"

  for f in SKILL.md SKILL.es.md README.md README.es.md; do
    if [[ ! -f "$d/$f" ]]; then
      echo "  ✗ missing $f"
      FAIL=1
    fi
  done

  if [[ -f "$d/SKILL.md" ]]; then
    check_contains "$d/SKILL.md" '^---'
    check_contains "$d/SKILL.md" '^name:'
    check_contains "$d/SKILL.md" '^description:'
    check_contains "$d/SKILL.md" '^version:'
    check_contains "$d/SKILL.md" '^tags:'
    check_contains "$d/SKILL.md" '^metadata:'
    check_contains "$d/SKILL.md" '## 🎯 Cuándo usar esta Skill'
    check_contains "$d/SKILL.md" '## 📋 Proceso de Trabajo Obligatorio'
    check_contains "$d/SKILL.md" '## ⚡ Reglas de Oro'
    check_contains "$d/SKILL.md" '## 📤 Formato de Salida Requerido'
  fi

  if [[ -f "$d/README.md" ]]; then
    check_contains "$d/README.md" -i 'Language: English'
    check_contains "$d/README.md" -i 'Idioma: Español'
    check_contains "$d/README.md" -i 'overview'
    check_contains "$d/README.md" -i 'inputs'
    check_contains "$d/README.md" -i 'outputs'
    check_contains "$d/README.md" -i 'limits\|guardrails'
    check_contains "$d/README.md" -i 'troubleshooting'
  fi

  if [[ -f "$d/README.es.md" ]]; then
    check_contains "$d/README.es.md" -i 'Language: English'
    check_contains "$d/README.es.md" -i 'Idioma: Español'
    check_contains "$d/README.es.md" -i 'descripci'
    check_contains "$d/README.es.md" -i 'entradas'
    check_contains "$d/README.es.md" -i 'salidas'
    check_contains "$d/README.es.md" -i 'límite\|guardrails'
    check_contains "$d/README.es.md" -i 'troubleshooting'
  fi

  echo "  ✓ done"
done

if [[ "$FAIL" -ne 0 ]]; then
  echo "Validation failed"
  exit 1
fi

echo "All skills validated successfully"
