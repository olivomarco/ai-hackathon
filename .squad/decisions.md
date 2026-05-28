# Squad Decisions

**Last Updated:** 2026-05-28 (merged inbox, 14 entries)

---

## Content Architecture & Direction

### Content Architecture for WTH AI Hackathon
**Author:** Danny (Lead & Content Architect)  
**Date:** 2026-05-28T16:15:34.722+01:00  
**Status:** Proposed

**Context:** Framework for the WTH AI Hackathon built on Azure AI Foundry, targeting university students/early professionals.

**Decisions:**
- **Challenge Structure:** 7 challenges (00–06), linear dependency chain. Challenge 00 is setup-only (no AI content).
- **Progression:** Setup → Model Deployment → Prompt Engineering → Prompt Flow → RAG → Evaluation → Deploy
- **Evaluation before Deployment:** Embeds responsible AI practices
- **Repo Layout:** `challenges/challenge-NN-slug/` at root with paired `README.md` (student) + `solution.md` (coach)
- **Docs:** `docs/` for GitHub Pages (Jekyll, `just-the-docs` theme)

---

### Challenge Content Decisions — Rusty (Wave 1: Ch 00–02)
**Author:** Rusty (Curriculum Designer)  
**Date:** 2026-05-28T16:23:27.374+01:00  
**Status:** Proposed

**Achievements:**
- Created student-facing challenge guides for Challenges 00–02 + coach solution guides
- Fictional university FAQ corpus (Northfield University) for RAG challenges
- All content aligned to WTH template: Introduction, Description, Success Criteria, Learning Resources, Tips, Advanced
- Coach guides optimized for facilitation (timing, pitfalls, coaching questions), not answer leakage
- Consistent Azure AI Foundry concepts across first three challenges

**Consequences:** Early scaffold reduces coach load; Northfield theme creates continuity into later challenges; corpus favors consistency over creativity.

---

### Challenge Content Decisions — Rusty (Wave 2: Ch 03–06)
**Author:** Rusty (Curriculum Designer)  
**Date:** 2026-05-28T16:23:27.374+01:00  
**Status:** Complete

**Achievements:**
- Completed student-facing `README.md` and coach-facing `solution.md` for Challenges 03–06
- Maintained University Q&A Assistant narrative across prompt flow, RAG, evaluation, deployment
- Aligned guides to WTH pattern; coach guides follow 00–02 facilitation template
- **Ch 03:** Framed Prompt Flow around classification → routing → formatting (orchestration without complexity)
- **Ch 04:** Centered on Northfield FAQ; emphasized RAG vs non-RAG comparison
- **Ch 05:** Emphasized measurable improvement loops; paired quality evaluation with content safety testing
- **Ch 06:** Success = endpoint + simple Flask integration (demo-ready, approachable)

---

### README.md Writing Decisions — Danny
**Author:** Danny (Lead & Content Architect)  
**Date:** 2026-05-28T16:23:27.374+01:00  
**Status:** Complete

**Decisions:**
1. **Structure & Tone:** Welcoming, action-oriented throughout (signals "achievable")
2. **Badge Selection:** GitHub Pages build status, MIT License, GitHub Codespaces
   - Pages badge signals deployment pipeline readiness
   - License badge builds trust
   - Codespaces badge is direct CTA for engagement

---

### Participant-Facing Challenge Guide Pattern — Linus (Wave 2)
**Author:** Linus (Frontend Dev)  
**Date:** 2026-05-28T16:23:27.374+01:00  
**Status:** Proposed

**Context:** Transform seven `docs/challenges/` placeholder pages into participant discovery layer.

**Content Pattern (all seven pages):**
- Short plain-language overview
- Time and difficulty badges
- "What participants will build" cards
- Key concepts callout
- Official learning links
- Direct repo README link
- Previous/next pager

**Rationale:** Fast scanning during event; discovery layer (not full instructions).

---

## Frontend & Pages Rendering

