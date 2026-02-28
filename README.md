# ⚙️ Skills Hub

> **The canonical authority for skill standards in the OpenClaw ecosystem.**  
> One hub to define them all — templates, quality gates, catalog metadata, and the law of the land for every agent skill.

---

[![Skills](https://img.shields.io/badge/Skills-17%20registered-6f42c1?style=flat-square)](manifest.json)
[![Standard](https://img.shields.io/badge/Standard-v1.0-0d1117?style=flat-square&logo=github)](TEMPLATE_SKILL.md)
[![Ecosystem](https://img.shields.io/badge/Ecosystem-OpenClaw-blueviolet?style=flat-square)](https://github.com/smouj)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)

---

## About

**Skills Hub** is the governance layer of the [OpenClaw](https://github.com/smouj) multi-agent ecosystem. It does not contain skill logic — it defines the **rules, templates, and quality standards** that every skill repository must follow to be considered production-grade.

Think of it as the constitution of the ecosystem: every skill that enters the catalog must pass through the gates defined here.

**What this repository governs:**

- The unified skill template (`TEMPLATE_SKILL.md`) — the single source of truth for skill structure
- The skill catalog and registry (`manifest.json`) — the authoritative index of all tracked skills
- Validation scripts that enforce structural and content compliance
- Sync tooling for local index management and Telegram reporting
- The quality bar that separates a draft from a deployable skill

---

## Features

| Feature | Description |
|---|---|
| 🗂️ **Unified Template** | One canonical `TEMPLATE_SKILL.md` for all skills — bilingual, structured, versioned |
| 📋 **Manifest Registry** | `manifest.json` as the single source of truth for the skill catalog |
| ✅ **Local Validation** | `validate-all.sh` enforces required files, frontmatter, and content patterns |
| 🔄 **Sync & Index** | `sync-index.sh` rebuilds the local index and updates `LAST_SYNC.md` |
| 📡 **Telegram Reports** | `send-telegram-report.sh` delivers structured status reports to the maintainer |
| 🔒 **Quality Gates** | Mandatory checklist before any skill can be marked `Ready` in the catalog |

---

## Standards

Every skill repository in the OpenClaw ecosystem **must** comply with the following standards. Non-compliant skills will not be indexed.

### Required Files

| File | Language | Purpose |
|---|---|---|
| `SKILL.md` | English | Primary skill definition — identity, triggers, process, rules, output format |
| `SKILL.es.md` | Spanish | Full translation of `SKILL.md` — same structure, same depth |
| `README.md` | English | Human-readable guide — usage, examples, inputs/outputs, guardrails |
| `README.es.md` | Spanish | Full translation of `README.md` |

---

### `SKILL.md` / `SKILL.es.md` Requirements

Both files must follow the unified template exactly. Required sections:

**Frontmatter (YAML)**
```yaml
---
name: skill-name-in-kebab-case
description: >
  One powerful sentence that explains exactly what this skill does
  and when it should be activated. Include key trigger words.
version: "1.0.0"
tags: [tag1, tag2, tag3]
metadata:
  author: "@username"
  category: coding | security | devops | research | analysis | ...
  expertise: expert | senior | specialist | master
  repo: https://github.com/smouj/[repo-name]
  license: MIT
---
```

**Required Sections**
1. **Expert Identity** — Clear declaration of the agent's role and mission
2. **Triggers** (`## 🎯 When to Use`) — Explicit activation conditions and anti-patterns
3. **Mandatory Process** (`## 📋 Mandatory Work Process`) — 4-step chain-of-thought with checklists:
   - Step 1: Initial Analysis
   - Step 2: Planning
   - Step 3: Execution
   - Step 4: Validation & Refinement
4. **Golden Rules** (`## ⚡ Golden Rules`) — 3–5 non-negotiable constraints
5. **Output Format** (`## 📤 Required Output Format`) — Exact structured output template

---

### `README.md` / `README.es.md` Requirements

The README is the human interface to the skill. It must be self-contained and answer every question a user or agent might have before activating the skill.

**Required content:**

- Language badge linking to the alternate language version
- What the skill solves (problem statement)
- When it activates (triggers, with concrete examples)
- Real usage examples with expected inputs and outputs
- Explicit limits, edge cases, and guardrails
- Security and privacy considerations
- Troubleshooting section
- Credits and license

**Language badges (mandatory in every README):**
```markdown
[![EN](https://img.shields.io/badge/EN-English-blue)](README.md)
[![ES](https://img.shields.io/badge/ES-Español-red)](README.es.md)
```

---

### Quality Gate Checklist

Before marking a skill as `"status": "Ready"` in `manifest.json`, verify:

- [ ] `SKILL.md` has complete and valid YAML frontmatter
- [ ] `SKILL.es.md` exists and is a full translation (not a stub)
- [ ] `README.md` includes the ES language badge
- [ ] `README.es.md` includes the EN language badge
- [ ] All triggers are explicitly defined
- [ ] Output format is exact and reproducible
- [ ] Rollback instructions are clear and executable
- [ ] No secrets, tokens, or credentials are exposed
- [ ] License is present in the repository

---

## Repository Structure

```
Skills-Hub/
├── manifest.json          # Canonical skill registry — source of truth
├── TEMPLATE_SKILL.md      # Unified skill template (bilingual)
├── LAST_SYNC.md           # Last sync report — updated by sync-index.sh
├── scripts/
│   ├── install-all.sh     # Clone or pull all skill repos from manifest
│   ├── validate-all.sh    # Validate structure and content of all local skills
│   ├── sync-index.sh      # Rebuild local index and update LAST_SYNC.md
│   └── send-telegram-report.sh  # Send structured status report via Telegram Bot API
└── .github/               # (reserved — no active workflows)
```

| File / Directory | Role |
|---|---|
| `manifest.json` | Single source of truth for all registered skills |
| `TEMPLATE_SKILL.md` | The law — every skill must follow this structure |
| `LAST_SYNC.md` | Auto-generated sync report with availability status |
| `scripts/` | Local tooling for validation, sync, and reporting |

---

## Quick Start

### Prerequisites

- [`git`](https://git-scm.com/) and [`gh`](https://cli.github.com/) (GitHub CLI) installed and authenticated
- [`jq`](https://stedolan.github.io/jq/) for JSON parsing
- A Telegram Bot token (optional — only required for `send-telegram-report.sh`)

### Clone the hub

```bash
git clone https://github.com/smouj/Skills-Hub.git
cd Skills-Hub
```

### Install (clone/pull) all skill repositories

```bash
# Clones all skills from manifest.json into ./skills/
bash scripts/install-all.sh

# Or specify a custom target directory
bash scripts/install-all.sh /path/to/skills
```

### Validate all local skills

```bash
# Validates structure and content of all skills in ./skills/
bash scripts/validate-all.sh

# Or specify a custom directory
bash scripts/validate-all.sh /path/to/skills
```

### Sync the local index

```bash
# Rebuilds the index and updates LAST_SYNC.md
bash scripts/sync-index.sh
```

### Send a Telegram report

```bash
# Requires TELEGRAM_BOT_TOKEN and TELEGRAM_CHAT_ID environment variables
export TELEGRAM_BOT_TOKEN="your-bot-token"
export TELEGRAM_CHAT_ID="your-chat-id"

bash scripts/send-telegram-report.sh
```

---

## Maintenance and Update Process

This section defines the **official process** for maintaining the Skills Hub. There are no automated workflows — all operations are intentional, local, and maintainer-controlled.

### The Manifest as Source of Truth

`manifest.json` is the authoritative registry. Every skill that exists in the OpenClaw ecosystem must have an entry here. The manifest drives all tooling: installation, validation, sync, and reporting.

**Manifest entry schema:**
```json
{
  "name": "Skill Name",
  "repo": "smouj/Repo-Name",
  "emoji": "🔍",
  "tag": "category-tag",
  "status": "Ready",
  "version": "1.0.0",
  "defaultBranch": "main"
}
```

---

### Adding a New Skill

Follow this process exactly. Deviations will result in the skill being rejected from the catalog.

**Step 1 — Create the skill repository**

Create a new GitHub repository under the `smouj` organization following the naming convention. Add the required topics: `openclaw`, `skill-agent`, and the skill's primary tag.

**Step 2 — Implement the skill files**

Using `TEMPLATE_SKILL.md` as the base, create all four required files:
- `SKILL.md`
- `SKILL.es.md`
- `README.md`
- `README.es.md`

**Step 3 — Run local validation**

Clone the new skill repo into your local `./skills/` directory and run the validator:

```bash
bash scripts/validate-all.sh ./skills
```

Fix all reported issues before proceeding. The validator is non-negotiable.

**Step 4 — Open a PR to update the manifest**

Add the new skill entry to `manifest.json` and open a Pull Request to `Skills-Hub`. The PR description must include:

- Skill name and purpose
- Primary tag / category
- Link to the skill repository
- Confirmation that `validate-all.sh` passed locally

**Step 5 — Merge and sync**

After the PR is merged, run the sync script to rebuild the local index:

```bash
bash scripts/sync-index.sh
```

This will update `LAST_SYNC.md` with the current timestamp and availability status of all registered skills.

**Step 6 — Send the Telegram report**

Notify the maintainer channel with the updated status:

```bash
bash scripts/send-telegram-report.sh
```

The report includes: skill name, objective, key capabilities, triggers, files created/updated, and final status (`OK` / `WARN`).

---

### Updating an Existing Skill

1. Make changes in the skill's own repository
2. Bump the `version` field in the skill's `SKILL.md` frontmatter
3. Update the `version` field in `manifest.json` via PR
4. Run `bash scripts/validate-all.sh` locally to confirm compliance
5. Run `bash scripts/sync-index.sh` after merge
6. Run `bash scripts/send-telegram-report.sh` to notify

---

### Sync Script Behavior (`sync-index.sh`)

The sync script performs the following operations in sequence:

1. Reads all entries from `manifest.json`
2. Checks GitHub availability for each registered repository
3. Writes a new `LAST_SYNC.md` with:
   - UTC timestamp
   - Total repos checked
   - Per-repo availability status (`✅` / `❌`)
   - Summary counts (success / failed)
4. Exits with code `1` if any repository is unavailable

---

### Telegram Report Format

The `send-telegram-report.sh` script sends a structured message to the configured Telegram chat. Each report includes:

```
🔄 Skills Hub — Sync Report
📅 2026-02-28T00:00:00Z

📦 Skills checked: 17
✅ Available: 17
❌ Unavailable: 0

— Skill: abyss-scanner
  Objective: OSINT reconnaissance
  Status: ✅ OK

[... one block per skill ...]

🏁 Sync complete.
```

Configure the bot credentials as environment variables or in a local `.env` file (never committed):

```bash
# .env (gitignored)
TELEGRAM_BOT_TOKEN=your-bot-token
TELEGRAM_CHAT_ID=your-chat-id
```

---

## Contributing

Skills Hub is the governance layer of the OpenClaw ecosystem. Contributions are welcome but must meet the bar.

**To contribute a new skill:**

1. Fork this repository
2. Add your skill entry to `manifest.json`
3. Ensure your skill repository is public and passes `validate-all.sh`
4. Open a Pull Request with a clear description

**To improve the standards or tooling:**

1. Open an issue describing the proposed change and its rationale
2. Wait for maintainer feedback before implementing
3. Submit a PR with the changes and updated documentation

**Commit convention:**

```
feat: add [skill-name] skill
fix: correct validation pattern for SKILL.es.md
docs: update contributing guidelines
chore: bump manifest version to 1.1.0
```

All PRs must pass local validation before review. PRs that break existing skills will not be merged.

---

## Ecosystem Links

| Repository | Description |
| [smouj/container-orch-skill](https://github.com/smouj/container-orch-skill) | 💾 container-orch skill |
|---|---|
| [smouj/Abyss-Scanner](https://github.com/smouj/Abyss-Scanner) | 🔍 OSINT reconnaissance skill |
| [smouj/Aegis-Veil](https://github.com/smouj/Aegis-Veil) | 🛡️ Security hardening skill |
| [smouj/alchemurgist](https://github.com/smouj/alchemurgist) | 🧪 Data transformation skill |
| [smouj/Chrono-Ward](https://github.com/smouj/Chrono-Ward) | ⏳ Planning and scheduling skill |
| [smouj/Codex-Eternal](https://github.com/smouj/Codex-Eternal) | 📜 Memory and knowledge management skill |
| [smouj/Flux-Capacitor](https://github.com/smouj/Flux-Capacitor) | ⚡ Performance optimization skill |
| [smouj/Genome-Weaver](https://github.com/smouj/Genome-Weaver) | 🧬 Evolutionary design skill |
| [smouj/Mirror-Council](https://github.com/smouj/Mirror-Council) | 🧠 Multi-agent deliberation skill |
| [smouj/Phoenix-Reborn](https://github.com/smouj/Phoenix-Reborn) | 🔄 Reliability and recovery skill |
| [smouj/Provenance-Guard](https://github.com/smouj/Provenance-Guard) | 🧾 Supply chain security skill |
| [smouj/SLO-Warden](https://github.com/smouj/SLO-Warden) | 📈 SLO monitoring and operations skill |
| [smouj/Shadow-Ledger](https://github.com/smouj/Shadow-Ledger) | 🌑 Audit and traceability skill |
| [smouj/Vault-Sentry](https://github.com/smouj/Vault-Sentry) | 🔐 Secret and credential security skill |
| [smouj/Vuln-Warden](https://github.com/smouj/Vuln-Warden) | 🩹 Vulnerability management skill |

> Full catalog: [`manifest.json`](manifest.json)

---

## License

MIT © [smouj](https://github.com/smouj)

---

<sub>Skills Hub is part of the OpenClaw ecosystem — a multi-agent orchestration framework built for precision, reliability, and scale.</sub>
