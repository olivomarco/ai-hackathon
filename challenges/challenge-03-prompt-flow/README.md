# Challenge 03: Prompt Flow: Multi-step LLM Orchestration

## Introduction
Single prompts are useful, but real AI apps usually need more than one step. They may classify a question, choose the right handling path, call a model with specialized instructions, and then shape the final answer for the user.

In Microsoft Foundry, **Prompt Flow** helps you design that orchestration visually and test it as a repeatable workflow. In this challenge, you will evolve your **University Q&A Assistant** from a single-prompt prototype into a multi-step system that can route different kinds of student questions more intentionally.

> **📌 Note on Prompt Flow status:** Prompt Flow is in sustaining mode. Microsoft is steering new work toward the **Foundry Agent Service** (via `azure-ai-projects` 2.x). Feature development has concluded; the tooling remains fully functional for existing workflows and is the right fit for this hackathon challenge. The orchestration patterns you learn here transfer directly to Agent Service flows. See [Foundry Agent Service](https://learn.microsoft.com/azure/ai-foundry/concepts/agents) for the forward-looking path.

## What you'll build
You will create a **Standard Prompt Flow** for the University Q&A Assistant that:

1. Classifies each incoming question into one of four categories: `standard`, `financial`, `housing`, or `academic`
2. Routes the question to the most appropriate specialized prompt
3. Formats the final answer in a clear, student-friendly Northfield University tone

By the end, your assistant should feel less generic than the version from Challenge 02 because it will use different instructions for different question types.

## Step-by-step
### Step 1: Open Prompt Flow in Microsoft Foundry
In your Microsoft Foundry project, open **Prompt Flow** and create a new **Standard Flow**.

Give it a clear name such as `university-qa-routing-flow`. Standard flows are a good fit here because you want a directed, multi-step workflow with explicit inputs and outputs.

### Step 2: Define your flow input
Create a flow input such as:

- `question`: the student's question as text

Keep the first version simple. You can add more fields later, such as locale, user role, or conversation history.

### Step 3: Add the “Classify Question” LLM node
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

- “When does the library open on Saturdays?”
- “How do I apply for financial aid?”
- “What residence halls allow first-year students?”
- “Can I switch majors after my first semester?”

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

This node should answer the student’s question using the specialized instructions selected by the Python node. Keep the assistant grounded in university support behavior: helpful, clear, and honest about uncertainty.

### Step 6: Add the “Format Response” LLM node
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

- “Where can I get help resetting my student password?”
- “What is the deadline for submitting scholarship documents?”
- “Are freshmen required to live on campus?”
- “How many credits do I need to graduate?”
- “Can I register for classes after the add/drop deadline?”

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

## Learning Resources
- [Microsoft Foundry Prompt Flow overview](https://learn.microsoft.com/azure/ai-foundry/how-to/prompt-flow)
- [Develop flows in Microsoft Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/flow-develop)
- [Prompt engineering concepts](https://learn.microsoft.com/azure/ai-services/openai/concepts/prompt-engineering)
- [Foundry Agent Service (forward-looking orchestration path)](https://learn.microsoft.com/azure/ai-foundry/concepts/agents)
- [Develop generative AI apps on Microsoft Foundry](https://learn.microsoft.com/training/paths/develop-generative-ai-apps/)

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
