---
title: "Challenge 06: Deploy & Integrate"
parent: Challenges
nav_order: 7
---

<div class="hero-panel challenge-hero">
  <span class="hero-kicker">Challenge 06 • From demo to app</span>
  <h1>Deploy &amp; Integrate</h1>
  <p class="hero-tagline">The final challenge is about product shape. Participants publish their AI workflow behind an endpoint, call it from application code, and think through what changes when an experiment becomes something another system—or another user—depends on.</p>
  <div class="meta-strip">
    <span class="meta-badge">⏱️ 1 hr</span>
    <span class="difficulty-badge difficulty-5">⭐⭐⭐⭐⭐ Expert stretch</span>
    <span class="meta-badge">🔌 Endpoint integration</span>
  </div>
</div>

## What this challenge is about

Deploying is the transition from workshop output to usable service. Instead of keeping logic inside a portal session, teams publish a managed endpoint that can be called from a web app, script, or downstream system through an authenticated REST API.

This is also where production thinking starts to matter. Teams are now packaging and deploying the **University Q&A Assistant** they shaped in Challenges 02–05, so even a minimal Flask integration surfaces real concerns—secret handling, retries, logging, latency, and release workflow. That makes this challenge a strong bridge from hackathon experimentation to responsible app delivery.

## What participants will build

<div class="quick-grid">
  <div class="quick-card">
    <h3>A managed endpoint</h3>
    <p>A published deployment that exposes the team’s model or flow through a stable, callable interface.</p>
  </div>
  <div class="quick-card">
    <h3>A Flask-connected experience</h3>
    <p>A lightweight application layer that sends requests to the endpoint and renders the response to a user.</p>
  </div>
  <div class="quick-card">
    <h3>A production-minded checklist</h3>
    <p>An initial plan for secrets, CI/CD, observability, error handling, and rollout decisions beyond the hackathon.</p>
  </div>
</div>

## Key concepts

<div class="callout-info" markdown="1">
- **Managed online endpoint** — a hosted inference surface for real-time requests.
- **REST API** — the HTTP interface your app uses to send inputs and receive predictions or responses.
- **Flask** — a lightweight Python web framework that is perfect for a simple integration demo.
- **Deployment** — the packaged and published version of your flow or model for external use.
- **CI/CD** — the automation path for validating, packaging, and releasing changes safely.
</div>

## Learn before you build

- [Deploy flows and apps in Azure AI Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/deploy-flow) — deployment entry point for the hackathon flow.
- [Managed online endpoints overview](https://learn.microsoft.com/azure/machine-learning/concept-endpoints-online) — Azure-hosted real-time deployment guidance.
- [Flask quickstart](https://flask.palletsprojects.com/en/stable/quickstart/) — lightweight path for the local integration app.
- [Requests: HTTP for Humans](https://requests.readthedocs.io/en/latest/) — REST request patterns and response handling.

<div class="callout-tip" markdown="1">
Ready to ship the experience into an app? [📋 Open Challenge Guide](../../challenges/challenge-06-deploy/README.md)
</div>

<nav class="page-nav">
  <a href="{{ '/challenges/challenge-05' | relative_url }}">← Previous</a>
  <a href="{{ '/resources' | relative_url }}">Next →</a>
</nav>
