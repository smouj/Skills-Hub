#!/usr/bin/env bash
set -euo pipefail
ROOT="${1:-$PWD/skills}"
mkdir -p "$ROOT"
repos=(
  smouj/Aegis-Veil smouj/Phoenix-Reborn smouj/Genome-Weaver smouj/Shadow-Ledger smouj/Flux-Capacitor
  smouj/Mirror-Council smouj/Abyss-Scanner smouj/Codex-Eternal smouj/Alchemurgist smouj/Chrono-Ward
)
for r in "${repos[@]}"; do
  name="${r#smouj/}"
  if [[ -d "$ROOT/$name/.git" ]]; then
    git -C "$ROOT/$name" pull --rebase
  else
    gh repo clone "$r" "$ROOT/$name"
  fi
  echo "✓ $r"
done
