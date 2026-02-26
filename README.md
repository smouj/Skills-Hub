# 🧩 Skills Hub

<p align="center">
  <img src="https://img.shields.io/badge/Skills-Hub-111827?style=for-the-badge&logo=github" alt="Skills Hub" />
</p>

<p align="center"><em>Canonical index of all smouj skills repositories, status and synchronization signals.</em></p>

---

## 📚 Skills Catalog

| Emoji | Skill | Repository | Purpose | Status |
|---|---|---|---|---|
| 🛡️ | Aegis Veil | [smouj/Aegis-Veil](https://github.com/smouj/Aegis-Veil) | Prompt-injection / skill-poisoning shield | Initiating |
| 🔄 | Phoenix Reborn | [smouj/Phoenix-Reborn](https://github.com/smouj/Phoenix-Reborn) | Auto-recovery and post-failure evolution | Initiating |
| 🧬 | Genome Weaver | [smouj/Genome-Weaver](https://github.com/smouj/Genome-Weaver) | Darwinian generation/evaluation of skill variants | Initiating |
| 🌑 | Shadow Ledger | [smouj/Shadow-Ledger](https://github.com/smouj/Shadow-Ledger) | Encrypted local audit ledger | Initiating |
| ⚡ | Flux Capacitor | [smouj/Flux-Capacitor](https://github.com/smouj/Flux-Capacitor) | Compute/token optimizer | Initiating |
| 🪞 | Mirror Council | [smouj/Mirror-Council](https://github.com/smouj/Mirror-Council) | Internal multi-agent council | Initiating |
| 🔍 | Abyss Scanner | [smouj/Abyss-Scanner](https://github.com/smouj/Abyss-Scanner) | Stealth OSINT/deep-surface scanner | Initiating |
| 📜 | Codex Eternal | [smouj/Codex-Eternal](https://github.com/smouj/Codex-Eternal) | Compressed embeddings + local RAG memory | Initiating |
| 🧪 | Alchemurgist | [smouj/Alchemurgist](https://github.com/smouj/Alchemurgist) | Legacy format transmutation to markdown/JSON | Initiating |
| ⏳ | Chrono Ward | [smouj/Chrono-Ward](https://github.com/smouj/Chrono-Ward) | Temporal drift monitor + forced replanning | Initiating |

---

## 🔁 Sync Model

This hub is the source of catalog truth and links every skill repository.

- Each skill repo owns implementation and releases.
- This hub tracks metadata consistency (`name`, `purpose`, `status`).
- A scheduled workflow validates repository availability and updates `LAST_SYNC.md`.

---

## 🛠️ Automation

- Workflow: `.github/workflows/sync-skills-index.yml`
- Output: `LAST_SYNC.md`
- Schedule: every 6 hours + manual dispatch

