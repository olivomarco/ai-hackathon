## Learnings

### Project Context
- **Project:** WTH (What The Hack) AI Hackathon — Microsoft Foundry format
- **Repo:** ai-hackathon
- **Stack:** Microsoft Foundry AI, GitHub Pages (Jekyll/static), Markdown, GitHub Actions
- **Participants:** Students (new to AI) + Coaches (facilitators)
- **Goal:** Create a complete, deliverable WTH hackathon format with a polished GitHub Pages site
- **Requested by:** Marco Olivo
- **Date:** 2026-05-28

### Version Audit — 2026-05-28

- Verified all Python deps, devcontainer features, GitHub Actions, and Gemfile against current stable releases.
- `azure-ai-projects` has gone GA at 2.x — import path unchanged but constructor requires `endpoint=` kwarg. Flag raised in decision doc for Rusty/Basher to audit challenge samples.
- `azure-search-documents` bumped to 12.x (major) — flag raised for RAG challenge review.
- `openai` bumped to 2.x — `chat.completions` still works; `responses.create()` is new preferred API.
- `azure-ai-inference` remains beta (1.0.0b9 unchanged); `promptflow` is sustained but not growing.
- GitHub Actions: `checkout` → v6, `configure-pages` → v6, `upload-pages-artifact` → v5, `deploy-pages` → v5.
- Node.js in devcontainer bumped from 20 (maintenance LTS) to 22 (active LTS).
- `just-the-docs` `~> 0.8` → `~> 0.10` (current stable 0.12.0); `jekyll` `~> 4.3` → `~> 4.4` (current stable 4.4.1).
- Gemfile.lock NOT regenerated — must be done with `cd docs && bundle install` by a maintainer.
- Decision doc written to `.squad/decisions/inbox/livingston-version-audit.md`.

### Repo Infrastructure Setup
- Added the baseline WTH directory scaffold for challenges, docs, resources, and repo automation assets so content can land in stable locations.
- Standardized the devcontainer on Python 3.11 with Azure CLI, Node.js 20, GitHub CLI, and a post-create bootstrap flow.
- Captured a reusable GitHub Pages + Jekyll pattern with `docs/Gemfile`, a Pages deployment workflow, and contributor templates.
- Provisioning scripts for AI Foundry should be written defensively because Azure CLI support for hub/project resources can vary between extension versions.

