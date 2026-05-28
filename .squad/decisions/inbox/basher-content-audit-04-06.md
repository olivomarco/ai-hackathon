# Content Audit Report — Challenges 04–06
**Author:** Basher (DevRel / Coach Materials)  
**Date:** 2026-05-28  
**Requested by:** Marco (olivomarco)  
**Verified against:** Azure AI Search 12.x SDK docs, azure-ai-evaluation 1.16.9 docs, Microsoft Foundry deploy-models docs, Livingston's `livingston-version-audit.md`, Rusty's `rusty-content-audit-00-03.md`

---

## Per-Challenge Findings

### Challenge 04 — RAG: Grounding with Your Data

| Claim | Source | Action |
|---|---|---|
| `README.md` Step 2: "in Azure AI Foundry" (product name) | Rebrand requirement | **Fixed** → "in Microsoft Foundry" |
| `README.md` What you'll build: "in Azure AI Foundry" | Rebrand requirement | **Fixed** → "in Microsoft Foundry" |
| `README.md` Learning Resources: link text "RAG in Azure AI Foundry" | Rebrand requirement | **Fixed** → "RAG in Microsoft Foundry" |
| `README.md` Learning Resources URLs: `learn.microsoft.com/azure/ai-foundry/` paths | ✅ Valid paths (not ai-studio/) | No change |
| `README.md` No `from_connection_string` or `AZURE_AI_ENDPOINT` | ✅ No SDK code in challenge README | No change needed |
| `README.md` No azure-search-documents vector API code | ✅ Challenge uses portal/playground, no direct SDK snippets | No change needed |
| `solution.md` (coach guide) — no product name or SDK issues | ✅ Coach language only | No change needed |
| `docs/challenges/challenge-04.md` link text: "RAG in Azure AI Foundry" | Rebrand requirement | **Fixed** → "in Microsoft Foundry" |
| `docs/challenges/challenge-04.md` URLs: `learn.microsoft.com/azure/ai-foundry/` | ✅ Valid paths | No change |

**SDK note (azure-search-documents 12.x):** Challenge 04 uses the Azure portal "Add your data" / Playground integration workflow — no direct `SearchClient`, `VectorizedQuery`, or `VectorizableTextQuery` Python code is present in the README or coach guide. If a code-heavy extension is added in future, use `VectorizableTextQuery` (text-to-vector at query time) or `VectorizedQuery` (pre-computed vectors) from `azure.search.documents.models` — both are present in 12.x SDK.

---

### Challenge 05 — Evaluation & Responsible AI

| Claim | Source | Action |
|---|---|---|
| `README.md` intro: "structured evaluations in Azure AI Foundry" | Rebrand requirement | **Fixed** → "in Microsoft Foundry" |
| `README.md` Step 5: "AI Foundry Evaluation dashboard" | Rebrand requirement | **Fixed** → "Microsoft Foundry Evaluation dashboard" |
| `README.md` code skeleton: `GroundednessEvaluator`, `RelevanceEvaluator`, `CoherenceEvaluator`, `FluencyEvaluator` | azure-ai-evaluation 1.16.9 ✅ — all class names unchanged | No change needed |
| `README.md` Learning Resources: link text "Evaluate generative AI apps in Azure AI Foundry" | Rebrand requirement | **Fixed** → "in Microsoft Foundry" |
| `README.md` Learning Resources URLs: `learn.microsoft.com/azure/ai-foundry/` paths | ✅ Valid paths | No change |
| `solution.md` (coach guide) — no product name or SDK issues | ✅ Coach language only | No change needed |
| `docs/challenges/challenge-05.md` link text: "in Azure AI Foundry" | Rebrand requirement | **Fixed** → "in Microsoft Foundry" |

---

### Challenge 06 — Deploy & Integrate

| Claim | Source | Action |
|---|---|---|
| `README.md` What you'll build: "in Azure AI Foundry" | Rebrand requirement | **Fixed** → "in Microsoft Foundry" |
| `README.md` Step 2: "In Azure AI Foundry, deploy the flow" | Rebrand requirement | **Fixed** → "In Microsoft Foundry" |
| `README.md` Flask scaffold — uses `requests`, `flask`, `dotenv` | requirements.txt 3.1.x ✅ | No change needed |
| `README.md` Learning Resources URLs: `learn.microsoft.com/azure/ai-foundry/` and `azure/machine-learning/` paths | ✅ Valid | No change |
| `README.md` no `from_connection_string` or old env vars | ✅ Clean | No change needed |
| `solution.md` (coach guide) — no product name or SDK issues | ✅ Coach language only | No change needed |
| `docs/challenges/challenge-06.md` — no "Azure AI Foundry" product refs in text | ✅ Already clean | No change needed |

