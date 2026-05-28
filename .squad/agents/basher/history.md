## Learnings

### Project Context
- **Project:** WTH (What The Hack) AI Hackathon — Microsoft Foundry format
- **Repo:** ai-hackathon
- **Stack:** Microsoft Foundry AI, GitHub Pages (Jekyll/static), Markdown, GitHub Actions
- **Participants:** Students (new to AI) + Coaches (facilitators)
- **Goal:** Create a complete, deliverable WTH hackathon format with a polished GitHub Pages site
- **Requested by:** Marco Olivo
- **Date:** 2026-05-28

### 2026-05-28T16:23:27.374+01:00 — Full QA review learnings
- The most common content-quality gaps were structural consistency issues, not major technical defects.
- Challenge docs and site summaries drift fastest around naming, doc URLs, and narrative continuity; these need explicit QA checks together.
- Infra validation should track direct snippet dependencies (`azure-core`, `flask`) and challenge-specific endpoint variables, not just platform packages.
- Broken media links are better removed than left as placeholders when the repo does not actually ship the assets.
- For event-day readiness, Challenges 03–06 are the main candidates for optional starter artifacts if the team wants less ambiguity for students and coaches.
