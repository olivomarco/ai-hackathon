## Learnings

### Project Context
- **Project:** WTH (What The Hack) AI Hackathon — Microsoft Foundry format
- **Repo:** ai-hackathon
- **Stack:** Microsoft Foundry AI, GitHub Pages (Jekyll/static), Markdown, GitHub Actions
- **Participants:** Students (new to AI) + Coaches (facilitators)
- **Goal:** Create a complete, deliverable WTH hackathon format with a polished GitHub Pages site
- **Requested by:** Marco Olivo
- **Date:** 2026-05-28

### Content Architecture Decisions (2026-05-28)
- Chose 7 challenges (00–06) with strict linear progression — simplifies logistics for 1-day events
- Challenge 00 is setup-only: isolates environment issues from learning content
- Evaluation (Ch 05) precedes Deployment (Ch 06) — teaches responsible AI before shipping
- Coach solutions stay in-repo only, never on public Pages — keeps student experience clean
- RAG challenge uses pre-provided sample data to remove data-sourcing as a blocker
- `just-the-docs` Jekyll theme selected for search, sidebar nav, and minimal config
- Devcontainer is the primary environment — eliminates "works on my machine" issues at scale
- Challenge time estimates total ~7.25 hours — fits a full 1-day event with breaks

### README.md Implementation (2026-05-28)
- Wrote root README.md following full specification from task brief
- Includes all sections: header with 3 badges, What is WTH (3 paragraphs), Learning Outcomes (6 points from PLAN.md), Who is this for (Students/Coaches subsections), Prerequisites (5 items), Getting Started (3 steps with Codespaces badge), Challenges table (all 7 with links and timings), Repository Structure (15-line annotated tree), For Coaches section with Coach Hub link and solution guide notes, Resources (4 key links), Contributing section, and MIT License
- Chose accessible, welcoming tone appropriate for both students and coaches
- Codespaces badge uses placeholder org path (microsoft/ai-hackathon) — adjust repo URL in actual GitHub org
- All challenge links follow standard path pattern: `challenges/challenge-NN-slug/README.md`
