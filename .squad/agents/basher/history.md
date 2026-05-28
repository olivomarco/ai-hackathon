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

### 2026-05-28T20:30:00.000+01:00 — Challenges 04–06 audit + repo-wide URL sweep

**Rebrand pattern applied (Rusty-established):**
- "Azure AI Foundry" product name → "Microsoft Foundry" everywhere in narrative, link text, and planning docs.
- Exception: literal SDK names ("Azure AI Search", "azure-ai-evaluation", "Azure AI Inference SDK") are preserved unchanged.
- Exception: `learn.microsoft.com/azure/ai-foundry/` URL paths are preserved — they are valid, not stale.

**SDK verification outcomes:**
- `azure-search-documents` 12.x — Challenge 04 uses the portal "Add your data" / Playground integration workflow with no direct SDK vector-query code; no code changes required. If future code samples are added, use `VectorizableTextQuery` or `VectorizedQuery` from `azure.search.documents.models`.
- `azure-ai-evaluation` 1.16.9 — `GroundednessEvaluator`, `RelevanceEvaluator`, `CoherenceEvaluator`, `FluencyEvaluator` class names are unchanged; Challenge 05 skeleton is valid.
- `azure-ai-projects` 2.x constructor — `from_connection_string` not found in ch 04–06 files; clean.
- Flask 3.1.x — Challenge 06 scaffold pattern is valid; no breaking API changes.

**Badge fix (Task C):**
- README.md line 3: `pages.yml` → `deploy-pages.yml`; badge link target updated from repo root to workflow runs page.

**URL sweep findings:**
- `github.com/microsoft/ai-hackathon/discussions` → `github.com/olivomarco/ai-hackathon/discussions` (found in `docs/resources.md` Community section).
- No `docs.microsoft.com/` or `ai-studio/` path refs found in ch 04–06 or any other in-scope file.
- `learn.microsoft.com/en-us/` paths with redundant `/en-us/` were already correct (those URLs are valid).

**Files with no changes needed:**
- Challenge solution/coach guides for 04–06 contained only coaching language — no stale product names or SDK references.
- `.github/ISSUE_TEMPLATE/` files were clean.

---

## 2026-05-28 — Cross-page link fix (broken Pages links)

**Task:** Fix 7 `../../challenges/.../README.md` relative links in `docs/challenges/challenge-XX.md` that resolved outside the Jekyll Pages tree and produced 404s on the live site.

**Files changed:**
- `docs/challenges/challenge-00.md`
- `docs/challenges/challenge-01.md`
- `docs/challenges/challenge-02.md`
- `docs/challenges/challenge-03.md`
- `docs/challenges/challenge-04.md`
- `docs/challenges/challenge-05.md`
- `docs/challenges/challenge-06.md`

**URL pattern applied:** `https://github.com/olivomarco/ai-hackathon/tree/main/challenges/challenge-XX-name` (folder view, not blob/README, so participants see the full folder + solution.md).

**Audit result:** Full grep of `docs/**/*.md` for `../../` patterns — no other escaping links found.

**Decision doc:** `.squad/decisions/inbox/basher-cross-page-link-fix.md`

---

## Team Update — 2026-05-28 Session Complete

**Session:** Fact-check & CSS fix (multi-batch agent work)

**Major Outcomes:**
- **Microsoft Foundry rebrand applied** — All challenges verified & updated (Azure AI Foundry → Microsoft Foundry)
- **CSS rendering restored** — GitHub Pages now displays with full just-the-docs theme
- **Content verified against current docs** — All SDK versions, deployment patterns, and terminology current (no breaking changes)
- **Humanizer pass complete** — 28 files cleaned of AI-generated patterns (emojis, em dashes, promotional vocab)
- **Cross-page links fixed** — Challenge discovery pages now render without 404s
- **Platform resilience discovered** — Serial agent dispatch works around 401 outages (parallel spawn causes race conditions)

**Next:** Marco needs to `git push` to deploy CSS fix to live site; maintainers must run `cd docs && bundle install` to regenerate Gemfile.lock.