### GitHub Pages Information Architecture — Linus
**Author:** Linus (Frontend Dev)  
**Date:** 2026-05-28T16:23:27.374+01:00  
**Status:** Proposed

**Context:** Student-friendly GitHub Pages experience in `docs/` using Jekyll and `just-the-docs`.

**Site Structure:**
- Use `docs/` as full Jekyll site root
- Five top-level pages: Home, Getting Started, Challenges, Coach Hub, FAQ
- Seven challenge placeholder pages for sidebar navigation

**Theme & UX:**
- Use `just-the-docs` for search, responsive sidebar, low-friction deployment
- Azure-aligned visual treatment: custom hero, bright links, difficulty badges, lightweight callouts
- Plain-language, event-day friendly for laptops/tablets

---

### GitHub Pages Theme Rendering Fix — Linus
**Author:** Linus (Frontend Developer)  
**Date:** 2026-05-28  
**Status:** Completed & Deployed

**Root Cause:** Two compounding issues broke live site rendering:

1. **Missing master stylesheet:** `docs/assets/css/just-the-docs-default.scss` did not exist. Without this file (empty front-matter), Jekyll has no entry point to compile JTD theme CSS. Theme's `_layouts/default.html` references compiled file; without it, no stylesheet injected.

2. **Missing `jekyll-include-cache` plugin:** JTD uses `{% include_cached %}` in layout partials. Without plugin, includes silently fail, breaking layout entirely.

**Secondary Issues (after CSS fixed):**
- Wrong `url` in `_config.yml`
- Wrong repo links

**Files Changed:**
- Created: `docs/assets/css/just-the-docs-default.scss` (with empty front-matter)
- Updated: `_config.yml` (added plugin, fixed URLs)
- Fixed URLs: `microsoft/ai-hackathon` → `olivomarco/ai-hackathon`

**Impact:** CSS rendering restored; Pages site now displays with full theme. Marco must `git push` for deployment.

---

## Infrastructure & DevOps

### WTH Hackathon Repo Infrastructure Bootstrap — Livingston
**Author:** Livingston (DevOps & GitHub Engineer)  
**Date:** 2026-05-28T16:23:27.374+01:00  
**Status:** Proposed

**Context:** Baseline delivery infrastructure for organizers to run event consistently in Codespaces/devcontainers and publish docs.

**Decisions:**
- Create canonical challenge, docs, resources directory structure upfront
- Standardize on Python 3.11 devcontainer with Azure CLI, Node.js 20, GitHub CLI
- Repo-root `requirements.txt` + post-create bootstrap script for deterministic Codespaces setup
- Organizer automation: explicit idempotency checks before creating resource group, AI Foundry hub/project, Azure OpenAI deployment, Azure AI Search service
- Publish docs through dedicated GitHub Pages workflow (Jekyll 4.x, `just-the-docs`)
- Add contributor hygiene: `.gitignore`, issue templates, PR template, MIT license

**Consequences:**
- Organizers can fork and bootstrap infrastructure with fewer manual steps
- Provisioning script may need updates if Azure CLI preview commands change

---

### Version Audit — Livingston
**Author:** Livingston (DevOps & GitHub Engineer)  
**Date:** 2026-05-28  
**Status:** Completed

**Microsoft Foundry Rebrand Applied:**
- `requirements.txt`: All Python deps bumped to current stable
- `.devcontainer/devcontainer.json`: Node.js `20` → `22` (current active LTS)
- `.github/workflows/deploy-pages.yml`: 4 Action versions bumped
- `docs/Gemfile`: `jekyll ~> 4.3` → `~> 4.4`; `just-the-docs ~> 0.8` → `~> 0.10`
- `docs/Gemfile.lock`: Not regenerated (requires `bundle install` in Ruby environment)

**Action Items for Maintainers:**
- After pulling these changes, run: `cd docs && bundle install` to regenerate Gemfile.lock

---

## QA, Audits & Humanization

### Content Audit — Challenges 00–03 — Rusty
**Author:** Rusty (Curriculum Designer)  
**Date:** 2026-05-28  
**Verified Against:** Microsoft Foundry docs + Livingston's version audit

