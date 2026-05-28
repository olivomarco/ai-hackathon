---
title: "Challenge 04 Coach Notes: RAG: Grounding with Your Data"
parent: Challenges
nav_order: 104
nav_exclude: true
search_exclude: false
---

<div class="hero-panel challenge-hero">
  <span class="hero-kicker">Challenge 04 • Coach Notes</span>
  <h1>RAG: Grounding with Your Data — Coach View</h1>
  <p class="hero-tagline">Reference answer key, expected blockers, and timing for coaches running this challenge. Not visible to students from the main navigation.</p>
</div>

<div class="callout-warning" markdown="1">
**Coaches only.** Students get more out of the challenge when they discover the path themselves. Use these notes to unblock teams, not to dictate solutions.
</div>

## Overview

This challenge is where the University Q&A Assistant becomes meaningfully grounded. Students should understand the core architecture: retrieve relevant content first, then generate an answer that uses the retrieved evidence.

Keep teams focused on two separate quality questions: **Did the system retrieve the right material?** and **Did the model answer well using that material?** A weak answer can come from either stage.

## Common Issues

- **Indexing failures**: Uploads may succeed but indexing or embedding steps fail later.
- **Wrong field mappings**: The searchable content field or metadata field may not be configured as expected.
- **Chunking too large**: Retrieval brings back broad, unfocused passages.
- **Chunking too small**: Important context gets fragmented and answers lose completeness.
- **Confusing retrieval quality with answer quality**: Students may blame the model when the wrong chunks were retrieved.
- **No citation discipline**: The answer sounds good but does not show where information came from.

A useful explanation is the **librarian analogy**: RAG does not make the model smarter by itself; it gives the model access to the right shelf before it answers.

## Coaching Tips

Guide with questions like:

- "What document chunk would you hope the system retrieves for this question?"
- "Is the retrieval step actually finding the best source?"
- "Are your citations pointing to the documents you expected?"
- "Did RAG make the answer more specific, or just longer?"
- "If the model is wrong, was the evidence wrong or was the answer synthesis weak?"

When evaluating quality, separate:

1. retrieval relevance
2. faithfulness to the source
3. clarity of the final response

If a team is stuck, demo one grounded answer in the Playground before asking them to wire it into Prompt Flow.

## Timing

- **0–20 minutes**: Create or connect Azure AI Search, upload data
- **20–40 minutes**: Configure chunking and indexing
- **40–60 minutes**: Test grounded chat in Playground
- **60–90 minutes**: Extend Prompt Flow, compare RAG vs non-RAG, save artifacts

This challenge often runs long because indexing and first-time setup can be slow.

## Expected Questions

- **"How do we explain RAG simply?"**  
  It is like asking a librarian for the right pages before the assistant writes its answer.

- **"Should we optimize chunking immediately?"**  
  No. Start with a reasonable baseline, test retrieval, then tune only if the failure pattern is clear.

- **"What matters more: citations or answer style?"**  
  In this challenge, groundedness matters first. A plain answer with correct citations is stronger than a polished but unsupported answer.

<nav class="page-nav">
  <a href="{{ '/coach-hub' | relative_url }}">← Back to Coach Hub</a>
  <a href="{{ '/challenges/challenge-04' | relative_url }}">Student page →</a>
</nav>
