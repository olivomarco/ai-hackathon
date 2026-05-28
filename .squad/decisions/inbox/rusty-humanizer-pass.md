# Humanizer Pass — Pattern Fix Log
**Author:** Rusty (Curriculum Designer)  
**Date:** 2026-05-28  
**Requested by:** Marco (olivomarco)  
**Scope:** 28 files, humanizer skill v2.7.0

---

## File-by-file counts

### README.md
- Removed 12 decorative emojis from H1 and H2/H3 headers (🤖, 🎯, 👥, 👨‍🎓, 👩‍🏫, 📋, 🚀, 🏆, 🗂️, 🧑‍🏫, 📚, 🤝)
- Removed trailing 🚀 from closing line
- Fixed 1 em dash in prose (design decisions) → comma
- Fixed 1 em dash in tagline → colon
- Fixed 1 em dash after "needed" → period
- Fixed 4 em dashes in Resources list → colons
- Fixed 1 em dash in License paragraph → comma
- Fixed em dashes in repository structure list → colons

### docs/index.md
- Removed 🤖 from H1 inside hero panel HTML
- Removed 🚀 and 🧑‍🏫 from 2 CTA buttons (both top and bottom)
- Fixed em dash in hero tagline → colon
- Fixed em dash in "steer — without" → removed, direct connection

### docs/setup.md
- No changes needed. Content already clean.

### docs/coach-hub.md
- Removed 🧑‍🏫 from YAML front-matter title field
- Replaced "Welcome, Coach" H1 (cliché opener) → "Coach Hub"
- Rewrote opening sentence (rule-of-three) → "asking better questions rather than giving faster answers"

### docs/faq.md
- Fixed em dash in FAQ heading "expired / I don't have one —" → colon
- Fixed em dash in heading "fall behind —" → period, restructured to two sentences
- Fixed em dash in answer body "Yes — most events" → "Yes. Most events"

### docs/resources.md
- No changes needed. Content already clean, no emoji in headers.

### docs/challenges/index.md
- No prose changes needed. Table navigation dashes (00 —, 01 —, etc.) are navigation identifiers, kept.

### challenges/challenge-00-setup/README.md
- Fixed em dash after "project endpoint —" → parentheses
- Fixed em dash in tips "home page —" → semicolon

### challenges/challenge-00-setup/solution.md
- Fixed H1 title em dash → colon
- Fixed em dash in "Foundry resource —" → semicolon

### challenges/challenge-01-first-model/README.md
- No changes needed. Already clean.

### challenges/challenge-01-first-model/solution.md
- Fixed H1 title em dash → colon
- Fixed em dash in "ai.azure.com) —" → semicolon

### challenges/challenge-02-prompt-engineering/README.md
- Fixed 4 em dashes in numbered definition list (Persona setting, Few-shot, Chain-of-thought, Output format) → colons

### challenges/challenge-02-prompt-engineering/solution.md
- Fixed H1 title em dash → colon

### challenges/challenge-03-prompt-flow/README.md
- Fixed H1 title em dash → colon
- Fixed em dash in sustaining-mode callout → period (kept callout intact, per constraint)
- Fixed em dash in flow input definition → colon

### challenges/challenge-03-prompt-flow/solution.md
- Fixed H1 title em dash → colon
- Fixed em dash in coach note callout title → colon (kept callout intact)
- Fixed em dash in "DAG-based visual orchestration tool —" → colon

### challenges/challenge-04-rag/README.md
- Replaced "are powerful" with "can produce fluent, confident text" (promotional word)
- Fixed H1 title em dash → colon
- Fixed 2 em dashes in comparison list (without RAG / with RAG) → colons

### challenges/challenge-04-rag/solution.md
- Fixed H1 title em dash → colon

### challenges/challenge-05-evaluation/README.md
- Rewrote negative parallelism opener → declarative
- Fixed 4 em dashes in metric definition list → colons

### challenges/challenge-05-evaluation/solution.md
- Fixed H1 title em dash → colon

