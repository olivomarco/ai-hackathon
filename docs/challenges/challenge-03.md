---
title: "Challenge 03: Prompt Flow"
parent: Challenges
nav_order: 4
---

<div class="hero-panel challenge-hero">
  <span class="hero-kicker">Challenge 03 • Orchestration</span>
  <h1>Prompt Flow</h1>
  <p class="hero-tagline">Single prompts are useful, but real apps often need a sequence. This challenge introduces multi-step orchestration so teams can combine model calls, Python logic, and structured inputs into one repeatable workflow.</p>
  <div class="meta-strip">
    <span class="meta-badge">⏱️ 1.5 hr</span>
    <span class="difficulty-badge difficulty-3">⭐⭐⭐ Intermediate</span>
    <span class="meta-badge">🔀 Multi-step logic</span>
  </div>
</div>

## What this challenge is about

Prompt Flow helps participants move from one-off chat experiments to composable AI workflows. Instead of asking a model to do everything in one turn, the team breaks work into connected steps: prepare an input, call an LLM, transform results in Python, and hand clean output to the next node.

That orchestration model is especially useful when you want repeatability. In this hackathon, teams use it to turn the **University Q&A Assistant** from Challenge 02 into a routed workflow that handles different student questions more deliberately. A flow makes dependencies visible, allows targeted debugging, and creates a cleaner path toward evaluation and deployment later in the hackathon.

## What participants will build

<div class="quick-grid">
  <div class="quick-card">
    <h3>A multi-node workflow</h3>
    <p>A flow that passes data across more than one step instead of relying on a single giant prompt.</p>
  </div>
  <div class="quick-card">
    <h3>LLM + Python collaboration</h3>
    <p>A design where language-model reasoning and deterministic Python logic each do the part they are best at.</p>
  </div>
  <div class="quick-card">
    <h3>A structured output contract</h3>
    <p>An output shape that downstream nodes, evaluations, or applications can depend on consistently.</p>
  </div>
</div>

## Key concepts

<div class="callout-info" markdown="1">
- **Prompt Flow** — a visual and code-backed way to define AI workflows with reusable steps.
- **LLM nodes** — steps that send prompts to a model and return generated output.
- **Python nodes** — deterministic logic for validation, parsing, scoring, or custom transformations.
- **DAG (Directed Acyclic Graph)** — the dependency map showing which node runs before another and how data flows through the system.
- **YAML flow definition** — the file-based representation of the flow, including nodes, inputs, outputs, and connections.
</div>

## Learn before you build

- [Azure AI Foundry Prompt Flow overview](https://learn.microsoft.com/azure/ai-foundry/how-to/prompt-flow) — core concepts and workflow model.
- [Develop flows in Azure AI Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/flow-develop) — authoring, testing, and iteration guidance.
- [Prompt engineering concepts in Azure AI Foundry](https://learn.microsoft.com/azure/ai-foundry/concepts/prompt-engineering) — helpful framing for node prompts and output contracts.
- [Develop generative AI solutions with Azure AI Foundry](https://learn.microsoft.com/training/paths/develop-generative-ai-solutions-azure-ai-foundry/) — broader Learn path that includes orchestration patterns.

<div class="callout-tip" markdown="1">
Ready to wire together a multi-step flow? [📋 Open Challenge Guide](../../challenges/challenge-03-prompt-flow/README.md)
</div>

<nav class="page-nav">
  <a href="{{ '/challenges/challenge-02' | relative_url }}">← Previous</a>
  <a href="{{ '/challenges/challenge-04' | relative_url }}">Next →</a>
</nav>
