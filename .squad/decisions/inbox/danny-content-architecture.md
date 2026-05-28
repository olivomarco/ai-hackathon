# Decision: Content Architecture for WTH AI Hackathon

**Author:** Danny (Lead & Content Architect)
**Date:** 2026-05-28T16:15:34.722+01:00
**Status:** Proposed

## Context
We need a content architecture for the WTH (What The Hack) AI Hackathon built on Azure AI Foundry. The hackathon targets university students / early professionals new to AI, facilitated by experienced coaches.

## Decisions

### Challenge Structure
- **7 challenges (00–06)**, linear dependency chain
- Challenge 00 is setup-only (no AI content) to isolate environment issues
- Progression: Setup → Model Deployment → Prompt Engineering → Prompt Flow → RAG → Evaluation → Deploy
- Evaluation before Deployment to embed responsible AI practices

### Repo Layout
- `challenges/challenge-NN-slug/` at root with paired `README.md` (student) + `solution.md` (coach)
- `docs/` for GitHub Pages (Jekyll, `just-the-docs` theme)
- `resources/` for shared data, scripts, images
- `.devcontainer/` as the primary development environment

### Content Strategy
- Coach solutions live in repo only, NOT published to Pages site
- Pages site renders student-facing content with sidebar navigation
- Sample data provided for RAG challenge (university FAQ corpus)

### Technology Choices
- Jekyll + `just-the-docs` theme for Pages
- Python 3.11 devcontainer with Azure AI SDKs pre-installed
- GitHub Actions for Pages deployment

## Consequences
- Linear challenges mean no parallel track flexibility, but simplifies coaching logistics
- Devcontainer dependency means Codespaces or Docker is required
- Pre-provided sample data limits RAG creativity but ensures consistent outcomes

## Related
- Full plan: `/PLAN.md`
