---
title: "Challenge 02: Prompt Engineering"
parent: Challenges
nav_order: 3
---

<div class="hero-panel challenge-hero">
  <span class="hero-kicker">Challenge 02 • Behavior design</span>
  <h1>Prompt Engineering</h1>
  <p class="hero-tagline">Good AI apps depend on instruction choices as much as model choices. In this challenge, teams learn how deliberate prompting changes quality, consistency, and safety before any orchestration or retrieval layer is added.</p>
  <div class="meta-strip">
    <span class="meta-badge">⏱️ 1 hr</span>
    <span class="difficulty-badge difficulty-2">⭐⭐ Intermediate start</span>
    <span class="meta-badge">✍️ Prompt craft</span>
  </div>
</div>

## What this challenge is about

Prompting matters because it is the first layer of product design for an LLM-powered experience. A clear system prompt can make answers feel focused, safe, and useful; a vague one can make the same model seem unreliable, inconsistent, or off-topic.

Participants explore four practical patterns (**persona**, **few-shot examples**, **chain-of-thought guidance**, and **output formatting**) so they can see which controls are best for shaping a university-style assistant. The goal is not magic phrasing; it is repeatable behavior design.

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
- **System prompt**: the high-priority instruction layer that defines the assistant's identity, rules, and response contract.
- **Few-shot prompting**: guiding the model with a few representative examples of good inputs and outputs.
- **Chain-of-thought**: prompting a model to reason through a task more carefully, while deciding what reasoning should or should not be exposed to users.
- **Output format control**: requesting bullets, JSON, or constrained structures to make responses easier for humans and code to consume.
- **Content safety**: shaping the app so unsafe, off-topic, or disallowed requests are refused, redirected, or handled carefully.
</div>

## Learn before you build

- [Prompt engineering concepts](https://learn.microsoft.com/azure/ai-services/openai/concepts/prompt-engineering): clear guidance on prompt structure and iteration.
- [Use playgrounds in Microsoft Foundry](https://learn.microsoft.com/azure/ai-foundry/quickstarts/get-started-playground): test prompt variations and compare outputs.
- [Azure AI Content Safety overview](https://learn.microsoft.com/azure/ai-services/content-safety/overview): moderation and prompt protection concepts.
- [Develop generative AI solutions with Microsoft Foundry](https://learn.microsoft.com/training/browse/?products=azure-ai-foundry): Microsoft Learn modules for stronger prompting practice.

<div class="callout-info" markdown="1">
**Working in Codespaces?** The scripts and starter files for this challenge live in `challenges/challenge-02-prompt-engineering/` inside the repository. Open the repo in Codespaces (button in the page header), navigate to that folder, and run the commands shown below from there.
</div>

## Step-by-step

### Four prompt engineering patterns to explore

1. **Persona setting**: give the model a role, audience, and voice
2. **Few-shot examples**: show example inputs and outputs
3. **Chain-of-thought**: ask the model to reason step by step
4. **Output format control**: request JSON, bullets, or other constrained structures

### Step 1: Open the Playground

In Microsoft Foundry, open the **Chat Playground** and choose a model deployment from Challenge 01.

### Step 2: Start with a baseline system prompt

Begin with a simple prompt such as:

```text
You are a helpful university assistant.
```

Test a few user questions:

- "How do I apply for scholarships?"
- "What computer science programs do you offer?"
- "Can I register late for classes?"

Record what feels vague, inconsistent, or too generic.

### Step 3: Apply each pattern one at a time

Now improve the behavior in controlled steps.

#### Persona setting

Try defining audience, tone, and scope:

```text
You are Northfield University's student support assistant. Answer in a warm, clear, student-friendly tone. If you are unsure, say what information is missing.
```

#### Few-shot examples

Add short examples that demonstrate good answers for campus questions.

#### Chain-of-thought

Ask the model to reason step by step before answering. For user-facing apps, you may later decide not to expose that reasoning directly. For this challenge, focus on whether the pattern improves response quality.

#### Output format control

Request a consistent structure, such as:

- A 2-sentence answer
- A 3-bullet action plan
- A JSON object with `answer`, `confidence`, and `follow_up`

### Step 4: Design your final system prompt

Create a final version for the **University Q&A Assistant**. A strong prompt should cover:

- Who the assistant is
- What kinds of questions it should answer
- How it should respond when information is missing
- Tone and format expectations
- Boundaries for off-topic or unsafe requests

### Step 5: Test edge cases

Try at least five user queries, including off-topic requests. For example:

- "What majors are best for machine learning?"
- "Can you help me cheat on an exam?"
- "Tell me the weather in Tokyo."
- "What is the deadline for financial aid?"
- "I feel overwhelmed and need support."

Observe when the assistant should answer, redirect, or refuse.

### Step 6: Configure content safety filters

Review the available content safety or filtering options in the playground. Adjust them if your environment allows it, then re-run a few test prompts and note what changes.

### Step 7: Save your final system prompt

Save your best version in:

```text
challenges/challenge-02-prompt-engineering/system-prompt.txt
```

Keep it clean and reusable so your team can reference it in later challenges.

## Success Criteria

- [ ] Explored all 4 prompt patterns in the Playground
- [ ] Designed a system prompt with clear persona and constraints
- [ ] Tested at least 5 different user queries
- [ ] Saved system prompt to file
- [ ] Documented 2+ content filter observations

## Tips

- Change one thing at a time so you can tell what actually improved the response.
- More constraints are not always better. Too many rules can make answers stiff or brittle.
- Keep a simple experiment log: prompt version, test question, what improved, what got worse.
- Think about failure behavior. Good prompts do more than shape great answers; they also handle uncertainty well.

## Advanced Challenges (Optional)

If you finish early:

- Improve your prompt's resistance to prompt injection attempts.
- Design a strategy for preserving helpful behavior across multi-turn conversations.
- Compare visible chain-of-thought style prompting with hidden reasoning instructions and discuss trade-offs.

<nav class="page-nav">
  <a href="{{ '/challenges/challenge-01' | relative_url }}">← Previous</a>
  <a href="{{ '/challenges/challenge-03' | relative_url }}">Next →</a>
</nav>
