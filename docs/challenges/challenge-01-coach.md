---
title: "Challenge 01 Coach Notes: First Model Deployment"
parent: Challenges
nav_order: 101
nav_exclude: true
search_exclude: false
---

<div class="hero-panel challenge-hero">
  <span class="hero-kicker">Challenge 01 • Coach Notes</span>
  <h1>First Model Deployment: Coach View</h1>
  <p class="hero-tagline">Reference answer key, expected blockers, and timing for coaches running this challenge. Not visible to students from the main navigation.</p>
</div>

<div class="callout-warning" markdown="1">
**Coaches only.** Students get more out of the challenge when they discover the path themselves. Use these notes to unblock teams, not to dictate solutions.
</div>

## Overview

Students should complete their first full platform-to-code loop in this challenge: choose a model, deploy it, test it in the playground, and invoke it from Python. The learning goal is not just "get text back," but to understand what a deployment is and how an SDK call maps to a resource they created in Microsoft Foundry.

This is also where teams first encounter the difference between a portal interaction and a programmable endpoint, so expect confusion around endpoints, credentials, and deployment readiness.

## Step-by-Step Solution

1. In the project, open **Deployments** and start a deployment for **gpt-4.1-mini** using the approved option for the event.
2. In the **Deployments** tab, watch the status until it shows **Succeeded** or **Ready** before debugging code.
3. Open Chat Playground, select the deployment, and test at least one custom system prompt.
4. Have students create `challenges/challenge-01-first-model/solution.py`.
5. Install `azure-ai-projects>=2.0.0` if it is not already available (`pip install azure-ai-projects>=2.0.0`).
6. Have students copy the **project endpoint** from the Microsoft Foundry project home page and store it in `FOUNDRY_PROJECT_ENDPOINT`.
7. Use `AIProjectClient(endpoint=..., credential=DefaultAzureCredential())`, call `.get_openai_client()`, then send a request with `openai.responses.create(model=<deployment-name>, input=<prompt>)` and print `response.output_text`.
8. Repeat the same prompt with a second model such as GPT-4.1 or Phi-4 and compare outputs.

The key verification moment is seeing a successful SDK response that matches the same deployment tested in the playground.

## Common Issues

- **Wrong endpoint format**: Students often paste a portal page URL instead of the project endpoint (`https://<resource>.services.ai.azure.com/api/projects/<project>`).
- **Deployment not ready yet**: They start coding before the deployment reaches ready status.
- **Missing environment variable**: `FOUNDRY_PROJECT_ENDPOINT` may be unset or copied with extra whitespace.
- **Auth confusion**: `DefaultAzureCredential` picks up the `az login` session automatically. If it fails, confirm `az account show` returns the right subscription.
- **Comparing prompts unfairly**: Students sometimes change both the model and the prompt at once, which makes comparison less useful.

## Coaching Tips

Helpful coaching questions:

- "What exact endpoint are you using?"
- "Is the deployment status ready, or are you testing too early?"
- "What happens if you print just whether `FOUNDRY_PROJECT_ENDPOINT` is set?"
- "Are you changing the model only, or the prompt too?"
- "What did you observe in the playground that you expected to see in code?"

Guide teams to isolate one variable at a time. A lot of confusion disappears once they compare playground success with their SDK request structure.

## Timing

- **0–10 minutes**: Model selection and deployment start
- **10–20 minutes**: Playground testing while deployment finishes
- **20–35 minutes**: Python SDK call implementation
- **35–45 minutes**: Compare a second model and discuss observations

Intervene if a team spends more than 5–7 minutes debugging code before confirming deployment readiness and correct endpoint values.

### Expected Student Questions

- **"What is the difference between MaaS and MaaP here?"**  
  Give a high-level answer: MaaS is the fastest managed route for this challenge; MaaP provides more platform control in other scenarios.

- **"Where do I find the endpoint?"**  
  Point them to the project home page in Microsoft Foundry (ai.azure.com); the **project endpoint** is shown there. They should use `FOUNDRY_PROJECT_ENDPOINT`, not an API key.

- **"Why does gpt-4.1 sound different from gpt-4.1-mini?"**  
  Encourage them to describe observed trade-offs in detail, speed, and tone instead of assuming one model is simply "better."

<nav class="page-nav">
  <a href="{{ '/coach-hub' | relative_url }}">← Back to Coach Hub</a>
  <a href="{{ '/challenges/challenge-01' | relative_url }}">Student page →</a>
</nav>
