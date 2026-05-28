---
title: "Challenge 05 Coach Notes: Evaluation & Responsible AI"
parent: Challenges
nav_order: 105
nav_exclude: true
search_exclude: false
---

<div class="hero-panel challenge-hero">
  <span class="hero-kicker">Challenge 05 • Coach Notes</span>
  <h1>Evaluation &amp; Responsible AI: Coach View</h1>
  <p class="hero-tagline">Reference answer key, expected blockers, and timing for coaches running this challenge. Not visible to students from the main navigation.</p>
</div>

<div class="callout-warning" markdown="1">
**Coaches only.** Students get more out of the challenge when they discover the path themselves. Use these notes to unblock teams, not to dictate solutions.
</div>

## Overview

This challenge teaches students to treat AI quality as something they can measure, discuss, and improve. The strongest teams will connect evaluation results back to design choices from earlier challenges instead of treating metrics as isolated numbers.

Coaches should emphasize that evaluation is not only about ranking the system. It is about surfacing failure modes, making trade-offs visible, and practicing responsible AI habits before deployment.

## Common Issues

- **Evaluation quota or runtime limits**: Students may hit service or model limits and assume their script is wrong.
- **Metric interpretation confusion**: Teams sometimes overreact to one low score without checking examples.
- **Weak datasets**: If the 10 test items are too repetitive, the results will not reveal much.
- **Changing multiple variables at once**: This makes before/after comparisons hard to trust.
- **Treating safety as separate from quality**: Responsible AI checks should be part of system evaluation, not an afterthought.

If teams are blocked technically, a smaller successful run with a subset of the dataset is better than waiting too long for a perfect first pass.

## Coaching Tips

Use a quick group debrief if several teams finish around the same time. Ask:

- "Which metric surprised you most?"
- "What failure pattern showed up more than once?"
- "What did you change, and why did you choose that variable?"
- "Did your improvement help all question types or only some of them?"
- "What should still require human review?"

For ethical discussion, ask:

- "What can these metrics miss?"
- "When might a fluent answer still be dangerous?"
- "How should a university decide what 'safe enough' means?"

## Timing

- **0–15 minutes**: Explain metrics and prepare the dataset
- **15–35 minutes**: Run evaluation and inspect results
- **35–50 minutes**: Identify weak areas and make one improvement
- **50–60 minutes**: Re-run, compare results, discuss responsible AI observations

Encourage teams to finish with one clear insight and one clear improvement rather than chasing perfect scores.

## Expected Questions

- **"What counts as a good score?"**  
  There is no universal threshold. Good depends on your use case, risk level, and comparison baseline.

- **"Can we trust LLM-as-judge metrics completely?"**  
  No. They are helpful signals, but they should be paired with human review and domain judgment.

- **"Why do content safety tests belong here?"**  
  Because deployment readiness depends on both answer quality and safe behavior under adversarial input.

<nav class="page-nav">
  <a href="{{ '/coach-hub' | relative_url }}">← Back to Coach Hub</a>
  <a href="{{ '/challenges/challenge-05' | relative_url }}">Student page →</a>
</nav>
