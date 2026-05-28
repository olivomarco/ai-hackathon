---
title: "Challenge 04: RAG — Grounding with Your Data"
parent: Challenges
nav_order: 5
---

<div class="hero-panel challenge-hero">
  <span class="hero-kicker">Challenge 04 • Grounded answers</span>
  <h1>RAG — Grounding with Your Data</h1>
  <p class="hero-tagline">This is where the assistant stops guessing from general training alone. Participants add retrieval so answers can be rooted in real documents, cited sources, and searchable knowledge instead of model memory.</p>
  <div class="meta-strip">
    <span class="meta-badge">⏱️ 1.5 hr</span>
    <span class="difficulty-badge difficulty-4">⭐⭐⭐⭐ Advanced</span>
    <span class="meta-badge">📚 Retrieval + generation</span>
  </div>
</div>

## What this challenge is about

Retrieval-Augmented Generation (RAG) combines search with generation. Rather than asking a model to answer from memory, the app first retrieves the most relevant passages from a knowledge source, then asks the model to answer using that evidence.

That architecture matters for trust. In this challenge, teams extend the **University Q&A Assistant** from Challenge 03 with the Northfield University FAQ corpus so answers can stay anchored to real student-support content. With Azure AI Search, embeddings, chunking, and citations working together, participants can build experiences that are more factual, easier to audit, and better aligned to a real university or organizational knowledge base.

## What participants will build

<div class="quick-grid">
  <div class="quick-card">
    <h3>A searchable knowledge layer</h3>
    <p>A document index prepared for semantic or hybrid retrieval so the app can find the right supporting passages.</p>
  </div>
  <div class="quick-card">
    <h3>A grounded Q&amp;A experience</h3>
    <p>A chat or flow that answers questions using retrieved evidence instead of relying on unsupported guesses.</p>
  </div>
  <div class="quick-card">
    <h3>A citation-friendly response pattern</h3>
    <p>An answer style that helps participants inspect where a result came from and whether the evidence actually supports it.</p>
  </div>
</div>

## Key concepts

<div class="callout-info" markdown="1">
- **RAG** — a pattern that retrieves supporting content before generation so the model answers from evidence.
- **Azure AI Search** — the retrieval engine used to store, index, and query your document collection.
- **Embeddings** — vector representations that capture semantic meaning for similarity search.
- **Chunking** — splitting long documents into smaller passages that are easier to index and retrieve well.
- **Grounded answers** — responses that stay anchored to retrieved source material.
- **Citations** — source references that help users verify where an answer came from.
</div>

## Learn before you build

- [Retrieval-augmented generation (RAG) in Microsoft Foundry](https://learn.microsoft.com/azure/ai-foundry/concepts/retrieval-augmented-generation) — end-to-end architecture overview.
- [Azure AI Search overview](https://learn.microsoft.com/azure/search/search-what-is-azure-search) — retrieval service fundamentals.
- [RAG quickstart with Azure AI Search](https://learn.microsoft.com/azure/search/search-get-started-rag) — grounded chat and data-connection workflow.
- [Develop generative AI apps on Microsoft Foundry](https://learn.microsoft.com/training/paths/develop-generative-ai-apps/) — broader Learn path that includes retrieval patterns.

<div class="callout-tip" markdown="1">
Ready to ground the assistant on real data? **Open the full challenge guide on GitHub:** [challenges/challenge-04-rag](https://github.com/olivomarco/ai-hackathon/tree/main/challenges/challenge-04-rag) — or open the repository in Codespaces (badge above) and follow the README in `challenges/challenge-04-rag/`.
</div>

<nav class="page-nav">
  <a href="{{ '/challenges/challenge-03' | relative_url }}">← Previous</a>
  <a href="{{ '/challenges/challenge-05' | relative_url }}">Next →</a>
</nav>
