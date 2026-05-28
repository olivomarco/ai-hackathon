# Content Audit Report — Challenges 00–03
**Author:** Rusty (Curriculum Designer)  
**Date:** 2026-05-28  
**Requested by:** Marco (olivomarco)  
**Verified against:** Microsoft Foundry docs + Livingston's `livingston-version-audit.md`

---

## Per-Challenge Findings

### Challenge 00 — Setup & Orientation

| Claim | Source | Action |
|---|---|---|
| `README.md` uses "Microsoft Foundry" throughout | Livingston rebrand ✅ | No change needed |
| Portal URL `ai.azure.com` ✅ | MS Foundry docs ✅ | No change needed |
| Project endpoint format `https://<resource>.services.ai.azure.com/api/projects/<project>` ✅ | MS Foundry quickstart ✅ | No change needed |
| No separate hub creation step ✅ | MS Foundry portal flow ✅ | No change needed |
| `solution.md` timing said "creating the hub/project" | Stale hub reference | **Fixed** → "creating the Foundry project" |
| `docs/challenge-00.md` hero tagline: "Azure AI Foundry, Hub and Project" | Old branding | **Fixed** → "Microsoft Foundry, Foundry resource and project" |
| `docs/challenge-00.md` "What participants will build" card: "A hub, a project…" | Old model | **Fixed** → "A Foundry project with auto-provisioned resources…" |
| `docs/challenge-00.md` Key Concepts: "Hub — shared management layer" | Old concept | **Fixed** → "Foundry resource — Azure resource providing shared infrastructure…" |
| `docs/challenge-00.md` Learn links: "Azure AI Foundry docs/Create projects in Azure AI Foundry" | Old product name | **Fixed** → "Microsoft Foundry docs/Create projects in Microsoft Foundry" |

---

### Challenge 01 — First Model Deployment

| Claim | Source | Action |
|---|---|---|
| `README.md` code uses `AIProjectClient(endpoint=..., credential=DefaultAzureCredential())` ✅ | azure-ai-projects 2.x ✅ | No change needed |
| `README.md` code uses `project.get_openai_client()` + `openai.responses.create()` ✅ | MS Foundry quickstart ✅ | No change needed |
| `README.md` uses `FOUNDRY_PROJECT_ENDPOINT` in code sample ✅ | `.env.example` ✅ | No change needed |
| `README.md` Success criteria: "GPT-4o-mini" | Old model name | **Fixed** → "gpt-4.1-mini" (aligns with Step 2 and `.env.example`) |
| `README.md` Tips: "print whether `AZURE_AI_ENDPOINT` and `AZURE_AI_KEY` are set" | Wrong env vars | **Fixed** → `FOUNDRY_PROJECT_ENDPOINT` |
| `README.md` Tips: "inference endpoint format" | Old SDK terminology | **Fixed** → explicit project endpoint URL format |
| `README.md` Learning Resources: "Azure AI Foundry" product refs | Old branding | **Fixed** → "Microsoft Foundry" in display text; added AI Projects SDK link |
| `solution.md` Step 1: "deployment for GPT-4o-mini" | Old model name | **Fixed** → "gpt-4.1-mini" |
| `solution.md` Step 5: "Install `azure-ai-inference`" | Wrong SDK | **Fixed** → `azure-ai-projects>=2.0.0` |
| `solution.md` Step 7: "Create a `ChatCompletionsClient`" | Deprecated pattern | **Fixed** → `AIProjectClient` + `get_openai_client()` + `responses.create()` |
| `solution.md` Common Issues: `AZURE_AI_ENDPOINT` / `AZURE_AI_KEY` | Wrong env vars | **Fixed** → `FOUNDRY_PROJECT_ENDPOINT` |
| `solution.md` "Key vs Azure AD" note | Stale (SDK now uses DefaultAzureCredential) | **Fixed** → updated to DefaultAzureCredential flow |
| `solution.md` "Azure AI Foundry" product refs | Old branding | **Fixed** → "Microsoft Foundry" |
| `docs/challenge-01.md` Key Concepts: `azure-ai-inference` as primary SDK | Updated guidance | **Fixed** → `azure-ai-projects` is recommended path; `azure-ai-inference` noted as still available |
| `docs/challenge-01.md` Learn links: "Azure AI Foundry" | Old branding | **Fixed** → "Microsoft Foundry"; added AI Projects SDK link |

---

### Challenge 02 — Prompt Engineering

