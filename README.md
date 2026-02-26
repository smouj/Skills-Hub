# 🧩 Skills Hub

Canonical hub for Smouj skills. This repository defines **standards**, **catalog metadata**, and **quality gates** for every skill repository.

## What this repo governs

- Global skill template (`TEMPLATE_SKILL.md`)
- Catalog and sync metadata (`manifest.json`, `LAST_SYNC.md`)
- Validation scripts for skill structure and required files
- Automation workflow for index synchronization

## Mandatory standard for every skill

Every skill must include:

1. `SKILL.md` (EN)
2. `SKILL.es.md` (ES)
3. `README.md` (super explanatory)

And both SKILL files must follow the unified template with:

- YAML metadata (`name`, `description`, `version`, `tags`, `metadata`)
- Triggers (when to use / when not to use)
- Mandatory process (analysis → plan → execution → validation)
- Golden rules and absolute priority
- Required output format

## README quality requirements (per skill)

`README.md` must clearly explain:

- What the skill does
- When to activate it
- Real examples
- Inputs / outputs
- Limits and guardrails
- Security notes
- Troubleshooting steps

## Telegram reporting requirement (for automation runs)

Every automation report must include, **for each skill**:

- Skill name
- Objective
- Key capabilities
- Triggers
- Files created/updated
- Final status (`OK` / `WARN`)

## Quick commands

```bash
# Validate all local skill repos cloned under ./skills
bash scripts/validate-all.sh ./skills

# Clone/pull all repos from manifest
bash scripts/install-all.sh ./skills
```

## Catalog source

- `manifest.json` is the source of truth for tracked skill repositories.
- `LAST_SYNC.md` is updated by automation.

## Automation

- Workflow: `.github/workflows/sync-skills-index.yml`
- Schedule: every 6 hours + manual dispatch
