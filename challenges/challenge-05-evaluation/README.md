# Challenge 05: Evaluation & Responsible AI

## Introduction
Building an AI system is not just about getting one good answer. You also need to know how consistently it performs, where it fails, and whether it behaves responsibly under pressure.

This challenge shifts your mindset from **“Does it work?”** to **“How well does it work, and how do we know?”** Using the University Q&A Assistant you built in earlier challenges, you will run structured evaluations in Azure AI Foundry and make one evidence-based improvement.

## What you'll build
You will create an evaluation workflow for the **RAG-based University Q&A Assistant** that measures:

- **Groundedness** — does the answer stay supported by the retrieved context?
- **Relevance** — does it answer the actual user question?
- **Coherence** — is it logically organized and internally consistent?
- **Fluency** — is it easy to read and well phrased?

You will also run a small **content safety check** with adversarial prompts and document what happened.

## Step-by-step
### Step 1: Understand the evaluation metrics
Before running tools, make sure your team can explain the four metrics.

- **Groundedness**: A grounded answer uses only what the source material supports.  
  Example weak case: the assistant invents a scholarship deadline not found in the FAQ.
- **Relevance**: A relevant answer addresses the user’s real question.  
  Example weak case: the assistant answers about housing when the question was about registration.
- **Coherence**: A coherent answer is logically structured and not self-contradictory.  
  Example weak case: the answer says both “yes” and “no” in different sections.
- **Fluency**: A fluent answer reads naturally and clearly.  
  Example weak case: the response is awkward, repetitive, or hard to follow.

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

### Step 5: Review results in the AI Foundry Evaluation dashboard
Open the Evaluation dashboard in AI Foundry and inspect your results.

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

## Learning Resources
- [Azure AI evaluation concepts](https://learn.microsoft.com/azure/ai-foundry/concepts/evaluation)
- [Evaluate generative AI apps in Azure AI Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/evaluate-generative-ai-app)
- [Responsible AI guidance for Azure AI](https://learn.microsoft.com/azure/ai-foundry/responsible-use-of-ai-overview)
- [Azure AI Content Safety overview](https://learn.microsoft.com/azure/ai-services/content-safety/overview)

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