| Claim | Source | Action |
|---|---|---|
| `README.md` Step 1: "In Azure AI Foundry, open the Chat Playground" | Old product name | **Fixed** → "In Microsoft Foundry" |
| `README.md` Learning Resources URL: `learn.microsoft.com/azure/ai-foundry/openai/concepts/prompt-engineering` | Wrong URL path (ai-foundry ≠ ai-services) | **Fixed** → `learn.microsoft.com/azure/ai-services/openai/concepts/prompt-engineering` |
| `README.md` Learning Resources: "Azure AI Foundry playgrounds" | Old product name | **Fixed** → "Microsoft Foundry playgrounds" |
| `solution.md` content safety step: "Review content safety settings" | Implicit product ref | **Fixed** → "in Microsoft Foundry" added for clarity |
| `docs/challenge-02.md` Learn links: "Azure AI Foundry" | Old branding | **Fixed** → "Microsoft Foundry" |
| `docs/challenge-02.md` training link text | Old product name | **Fixed** → "Microsoft Foundry" |

---

### Challenge 03 — Prompt Flow

| Claim | Source | Action |
|---|---|---|
| `README.md` intro: "In Azure AI Foundry, Prompt Flow" | Old product name | **Fixed** → "In Microsoft Foundry" |
| `README.md` Step 1: "In your Azure AI Foundry project" | Old product name | **Fixed** → "In your Microsoft Foundry project" |
| `README.md` Learning Resources: `ai-foundry/openai/` URL path | Wrong path | **Fixed** → `ai-services/openai/` |
| `README.md` No sustaining mode callout | Livingston requirement | **Added** — prominent callout block after intro with link to Foundry Agent Service |
| `README.md` Learning Resources: "Azure AI Foundry Prompt Flow / Develop flows" | Old product name | **Fixed** → "Microsoft Foundry"; added Foundry Agent Service link |
| `solution.md` Overview: no Prompt Flow status note for coaches | Livingston requirement | **Added** — coach note about sustaining mode + Foundry Agent Service |
| `solution.md` Expected Questions: no "what's the difference from Agent Service?" | Gap | **Added** — Q&A entry explaining DAG vs Agent Service distinction |
| `docs/challenge-03.md` Learn links: "Azure AI Foundry Prompt Flow / Develop flows" | Old product name | **Fixed** → "Microsoft Foundry"; added Foundry Agent Service link |

---

## URL Replacements

| Old URL / pattern | New URL / pattern | Files |
|---|---|---|
| `learn.microsoft.com/azure/ai-foundry/openai/concepts/prompt-engineering` | `learn.microsoft.com/azure/ai-services/openai/concepts/prompt-engineering` | ch-02 README, ch-03 README, docs/ch-02.md |
| No `docs.microsoft.com` or `ai-studio/` references found — already clean | — | All ch 00–03 files |

---

## Callouts Added

| File | Callout |
|---|---|
| `challenges/challenge-03-prompt-flow/README.md` | 📌 Prompt Flow sustaining mode note with link to Foundry Agent Service |
| `challenges/challenge-03-prompt-flow/solution.md` | Coach note: Prompt Flow sustaining mode, Agent Service as successor; new FAQ entry |

---

## SDK Pattern Verification

| Pattern | Status | Challenge files |
|---|---|---|
| `AIProjectClient.from_connection_string(...)` | ❌ NOT found anywhere in ch 00–03 — already clean or fixed | ch 00–03 |
| `AIProjectClient(endpoint=..., credential=DefaultAzureCredential())` | ✅ Correct 2.x pattern in all code samples | ch 01 README |
| `project.get_openai_client()` + `openai.responses.create()` | ✅ Correct pattern | ch 01 README |
| `FOUNDRY_PROJECT_ENDPOINT` env var | ✅ Consistent across `.env.example`, ch 01 README/solution | All |
| `ChatCompletionsClient` (azure-ai-inference) | ❌ Was in ch-01 solution.md | **Fixed** |

---

## Env Var Alignment

`.env.example` uses `FOUNDRY_PROJECT_ENDPOINT` and `FOUNDRY_MODEL_NAME=gpt-4.1-mini`. All challenge references now align.

---

## Files Touched

- `challenges/challenge-00-setup/solution.md` — timing wording
- `challenges/challenge-01-first-model/README.md` — success criteria, tips, learning resources
- `challenges/challenge-01-first-model/solution.md` — SDK pattern, env vars, model name, full solution steps
- `challenges/challenge-02-prompt-engineering/README.md` — product name, URL fix
- `challenges/challenge-02-prompt-engineering/solution.md` — product name
- `challenges/challenge-03-prompt-flow/README.md` — product name, sustaining mode callout, learning resources
- `challenges/challenge-03-prompt-flow/solution.md` — product name, coach note, FAQ entry
- `docs/challenges/challenge-00.md` — hero tagline, hub concept, build card, learn links
- `docs/challenges/challenge-01.md` — key concepts, learn links
- `docs/challenges/challenge-02.md` — learn links
- `docs/challenges/challenge-03.md` — learn links, Foundry Agent Service added
