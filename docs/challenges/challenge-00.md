---
title: "Challenge 00: Setup & Orientation"
parent: Challenges
nav_order: 1
---

<div class="hero-panel challenge-hero">
  <span class="hero-kicker">Challenge 00 • Foundation</span>
  <h1>Setup &amp; Orientation</h1>
  <p class="hero-tagline">Start by making the environment boring—in the best possible way. This challenge introduces Microsoft Foundry, shows how a Foundry resource and project fit together, and gets every team into a working devcontainer so the rest of the day can focus on building instead of fixing setup.</p>
  <div class="meta-strip">
    <span class="meta-badge">⏱️ 30 min</span>
    <span class="difficulty-badge difficulty-1">⭐ Beginner</span>
    <span class="meta-badge">🧭 Foundry basics</span>
  </div>
</div>

## What this challenge is about

Microsoft Foundry is the control room for the hackathon: it is where you organize resources, browse models, run playground experiments, and eventually evaluate and deploy your app. In this first stop, participants build the mental model for how a **Foundry resource** provides shared infrastructure and how a **Project** becomes the team's day-to-day workspace.

The other half of the challenge is environment confidence. The devcontainer and Azure CLI setup matter because they remove machine drift, package mismatches, and authentication surprises before later challenges depend on Python code, SDKs, and Azure resources.

## What participants will build

<div class="quick-grid">
  <div class="quick-card">
    <h3>A ready-to-use Foundry workspace</h3>
    <p>A Foundry project with auto-provisioned resources so the team has a clean starting point for the rest of the hackathon.</p>
  </div>
  <div class="quick-card">
    <h3>A reliable dev environment</h3>
    <p>A Codespaces or local devcontainer setup with Python and Azure CLI working the same way for every participant.</p>
  </div>
  <div class="quick-card">
    <h3>A shared vocabulary</h3>
    <p>A practical understanding of the model catalog, project boundaries, and how portal work connects to code.</p>
  </div>
</div>

## Key concepts

<div class="callout-info" markdown="1">
- **Foundry resource** — the Azure resource that provides shared infrastructure, networking, and RBAC for all projects within it.
- **Project** — the working space where participants deploy models, test prompts, run evaluations, and manage files.
- **Model Catalog** — the marketplace-style view of available models, capabilities, providers, and deployment options.
- **Devcontainer** — the reproducible developer environment that gives every participant the same tooling and dependencies.
- **Azure CLI** — the command-line bridge for signing in, selecting subscriptions, and validating Azure access from code.
</div>

## Learn before you build

- [Microsoft Foundry documentation](https://learn.microsoft.com/azure/ai-foundry/) — official starting point for the platform.
- [Create projects in Microsoft Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/create-projects) — explains project setup and required roles.
- [Model catalog overview](https://learn.microsoft.com/azure/ai-foundry/how-to/model-catalog-overview) — understand what you can browse and deploy.
- [Authenticate to Azure using Azure CLI](https://learn.microsoft.com/cli/azure/authenticate-azure-cli) — quick guide for sign-in and subscription selection.

<div class="callout-tip" markdown="1">
Ready to do the hands-on work? **Open the full challenge guide on GitHub:** [challenges/challenge-00-setup](https://github.com/olivomarco/ai-hackathon/tree/main/challenges/challenge-00-setup) — or open the repository in Codespaces (badge above) and follow the README in `challenges/challenge-00-setup/`.
</div>

<nav class="page-nav">
  <a href="{{ '/challenges/' | relative_url }}">← Previous</a>
  <a href="{{ '/challenges/challenge-01' | relative_url }}">Next →</a>
</nav>
