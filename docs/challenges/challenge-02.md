---
title: "Challenge 02: Prompt Engineering"
parent: Challenges
nav_order: 3
---

<div class="hero-panel challenge-hero">
  <span class="hero-kicker">Challenge 02 • Behavior design</span>
  <h1>Prompt Engineering</h1>
  <p class="hero-tagline">Good AI apps are not just model choices—they are instruction choices. In this challenge, teams learn how deliberate prompting changes quality, consistency, and safety before any orchestration or retrieval layer is added.</p>
  <div class="meta-strip">
    <span class="meta-badge">⏱️ 1 hr</span>
    <span class="difficulty-badge difficulty-2">⭐⭐ Intermediate start</span>
    <span class="meta-badge">✍️ Prompt craft</span>
  </div>
</div>

## What this challenge is about

Prompting matters because it is the first layer of product design for an LLM-powered experience. A clear system prompt can make answers feel focused, safe, and useful; a vague one can make the same model seem unreliable, inconsistent, or off-topic.

Participants explore four practical patterns—**persona**, **few-shot examples**, **chain-of-thought guidance**, and **output formatting**—so they can see which controls are best for shaping a university-style assistant. The goal is not magic phrasing; it is repeatable behavior design.

## What participants will build

<div class="quick-grid">
  <div class="quick-card">
    <h3>A reusable system prompt</h3>
    <p>A prompt that defines role, scope, tone, fallback behavior, and response expectations for the assistant.</p>
  </div>
  <div class="quick-card">
    <h3>A small prompt test set</h3>
    <p>A handful of on-topic, ambiguous, and off-topic questions used to compare prompt versions side by side.</p>
  </div>
  <div class="quick-card">
    <h3>A safety-aware response style</h3>
    <p>A prompt strategy that encourages helpful behavior while redirecting harmful or unsupported requests.</p>
  </div>
</div>

## Key concepts

<div class="callout-info" markdown="1">
- **System prompt** — the high-priority instruction layer that defines the assistant’s identity, rules, and response contract.
- **Few-shot prompting** — guiding the model with a few representative examples of good inputs and outputs.
- **Chain-of-thought** — prompting a model to reason through a task more carefully, while deciding what reasoning should or should not be exposed to users.
- **Output format control** — requesting bullets, JSON, or constrained structures to make responses easier for humans and code to consume.
- **Content safety** — shaping the app so unsafe, off-topic, or disallowed requests are refused, redirected, or handled carefully.
</div>

## Learn before you build

- [Prompt engineering concepts in Azure AI Foundry](https://learn.microsoft.com/azure/ai-foundry/concepts/prompt-engineering) — clear guidance on prompt structure and iteration.
- [Use playgrounds in Azure AI Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/playgrounds) — test prompt variations and compare outputs.
- [Azure AI Content Safety overview](https://learn.microsoft.com/azure/ai-services/content-safety/overview) — moderation and prompt protection concepts.
- [Develop generative AI solutions with Azure AI Foundry](https://learn.microsoft.com/training/paths/develop-generative-ai-solutions-azure-ai-foundry/) — Microsoft Learn path for stronger prompting practice.

<div class="callout-tip" markdown="1">
Ready to refine the assistant behavior? [📋 Open Challenge Guide](../../challenges/challenge-02-prompt-engineering/README.md)
</div>

<nav class="page-nav">
  <a href="{{ '/challenges/challenge-01' | relative_url }}">← Previous</a>
  <a href="{{ '/challenges/challenge-03' | relative_url }}">Next →</a>
</nav>
