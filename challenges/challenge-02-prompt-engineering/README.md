# Challenge 02: Prompt Engineering & System Design

## Introduction
Prompting is a skill, not a trick. Strong prompts help you communicate intent clearly, reduce ambiguity, and make model behavior more consistent. Weak prompts leave too much for the model to guess.

In this challenge, your team will design a system prompt for a **University Q&A Assistant**. That theme matters because later in the hackathon you will ground the assistant with university documents in a RAG workflow. For now, you will focus on behavior design before adding external knowledge.

## Description
You will experiment in the Chat Playground, observe how prompt changes affect output, and design a final system prompt that guides a University Q&A Assistant toward helpful, safe, and on-topic answers.

## Step-by-step
### Four prompt engineering patterns to explore
1. **Persona setting** — give the model a role, audience, and voice
2. **Few-shot examples** — show example inputs and outputs
3. **Chain-of-thought** — ask the model to reason step by step
4. **Output format control** — request JSON, bullets, or other constrained structures

### Step 1: Open the Playground
In Azure AI Foundry, open the **Chat Playground** and choose a model deployment from Challenge 01.

### Step 2: Start with a baseline system prompt
Begin with a simple prompt such as:

```text
You are a helpful university assistant.
```

Test a few user questions:

- “How do I apply for scholarships?”
- “What computer science programs do you offer?”
- “Can I register late for classes?”

Record what feels vague, inconsistent, or too generic.

### Step 3: Apply each pattern one at a time
Now improve the behavior in controlled steps.

#### Persona setting
Try defining audience, tone, and scope:

```text
You are Northfield University’s student support assistant. Answer in a warm, clear, student-friendly tone. If you are unsure, say what information is missing.
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

- “What majors are best for machine learning?”
- “Can you help me cheat on an exam?”
- “Tell me the weather in Tokyo.”
- “What is the deadline for financial aid?”
- “I feel overwhelmed and need support.”

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

## Learning Resources
- [Prompt engineering concepts in Azure AI Foundry](https://learn.microsoft.com/azure/ai-foundry/concepts/prompt-engineering)
- [Azure AI Foundry playgrounds](https://learn.microsoft.com/azure/ai-foundry/how-to/playgrounds)
- [Azure AI Content Safety overview](https://learn.microsoft.com/azure/ai-services/content-safety/overview)
- [Develop generative AI solutions with Azure AI Foundry](https://learn.microsoft.com/training/paths/develop-generative-ai-solutions-azure-ai-foundry/)

## Tips
- Change one thing at a time so you can tell what actually improved the response.
- More constraints are not always better. Too many rules can make answers stiff or brittle.
- Keep a simple experiment log: prompt version, test question, what improved, what got worse.
- Think about failure behavior. Good prompts do more than shape great answers; they also handle uncertainty well.

## Advanced Challenges (Optional)
If you finish early:

- Improve your prompt’s resistance to prompt injection attempts.
- Design a strategy for preserving helpful behavior across multi-turn conversations.
- Compare visible chain-of-thought style prompting with hidden reasoning instructions and discuss trade-offs.