---

## URL Replacements Found + Fixed

| Old value | New value | File(s) |
|---|---|---|
| `github.com/microsoft/ai-hackathon/discussions` | `github.com/olivomarco/ai-hackathon/discussions` | `docs/resources.md` |
| `codespaces.new/microsoft/ai-hackathon` | `codespaces.new/olivomarco/ai-hackathon` | `docs/setup.md` |
| "Azure AI Foundry" (browser prereq) | "Microsoft Foundry" | `docs/setup.md` |
| "provision the hub and project" | "provision the Foundry resource and project" | `docs/setup.md` |
| All `pages.yml` badge reference | `deploy-pages.yml` badge reference | `README.md` |
| Badge link target `github.com/olivomarco/ai-hackathon` | `github.com/olivomarco/ai-hackathon/actions/workflows/deploy-pages.yml` | `README.md` |
| No `docs.microsoft.com/` or `ai-studio/` path refs found in ch 04–06 or scoped files | — | All checked |

---

## Badge Fix Confirmation (Task C)

**Before:**
```
[![GitHub Pages](https://github.com/olivomarco/ai-hackathon/actions/workflows/pages.yml/badge.svg)](https://github.com/olivomarco/ai-hackathon)
```
**After:**
```
[![Deploy GitHub Pages](https://github.com/olivomarco/ai-hackathon/actions/workflows/deploy-pages.yml/badge.svg)](https://github.com/olivomarco/ai-hackathon/actions/workflows/deploy-pages.yml)
```
- Workflow filename: `pages.yml` → `deploy-pages.yml` ✅
- Badge label: "GitHub Pages" → "Deploy GitHub Pages" (matches workflow name)
- Link target: repo root → workflow runs page ✅

---

## Product Rebrand Applied — "Azure AI Foundry" → "Microsoft Foundry"

Applied across all in-scope files. Preserved literal SDK/service names:
- "Azure AI Search" — kept (Azure service name)
- "azure-ai-evaluation" — kept (package name)
- "Azure AI Inference SDK" — kept (SDK name)
- `learn.microsoft.com/azure/ai-foundry/` URL paths — kept (valid learn.microsoft.com paths)

### Files Updated

| File | Changes |
|---|---|
| `README.md` | Title, badge, 7× product name, 1× resources link text |
| `challenges/challenge-04-rag/README.md` | 3× product name / link text |
| `challenges/challenge-05-evaluation/README.md` | 3× product name / link text |
| `challenges/challenge-06-deploy/README.md` | 2× product name |
| `docs/challenges/challenge-04.md` | 1× link text |
| `docs/challenges/challenge-05.md` | 1× link text |
| `docs/resources.md` | Section heading, 6× link text, 1× community URL |
| `docs/index.md` | description meta, hero kicker, h1, body text, challenge table, students section |
| `PLAN.md` | Title block, table, coach audience, learning outcomes, all challenge feature rows, README outline |

### Files with No Changes Needed

| File | Reason |
|---|---|
| `challenges/challenge-04-rag/solution.md` | Coach text only — no product name refs |
| `challenges/challenge-05-evaluation/solution.md` | Coach text only — no product name refs |
| `challenges/challenge-06-deploy/solution.md` | Coach text only — no product name refs |
| `docs/challenges/challenge-06.md` | Already clean — no "Azure AI Foundry" product refs in text |
| `.github/ISSUE_TEMPLATE/*.md` | No stale patterns found |

---

## SDK Verification Notes

| SDK | Status | Notes |
|---|---|---|
| `azure-search-documents` 12.x | ✅ No code changes needed | Ch 04 uses portal workflow only; no direct vector query code |
| `azure-ai-evaluation` 1.16.9 | ✅ Evaluator class names unchanged | `GroundednessEvaluator`, `RelevanceEvaluator`, `CoherenceEvaluator`, `FluencyEvaluator` all valid |
| `azure-ai-projects` 2.x constructor | ✅ Not present in ch 04–06 | No `from_connection_string` found |
| Flask 3.1.x | ✅ Ch 06 scaffold valid | No breaking changes to scaffold pattern |
