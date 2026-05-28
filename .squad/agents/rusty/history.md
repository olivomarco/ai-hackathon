## Learnings

### Project Context
- **Project:** WTH (What The Hack) AI Hackathon — Microsoft Foundry format
- **Repo:** ai-hackathon
- **Stack:** Microsoft Foundry AI, GitHub Pages (Jekyll/static), Markdown, GitHub Actions
- **Participants:** Students (new to AI) + Coaches (facilitators)
- **Goal:** Create a complete, deliverable WTH hackathon format with a polished GitHub Pages site
- **Requested by:** Marco Olivo
- **Date:** 2026-05-28

### Challenge Writing Learnings
- WTH student guides work best when they move from motivation to action: introduction, concrete build steps, success checks, docs, hints, then stretch goals.
- Coach guides should emphasize facilitation over answer-giving: timing, diagnostic questions, and likely blockers are as important as the walkthrough.
- Early challenges need extra scaffolding for Azure concepts such as hubs, projects, deployments, endpoints, and content safety because the audience is new to AI and Azure.
- Reusing a single domain theme across challenges (Northfield University) creates continuity and makes later RAG and evaluation work feel intentional instead of disconnected.
- Sample RAG corpora are more useful when each file includes realistic deadlines, office hours, and contacts so retrieval can answer precise questions.
- Completed challenge documentation for Challenges 03-06 on 2026-05-28T16:23:27.374+01:00, including student README guides, coach solution guides, a recorded decision note, and continuity of the University Q&A Assistant narrative across orchestration, RAG, evaluation, and deployment.

### Content Audit Learnings (2026-05-28)
- **Microsoft Foundry rebrand:** "Azure AI Foundry" → "Microsoft Foundry" for all portal/product references in ch 00–03. SDK package names (`azure-ai-projects`, `azure-ai-inference`) are unchanged — only product/portal display text changes.
- **azure-ai-projects 2.x:** `from_connection_string()` is gone. Correct pattern: `AIProjectClient(endpoint=os.environ["FOUNDRY_PROJECT_ENDPOINT"], credential=DefaultAzureCredential())` + `.get_openai_client()` + `openai.responses.create()`. Verify solution.md files specifically — they often lag behind README updates.
- **Env var standardisation:** `FOUNDRY_PROJECT_ENDPOINT` is the canonical var (mirrors `.env.example`). Old references to `AZURE_AI_ENDPOINT` and `AZURE_AI_KEY` in challenge files must be replaced.
- **Model name drift:** Success criteria and solution steps can fall out of sync with README steps. Check them together. `gpt-4.1-mini` is the current recommended fast model (replacing `gpt-4o-mini`).
- **Prompt engineering URL path:** The prompt engineering concepts page is at `learn.microsoft.com/azure/ai-services/openai/concepts/prompt-engineering` — NOT `azure/ai-foundry/openai/`. Easy to get wrong when copying from nearby links.
- **Hub concept removal:** The new portal flow has no separate Hub creation step. Docs pages that described "Hub + Project" (challenge-00.md) need to be updated to "Foundry resource + Project" to match the new model.
- **Prompt Flow sustaining mode:** Add a visible callout in both the student README and the coach solution.md for challenge 03. Point to Foundry Agent Service as the forward-looking path. Do NOT remove the Prompt Flow content — it remains valid for the hackathon.
- **docs/ pages vs challenge/ files can diverge:** Key Concepts callouts in docs/ pages may use SDK names or product names that have been updated in the main challenge files. Audit them together.

### Humanizer Pass Learnings (2026-05-28)
- **Em dashes are pervasive in AI-generated docs.** The most common patterns: ` — ` in definition lists (Key Concepts and Learn links in all docs/challenges pages), em dashes in H1 subtitle patterns (`Title — Coach's Guide`), and em dashes in prose taglines. A single grep for `—` across the repo finds them all quickly.
- **Definition list em dash pattern**: `- **Term** — definition` and `- [Link](url) — description` appear in every Tier 2 challenge page. Replacement is always `: ` (colon-space), not semicolon or parentheses.
- **Solution.md H1 pattern**: All challenge solution files followed `# Challenge NN: Title — Coach's Guide`. Converted to `# Challenge NN: Title: Coach's Guide` (double colon as subtitle separator is accepted convention here).
- **UI emojis vs prose emojis**: The distinction matters. Emojis inside `<span class="meta-badge">` elements are structural UI (Just The Docs theme renders them as visual chips) — leave them. Emojis in YAML `title:` fields, `<h1>` tags, and plain Markdown headings are prose decoration — remove them.
- **Navigation table dashes**: The challenge listing table uses `[00 — Setup]` as labels that mirror the physical folder names and repeat across navigation. These are link-embedded identifiers, not prose em dashes. Leave them.
- **Promotional vocabulary in challenge docs**: "powerful", "showcase", "strong" (as in "a strong bridge from X to Y") are the recurring tells. Search for them when auditing new challenge content.
- **Rule-of-three**: Appeared in challenge-06 README (listed three things that could be described in one) and coach-hub.md (listed three outcomes). Rewriting to a single direct statement almost always reads better.
- **PLAN.md Tier 3 scope boundary**: Fix H1-level and tagline em dashes (visible to contributors). Leave phase header and template section em dashes (internal meta-structure that teams use as templates — restructuring breaks convention).

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
