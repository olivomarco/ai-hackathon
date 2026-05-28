---
title: "Challenge 05: Evaluation & Responsible AI"
parent: Challenges
nav_order: 6
---

<div class="hero-panel challenge-hero">
  <span class="hero-kicker">Challenge 05 • Evidence over vibes</span>
  <h1>Evaluation &amp; Responsible AI</h1>
  <p class="hero-tagline">Once an app looks good in a demo, the real question starts: is it actually good? This challenge teaches participants to score quality, inspect failure modes, and treat safety checks as a design requirement rather than a last-minute add-on.</p>
  <div class="meta-strip">
    <span class="meta-badge">⏱️ 1 hr</span>
    <span class="difficulty-badge difficulty-4">⭐⭐⭐⭐ Advanced</span>
    <span class="meta-badge">📏 Quality + safety</span>
  </div>
</div>

## What this challenge is about

Evaluation matters because AI quality is rarely obvious from a few hand-picked examples. Teams need a way to compare prompt or RAG variants, understand where answers break down, and create shared evidence for whether an experience is trustworthy enough to continue refining or deploying.

Participants use built-in metrics such as **groundedness**, **relevance**, **coherence**, and **fluency**, then pair those with content safety testing. Here, they are evaluating the **RAG-based University Q&A Assistant** from Challenge 04 so they can connect weak scores back to prompt, retrieval, and formatting choices made earlier. The result is a more disciplined development loop: change something, measure it, inspect the trade-offs, and improve intentionally.

## What participants will build

<div class="quick-grid">
  <div class="quick-card">
    <h3>An evaluation-ready test set</h3>
    <p>A small but useful set of prompts, expected behaviors, and comparison cases that can be run repeatedly.</p>
  </div>
  <div class="quick-card">
    <h3>A quality score snapshot</h3>
    <p>A first-pass readout of how the app performs across the built-in metrics that matter most for grounded Q&amp;A.</p>
  </div>
  <div class="quick-card">
    <h3>A responsible AI checklist</h3>
    <p>Observed safety risks, refusal behavior, and content handling notes that inform what should change next.</p>
  </div>
</div>

## Key concepts

<div class="callout-info" markdown="1">
- **Groundedness** — whether the answer is supported by the retrieved or provided source material.
- **Relevance** — how directly the response addresses the user’s question or task.
- **Coherence** — whether the answer is logically organized and easy to follow.
- **Fluency** — whether the writing is natural, clear, and well-formed.
- **Content safety** — testing for harmful, disallowed, or policy-violating inputs and outputs.
- **LLM-as-judge** — using model-based evaluators to score or compare outputs at scale.
</div>

## Learn before you build

- [Azure AI evaluation concepts](https://learn.microsoft.com/azure/ai-foundry/concepts/evaluation) — package overview and evaluator framing.
- [Evaluate generative AI apps in Azure AI Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/evaluate-generative-ai-app) — practical evaluation workflow.
- [Responsible AI guidance for Azure AI](https://learn.microsoft.com/azure/ai-foundry/responsible-use-of-ai-overview) — safety and governance perspective.
- [Azure AI Content Safety overview](https://learn.microsoft.com/azure/ai-services/content-safety/overview) — moderation and safety capabilities.

<div class="callout-tip" markdown="1">
Ready to measure quality and safety? [📋 Open Challenge Guide](../../challenges/challenge-05-evaluation/README.md)
</div>

<nav class="page-nav">
  <a href="{{ '/challenges/challenge-04' | relative_url }}">← Previous</a>
  <a href="{{ '/challenges/challenge-06' | relative_url }}">Next →</a>
</nav>
