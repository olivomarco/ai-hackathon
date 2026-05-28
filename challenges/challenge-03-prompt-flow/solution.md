# Challenge 03: Prompt Flow — Coach's Guide

## Overview
This challenge helps students move from a single prompt to a structured AI workflow. The goal is not just to make the University Q&A Assistant longer or more complex, but to make it more deliberate: classify the question, route it, answer it, then normalize the final tone.

A strong team outcome is a flow with at least three nodes and clear separation of responsibilities. Students should see why orchestration matters when one assistant needs to handle different question types without relying on one overloaded system prompt.

## Common Issues
- **Connection or deployment errors**: Students often think the prompt is broken when the real problem is a missing or incorrect model connection.
- **Node input mapping mistakes**: Outputs from one node may not be wired into the next node correctly.
- **Classifier drift**: The classification node returns extra words instead of only one label.
- **Overusing LLM nodes**: Some teams use an LLM where a Python node would be safer and more deterministic.
- **Weak final formatting step**: The assistant answers correctly but loses a consistent university tone.

If teams are stuck in the UI, demo a minimal working flow first: input → classify → format. Once they see one working path, they usually understand how to extend it.

## Coaching Tips
Use prompts like:

- “What should be deterministic here, and what should remain generative?”
- “Can you test the classifier by itself before debugging the whole flow?”
- “What exact value is coming out of this node?”
- “If the classification is wrong, where does that error show up downstream?”
- “Does your final node improve consistency, or just repeat the answer?”

When evaluating flow quality, look for clear node boundaries, reliable category outputs, and visible improvement over a single-prompt design. Good flows make reasoning about failures easier.

## Timing
- **0–15 minutes**: Open Prompt Flow, create inputs, build first node
- **15–35 minutes**: Add classification and routing logic
- **35–60 minutes**: Add answer and formatting nodes
- **60–90 minutes**: Test with varied questions, debug mappings, export YAML

This is a UI-heavy challenge, so budget extra time for navigation, node configuration, and retries.

## Expected Questions
- **“Why not do everything in one big prompt?”**  
  Because orchestration makes the system easier to control, test, and improve step by step.

- **“When should we use Python instead of an LLM?”**  
  Use Python for deterministic tasks like routing, normalization, or fallback logic.

- **“What makes a good flow here?”**  
  Correct classification, reliable handoff between nodes, and a final response that feels consistent and student-friendly.
