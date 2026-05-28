---
title: "Challenge 02 Coach Notes: Prompt Engineering"
parent: Challenges
nav_order: 102
nav_exclude: true
search_exclude: false
---

<div class="hero-panel challenge-hero">
  <span class="hero-kicker">Challenge 02 • Coach Notes</span>
  <h1>Prompt Engineering: Coach View</h1>
  <p class="hero-tagline">Reference answer key, expected blockers, and timing for coaches running this challenge. Not visible to students from the main navigation.</p>
</div>

<div class="callout-warning" markdown="1">
**Coaches only.** Students get more out of the challenge when they discover the path themselves. Use these notes to unblock teams, not to dictate solutions.
</div>

## Overview

Students should learn that prompt engineering is structured design work, not magic wording. A strong result will define persona, scope, tone, and fallback behavior, then validate those choices against realistic and adversarial user questions.

The target use case is a **University Q&A Assistant**, which prepares teams for the later RAG challenge. Coaches should keep students focused on behavior design first, rather than trying to solve missing-data problems with made-up facts.

## Step-by-Step Solution

1. Start with a baseline system prompt and collect a few weak or inconsistent responses.
2. Introduce one prompt pattern at a time: persona, few-shot, chain-of-thought, then output control.
3. After each change, test the same or very similar questions so students can observe the effect.
4. Guide teams to write a final system prompt that includes:
   - role and audience
   - answer boundaries
   - response style
   - uncertainty handling
   - off-topic behavior
5. Have them test at least five queries, including off-topic and unsafe scenarios.
6. Review content safety settings in Microsoft Foundry and capture at least two observations.
7. Save the final prompt in `challenges/challenge-02-prompt-engineering/system-prompt.txt`.

A strong final prompt should feel reusable, not overfit to one exact example.

## Common Issues

- **Over-constraining**: Students add so many rules that the assistant becomes robotic or refuses too often.
- **Under-specifying**: The prompt sounds friendly but does not define scope, tone, or uncertainty handling.
- **Changing too many variables at once**: They alter prompt, model, and test question together, which hides cause and effect.
- **Using chain-of-thought carelessly**: Students may ask for visible internal reasoning when a concise user-facing answer would be better.
- **Ignoring edge cases**: Teams test only "happy path" questions and miss off-topic or harmful prompts.

## Coaching Tips

Questions that guide well:

- "What behavior are you trying to make consistent?"
- "How will your assistant respond when it does not know?"
- "Did this change improve the answer, or just make it longer?"
- "What happens when the user asks something off-topic?"
- "Could another team member reuse this prompt without extra explanation?"

If you run a quick comparison session, ask each team to demo the same user query with their final prompt. This makes differences in persona, constraints, and formatting easy to discuss.

## Timing

- **0–10 minutes**: Baseline prompt and initial observations
- **10–30 minutes**: Pattern-by-pattern experimentation
- **30–45 minutes**: Draft and refine final system prompt
- **45–60 minutes**: Edge-case testing, content safety observations, and team comparison

Intervene when a team is stuck in endless tweaking without a test plan. Encourage simple prompt versions plus repeatable evaluation.

### What Good Looks Like

- Persona is specific and relevant to the use case
- Boundaries are clear without making the assistant unhelpful
- Output format is deliberate, not decorative
- Off-topic and unsafe requests are handled consistently
- The prompt is understandable by humans, not just long

### What Weak Prompts Usually Look Like

- They sound generic and could apply to any chatbot
- They do not explain what to do when information is missing
- They ask for too many behaviors at once without prioritizing them
- They produce formatting rules that add noise instead of clarity
- They never define how to respond to harmful or off-topic requests

<nav class="page-nav">
  <a href="{{ '/coach-hub' | relative_url }}">← Back to Coach Hub</a>
  <a href="{{ '/challenges/challenge-02' | relative_url }}">Student page →</a>
</nav>
