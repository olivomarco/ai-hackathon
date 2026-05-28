---
title: "Challenge 01: First Model Deployment"
parent: Challenges
nav_order: 2
---

<div class="hero-panel challenge-hero">
  <span class="hero-kicker">Challenge 01 • First live model</span>
  <h1>First Model Deployment</h1>
  <p class="hero-tagline">This is the moment the catalog turns into something real. Participants deploy a model, test it in the Playground, and make their first authenticated SDK call so they can see the full path from portal experiment to application code.</p>
  <div class="meta-strip">
    <span class="meta-badge">⏱️ 45 min</span>
    <span class="difficulty-badge difficulty-1">⭐ Beginner</span>
    <span class="meta-badge">🚀 Deployment + code</span>
  </div>
</div>

## What this challenge is about

A model deployment is what makes a catalog choice usable. Instead of reading model cards in the abstract, participants provision an endpoint that playgrounds and code can call, then compare how deployment choices affect speed, control, and developer experience.

This page also introduces the useful distinction between **Models-as-a-Service (MaaS)** and **Models-as-a-Platform (MaaP)**. Teams do not need to master every hosting option yet, but they should leave knowing when they are using a Microsoft-managed serving path versus a deployment they manage more directly inside Azure.

## What participants will build

<div class="quick-grid">
  <div class="quick-card">
    <h3>A working model deployment</h3>
    <p>A live model inside the project that can be selected in the Playground and reached from code.</p>
  </div>
  <div class="quick-card">
    <h3>A tested playground prompt</h3>
    <p>A quick interactive experiment that shows how system instructions shape the model’s tone and structure.</p>
  </div>
  <div class="quick-card">
    <h3>A first Python inference call</h3>
    <p>A small script that authenticates, sends messages, and prints the response from the deployed model endpoint.</p>
  </div>
</div>

## Key concepts

<div class="callout-info" markdown="1">
- **Deployment** — the runnable instance of a model that exposes an endpoint for playgrounds, apps, and SDKs.
- **MaaS** — a faster, service-style deployment path where Microsoft manages the serving layer for you.
- **MaaP** — a more platform-shaped deployment model with more control over how the model runs in your Azure environment.
- **Playground** — the fastest place to test prompts, tune behavior, and inspect output before writing application code.
- **`azure-ai-inference` SDK** — the Python client library for chat completions, embeddings, and inference requests against supported endpoints.
- **Endpoint** — the URL your script or app calls to send prompts and receive model output.
</div>

## Learn before you build

- [Deploy models in Azure AI Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/deploy-models-openai) — deployment concepts and portal flow.
- [Model catalog overview](https://learn.microsoft.com/azure/ai-foundry/how-to/model-catalog-overview) — compare model families and deployment paths.
- [Azure AI Inference SDK for Python](https://learn.microsoft.com/python/api/overview/azure/ai-inference-readme) — official package guide and samples.
- [Use playgrounds in Azure AI Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/playgrounds) — quick path for interactive testing.

<div class="callout-tip" markdown="1">
Ready to deploy and call your first model? [📋 Open Challenge Guide](../../challenges/challenge-01-first-model/README.md)
</div>

<nav class="page-nav">
  <a href="{{ '/challenges/challenge-00' | relative_url }}">← Previous</a>
  <a href="{{ '/challenges/challenge-02' | relative_url }}">Next →</a>
</nav>
