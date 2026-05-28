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
- **Groundedness**: whether the answer is supported by the retrieved or provided source material.
- **Relevance**: how directly the response addresses the user's question or task.
- **Coherence**: whether the answer is logically organized and easy to follow.
- **Fluency**: whether the writing is natural, clear, and well-formed.
- **Content safety**: testing for harmful, disallowed, or policy-violating inputs and outputs.
- **LLM-as-judge**: using model-based evaluators to score or compare outputs at scale.
</div>

## Learn before you build

- [Azure AI evaluation metrics reference](https://learn.microsoft.com/azure/ai-foundry/concepts/evaluation-metrics-built-in): package overview and evaluator framing.
- [Evaluate generative AI apps in Microsoft Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/evaluate-generative-ai-app): practical evaluation workflow.
- [Responsible AI guidance for Azure AI](https://learn.microsoft.com/azure/ai-foundry/responsible-use-of-ai-overview): safety and governance perspective.
- [Azure AI Content Safety overview](https://learn.microsoft.com/azure/ai-services/content-safety/overview): moderation and safety capabilities.

<div class="callout-info" markdown="1">
**Working in Codespaces?** The scripts and starter files for this challenge live in `challenges/challenge-05-evaluation/` inside the repository. Open the repo in Codespaces (button in the page header), navigate to that folder, and run the commands shown below from there.
</div>

## Step-by-step

### Step 1: Understand the evaluation metrics

Before running tools, make sure your team can explain the four metrics.

- **Groundedness**: a grounded answer uses only what the source material supports. Example weak case: the assistant invents a scholarship deadline not found in the FAQ.
- **Relevance**: a relevant answer addresses the user's real question. Example weak case: the assistant answers about housing when the question was about registration.
- **Coherence**: a coherent answer is logically structured and not self-contradictory. Example weak case: the answer says both "yes" and "no" in different sections.
- **Fluency**: a fluent answer reads naturally and clearly. Example weak case: the response is awkward, repetitive, or hard to follow.

### Step 2: Create a test dataset

Create this file:

```text
challenges/challenge-05-evaluation/test-dataset.jsonl
```

Add **10 evaluation items** with question, expected answer context, and retrieved context or ground-truth support. Keep the dataset realistic and aligned to the Northfield University FAQ corpus.

A JSONL row might look like:

```json
{"question":"How do I apply for financial aid?","answer":"...","context":"Students must submit the FAFSA and the university aid form by the stated deadline."}
```

Your dataset does not need to be perfect, but it should cover multiple topic types and at least a few edge cases.

### Step 3: Write the evaluation script

Use the `azure-ai-evaluation` SDK and create a script that runs the built-in evaluators.

Starter skeleton:

```python
from azure.ai.evaluation import (
    GroundednessEvaluator,
    RelevanceEvaluator,
    CoherenceEvaluator,
    FluencyEvaluator,
)

# TODO: fill in your project/model configuration
# TODO: load challenges/challenge-05-evaluation/test-dataset.jsonl
# TODO: run evaluation against your Challenge 04 RAG system
```

A completed script should:

1. load the dataset
2. call your RAG system for answers if needed
3. run all four evaluators
4. capture results for later review

### Step 4: Run evaluation against the RAG system

Run the evaluators on the University Q&A Assistant from Challenge 04.

Do not assume good scores just because the app feels useful in a few manual tests. The point is to measure patterns across multiple examples.

### Step 5: Review results in the Microsoft Foundry Evaluation dashboard

Open the Evaluation dashboard in Microsoft Foundry and inspect your results.

Look for:

- weak metric categories
- outlier examples
- topic areas with repeated failure
- differences between strong and weak answers

### Step 6: Identify at least two weak areas

Write down at least two findings from the results. Examples:

- groundedness drops when retrieved context is too broad
- relevance drops on financial aid questions
- fluency is good, but coherence weakens on longer answers

### Step 7: Make one improvement and re-run

Change **one meaningful variable** such as:

- the system prompt
- citation instructions
- chunking configuration
- retrieval settings
- answer formatting guidance

Then re-run the evaluation so you can compare before and after results.

### Step 8: Document the results

Write your findings in:

```text
challenges/challenge-05-evaluation/evaluation-report.md
```

Include:

- before/after scores
- the change you made
- what improved
- what still needs work

### Step 9: Run a content safety check

Test at least **5 adversarial or problematic prompts** and document how the system responded. Examples:

- attempts to get disallowed academic misconduct help
- prompt injection attempts that try to override instructions
- abusive language
- requests for harmful or unrelated advice
- attempts to extract hidden system behavior

Capture whether filtering, refusal, redirection, or fallback behavior worked as expected.

## Success Criteria

- [ ] Test dataset with 10 items created
- [ ] All 4 evaluators run successfully
- [ ] Evaluation dashboard results reviewed
- [ ] One improvement made and re-evaluated
- [ ] Evaluation report written
- [ ] Content safety test completed

## Tips

- Scores are signals, not absolute truth. Use them to guide investigation, not to replace judgment.
- **LLM-as-judge** evaluators are useful, but they also have limits and can reflect evaluator bias.
- Use **human review** when stakes are high, outputs are sensitive, or metric results are ambiguous.
- Change one variable before re-running so your improvement claim is credible.
- A lower score is useful if it helps you find the next fix.

## Advanced

If you finish early:

- Create a **custom evaluator** for university-specific quality checks
- Build a **batch evaluation pipeline** for repeated regression testing
- Run an **A/B evaluation** comparing two prompt or retrieval configurations

<nav class="page-nav">
  <a href="{{ '/challenges/challenge-04' | relative_url }}">← Previous</a>
  <a href="{{ '/challenges/challenge-06' | relative_url }}">Next →</a>
</nav>
