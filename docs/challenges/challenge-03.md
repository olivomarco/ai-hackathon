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
- **Prompt Flow**: a visual and code-backed way to define AI workflows with reusable steps.
- **LLM nodes**: steps that send prompts to a model and return generated output.
- **Python nodes**: deterministic logic for validation, parsing, scoring, or custom transformations.
- **DAG (Directed Acyclic Graph)**: the dependency map showing which node runs before another and how data flows through the system.
- **YAML flow definition**: the file-based representation of the flow, including nodes, inputs, outputs, and connections.
</div>

## Learn before you build

- [Microsoft Foundry Prompt Flow overview](https://learn.microsoft.com/azure/ai-foundry/how-to/prompt-flow): core concepts and workflow model.
- [Develop flows in Microsoft Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/flow-develop): authoring, testing, and iteration guidance.
- [Prompt engineering concepts](https://learn.microsoft.com/azure/ai-services/openai/concepts/prompt-engineering): helpful framing for node prompts and output contracts.
- [Foundry Agent Service](https://learn.microsoft.com/azure/ai-foundry/concepts/agents): the forward-looking orchestration path (successor to Prompt Flow for new projects).
- [Microsoft Foundry learning modules](https://learn.microsoft.com/training/browse/?products=azure-ai-foundry): broader Learn modules that include orchestration patterns.

<div class="callout-warning" markdown="1">
**Prompt Flow status:** Prompt Flow feature development ended April 20, 2026 and will be fully retired April 20, 2027 (entering read-only mode at that date). Existing flows continue to run. If you are working after that date or want the forward-looking path, see the [Microsoft Agent Framework migration guide](https://learn.microsoft.com/azure/ai-foundry/how-to/prompt-flow).
</div>

<div class="callout-info" markdown="1">
**Working in Codespaces?** The scripts and starter files for this challenge live in `challenges/challenge-03-prompt-flow/` inside the repository. Open the repo in Codespaces (button in the page header), navigate to that folder, and run the commands shown below from there.
</div>

## Step-by-step

### Step 1: Open Prompt Flow in Microsoft Foundry

In your Microsoft Foundry project, open **Prompt Flow** and create a new **Standard Flow**.

Give it a clear name such as `university-qa-routing-flow`. Standard flows are a good fit here because you want a directed, multi-step workflow with explicit inputs and outputs.

### Step 2: Define your flow input

Create a flow input such as:

- `question`: the student's question as text

Keep the first version simple. You can add more fields later, such as locale, user role, or conversation history.

### Step 3: Add the "Classify Question" LLM node

Add an LLM node named **Classify Question**.

Its job is to label each question as one of these four categories only:

- `standard`
- `financial`
- `housing`
- `academic`

Use a prompt that makes the output strict and predictable. For example:

```text
You are a classifier for a university support assistant.
Classify the student question into exactly one category:
standard, financial, housing, academic.
Return only the category name.

Question: {{question}}
```

Test the node with prompts like:

- "When does the library open on Saturdays?"
- "How do I apply for financial aid?"
- "What residence halls allow first-year students?"
- "Can I switch majors after my first semester?"

### Step 4: Add routing logic with a Python node

Add a Python node that takes the classification result and prepares the specialized instructions for the next model call.

Example idea:

```python
def my_python_tool(question: str, category: str):
    prompts = {
        "standard": "Answer general campus services questions clearly and briefly.",
        "financial": "Answer tuition, billing, scholarship, and financial aid questions carefully. If details are missing, say so.",
        "housing": "Answer residence, housing policy, and move-in questions with practical next steps.",
        "academic": "Answer academic policy, registration, advising, and program questions with structured guidance."
    }
    return {
        "selected_prompt": prompts.get(category.strip().lower(), prompts["standard"]),
        "normalized_category": category.strip().lower(),
        "question": question,
    }
```

This node does not have to generate the full answer. Its purpose is to route and prepare the right prompt context.

### Step 5: Add a specialized answer node

Add another LLM node that uses the routed prompt from the Python node.

This node should answer the student's question using the specialized instructions selected by the Python node. Keep the assistant grounded in university support behavior: helpful, clear, and honest about uncertainty.

### Step 6: Add the "Format Response" LLM node

Add a final LLM node named **Format Response**.

Its purpose is to normalize the voice and structure of the output so every answer feels like it comes from the same University Q&A Assistant.

Ask it to:

- use a warm, student-friendly tone
- keep the answer concise
- include next steps when useful
- avoid making up missing policy details

A simple structure could be:

- short answer
- next step or recommendation
- optional note when information is uncertain

### Step 7: Test end to end in the Prompt Flow test pane

Use the flow test pane to run at least five varied questions. Make sure you cover all four categories across your test set.

Suggested questions:

- "Where can I get help resetting my student password?"
- "What is the deadline for submitting scholarship documents?"
- "Are freshmen required to live on campus?"
- "How many credits do I need to graduate?"
- "Can I register for classes after the add/drop deadline?"

Watch for failure points such as:

- incorrect classification
- wrong node input mapping
- answers that ignore the specialized path
- inconsistent tone in the final output

### Step 8: Export and version the flow YAML

When your flow is working, export or save the flow YAML and place it in:

```text
challenges/challenge-03-prompt-flow/flow.dag.yaml
```

Treat the YAML as part of your project artifact. It makes the flow easier to review, version, and reuse later in the hackathon.

## Success Criteria

- [ ] Flow created with at least 3 nodes
- [ ] Classification node working for 4 categories
- [ ] Routing logic implemented
- [ ] End-to-end test passed with 5 different question types
- [ ] Flow YAML saved to `challenges/challenge-03-prompt-flow/flow.dag.yaml`

## Tips

- **DAG vs Standard Flow**: for this challenge, focus on a Standard Flow that makes the multi-step path easy to inspect.
- **Python node vs LLM node**: use Python for deterministic routing logic, and LLM nodes for language tasks such as classification or response generation.
- **Connection management**: if a node fails early, verify the model connection and deployment selection before changing your prompts.
- Keep node names descriptive so debugging is easier during coach check-ins.
- Test one node at a time before assuming the full flow is broken.

## Advanced

If you finish early:

- Add **parallel branches** for different prompt strategies and compare outputs
- Add simple **error handling** for unexpected category outputs
- Introduce a **memory or context input** so repeated student questions can use prior conversation state

<nav class="page-nav">
  <a href="{{ '/challenges/challenge-02' | relative_url }}">← Previous</a>
  <a href="{{ '/challenges/challenge-04' | relative_url }}">Next →</a>
</nav>