### challenges/challenge-06-deploy/README.md
- Removed "an interface, and" from rule-of-three sentence
- Replaced "showcase" (AI vocabulary word) → "present"

### challenges/challenge-06-deploy/solution.md
- Fixed H1 title em dash → colon

### docs/challenges/challenge-00.md
- Fixed em dash in hero tagline "boring—in" → comma
- Fixed 5 em dashes in Key Concepts callout → colons
- Fixed 4 em dashes in Learn links → colons
- Fixed em dash in CTA callout → comma

### docs/challenges/challenge-01.md
- Fixed 6 em dashes in Key Concepts callout → colons
- Fixed 5 em dashes in Learn links → colons
- Fixed em dash in CTA callout → comma

### docs/challenges/challenge-02.md
- Fixed negative parallelism + em dash in hero tagline → restructured positive framing
- Fixed 2 em dashes in pattern list (prose) → parentheses removed, comma
- Fixed 5 em dashes in Key Concepts callout → colons
- Fixed 4 em dashes in Learn links → colons
- Fixed em dash in CTA callout → comma

### docs/challenges/challenge-03.md
- Fixed 5 em dashes in Key Concepts callout → colons
- Fixed 5 em dashes in Learn links → colons
- Fixed em dash in CTA callout → comma

### docs/challenges/challenge-04.md
- Fixed em dash in YAML title field → colon
- Fixed em dash in H1 → colon
- Fixed 6 em dashes in Key Concepts callout → colons
- Fixed 4 em dashes in Learn links → colons
- Fixed em dash in CTA callout → comma

### docs/challenges/challenge-05.md
- Fixed 6 em dashes in Key Concepts callout → colons
- Fixed 4 em dashes in Learn links → colons
- Fixed em dash in CTA callout → comma

### docs/challenges/challenge-06.md
- Fixed 2 em dashes in hero tagline → removed (restructured)
- Fixed em dash in production paragraph → colon
- Removed "strong" (promotional adjective) → "useful"
- Fixed 5 em dashes in Key Concepts callout → colons
- Fixed 4 em dashes in Learn links → colons
- Fixed em dash in CTA callout → comma

### PLAN.md (Tier 3)
- Fixed H1 title em dash → colon
- Fixed tagline table em dash → colon
- Fixed redundant "Microsoft's Microsoft Foundry platform" → "Microsoft Foundry"

---

## Judgment calls

1. **Navigation table dashes** (e.g., `[00 — Setup & Orientation]` in docs/challenges/index.md and docs/index.md) — kept. These are structural labels embedded in links and challenge naming convention across the whole site, not prose em dashes.

2. **Timing bullet ranges** (e.g., `0–10 minutes`, `6–8 hours`) — kept. These are en dashes used correctly for numeric ranges, not em dash substitutes.

3. **PLAN.md section headers with em dashes** (Phase 1 —, Phase 2 —, team role headers) — kept. These are internal planning meta-structure where restructuring would break team tooling conventions (Tier 3 = don't restructure).

4. **Meta-badge HTML emojis** (⏱️ 30 min, 🧭, 🚀, ✍️, 🔀, 📚, 📏, 🔌) in `docs/challenges/*.md` — kept. These are inside `<span class="meta-badge">` UI elements rendered by the Just The Docs theme as visual chips, not prose decoration. Removing them would break the visual design intentionally built by Linus.

5. **Warning ⚠️ and 📌 callout emojis** — kept per brief constraint (semantic callout markers).

6. **CTA buttons in docs/index.md** — removed emoji (🚀, 🧑‍🏫) since the button text is self-explanatory without them.

7. **"Welcome, Coach" opener** — changed to "Coach Hub" (direct section title) rather than dropping the heading, to preserve nav anchor.

8. **docs/faq.md "Azure AI Foundry"** — left unchanged. This is a brand-name question (not a humanizer pattern) and out of scope for this pass. Flagged for next audit.