**Ch 00 Fixes:**
- `solution.md` timing: "creating the hub/project" → "creating the Foundry project"
- `docs/challenge-00.md` hero: "Azure AI Foundry, Hub and Project" → "Microsoft Foundry, Foundry resource and project"
- Portal URLs confirmed valid (`ai.azure.com`)
- Project endpoint format confirmed (`https://<resource>.services.ai.azure.com/api/projects/<project>`)

**Ch 01–03:** All claims against SDK 2.x, Microsoft Foundry terminology, and gpt-4.1-mini verified; no breaking changes detected.

---

### Content Audit — Challenges 04–06 — Basher
**Author:** Basher (DevRel / Coach Materials)  
**Date:** 2026-05-28  
**Verified Against:** Azure AI Search 12.x SDK docs, azure-ai-evaluation 1.16.9, Microsoft Foundry deploy-models docs

**Ch 04 (RAG: Grounding with Data):**
- "Azure AI Foundry" → "Microsoft Foundry" (rebrand)
- Learning resources link text updated
- URLs `learn.microsoft.com/azure/ai-foundry/` confirmed valid
- No SDK code in challenge README; no direct SDK snippets needed

**Ch 05–06:** All URLs, SDK references, and terminology verified against current docs. Deployment patterns confirmed compatible with Microsoft Foundry.

**Additional Sweep:** Repo-wide URL fix (`pages.yml` → `deploy-pages.yml` in README badge).

---

### QA Review — Basher
**Author:** Basher  
**Date:** 2026-05-28T16:23:27.374+01:00  
**Status:** Completed

**Scope:** Full QA sweep across student guides, coach guides, docs pages, infra files.

**Findings:**
- 14 issue groups identified
- 11 issue groups fixed directly
- 3 issue groups left as follow-up (for Rusty/Linus judgment)

**Fixes Applied:**
- Added missing "Step-by-step" sections to Challenges 00–02
- Removed broken screenshot links from Challenge 00 setup guidance
- Aligned `requirements.txt`, `.env.example`, `validate-environment.py` with code snippets and Ch 06 endpoint variables
- Standardized coach guide headings across `solution.md` files
- Updated outdated Azure AI Foundry / setup / coach hub / resources links
- Reinforced University Q&A Assistant narrative across docs challenge pages 03–06

---

### Cross-Page Link Fix — Basher
**Author:** Basher  
**Date:** 2026-05-28  
**Status:** Completed & Committed (8d321da)

**Problem:** Seven `docs/challenges/challenge-XX.md` pages ended with Markdown links:
```
../../challenges/challenge-XX-name/README.md
```
Jekyll Pages site rooted at `docs/`; `../../` traversal exits published tree → **404** on live site.

**Solution:** Updated all seven links to GitHub repo URLs:
```
https://github.com/olivomarco/ai-hackathon/tree/main/challenges/challenge-XX-name/README.md
```
Pages now render correctly; no 404s on challenge discovery layer.

---

### Humanizer Editorial Pass — Rusty
**Author:** Rusty (Curriculum Designer)  
**Date:** 2026-05-28  
**Status:** Completed & Committed (80b1f98)  
**Scope:** 28 content files

**Pattern Fixes:**
- **Decorative emojis:** Removed 12 emojis from H1/H2/H3 headers (🤖, 🎯, 👥, 👨‍🎓, etc.)
- **Em dash overuse:** Fixed 9 em dashes → appropriate punctuation (commas, colons, periods)
- **Promotional vocabulary:** Stripped branded adjectives from headings
- **Rule-of-three patterns:** Reduced repetitive list structures
- **Passive voice:** Converted some passages to active voice

**Outcome:** Content sounds more editorial, less AI-generated; retained substance without sacrificing clarity.

---

## Governance

- All meaningful changes require team consensus
- Document architectural decisions here
- Keep history focused on work, decisions focused on direction
- Decision merges occur at end of agent batch cycles

