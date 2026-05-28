## Learnings

### Project Context
- **Project:** WTH (What The Hack) AI Hackathon — Microsoft Foundry format
- **Repo:** ai-hackathon
- **Stack:** Microsoft Foundry AI, GitHub Pages (Jekyll/static), Markdown, GitHub Actions
- **Participants:** Students (new to AI) + Coaches (facilitators)
- **Goal:** Create a complete, deliverable WTH hackathon format with a polished GitHub Pages site
- **Requested by:** Marco Olivo
- **Date:** 2026-05-28

### Repo Infrastructure Setup
- Added the baseline WTH directory scaffold for challenges, docs, resources, and repo automation assets so content can land in stable locations.
- Standardized the devcontainer on Python 3.11 with Azure CLI, Node.js 20, GitHub CLI, and a post-create bootstrap flow.
- Captured a reusable GitHub Pages + Jekyll pattern with `docs/Gemfile`, a Pages deployment workflow, and contributor templates.
- Provisioning scripts for AI Foundry should be written defensively because Azure CLI support for hub/project resources can vary between extension versions.

