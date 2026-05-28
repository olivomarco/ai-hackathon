## Learnings

### Project Context
- **Project:** WTH (What The Hack) AI Hackathon — Microsoft Foundry format
- **Repo:** ai-hackathon
- **Stack:** Microsoft Foundry AI, GitHub Pages (Jekyll/static), Markdown, GitHub Actions
- **Participants:** Students (new to AI) + Coaches (facilitators)
- **Goal:** Create a complete, deliverable WTH hackathon format with a polished GitHub Pages site
- **Requested by:** Marco Olivo
- **Date:** 2026-05-28


### 2026-05-28T16:23:27.374+01:00 — Jekyll site build learnings
- `just-the-docs` treats `color_scheme: default` as a custom scheme name, so the site needs `_sass/color_schemes/default.scss` to build cleanly.
- The participant-facing site works best as a fast, searchable front door: a strong home hero, a plain-language setup guide, challenge stubs for navigation, and a coach-only boundary that keeps solutions out of Pages.
- For local verification, `bundle exec jekyll build -d .site-check` in `docs/` is enough to validate navigation, Markdown rendering, and custom styling before deployment.

### 2026-05-28T16:23:27.374+01:00 — Wave 2 challenge page learnings
- Participant-facing challenge pages work best as orientation pages, not duplicated lab manuals: a short overview, build outcome, concepts, and links are enough to keep event-day navigation fast.
- Reusing a single visual pattern across all challenge pages makes the seven-step progression feel intentional and easier to scan on GitHub Pages.
- A dedicated resources page reduces sidebar hunting and gives students one stable reference shelf for Foundry docs, SDK docs, RAG references, and evaluation guidance.

