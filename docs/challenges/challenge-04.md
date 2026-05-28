---
title: "Challenge 04: RAG: Grounding with Your Data"
parent: Challenges
nav_order: 5
---

<div class="hero-panel challenge-hero">
  <span class="hero-kicker">Challenge 04 • Grounded answers</span>
  <h1>RAG: Grounding with Your Data</h1>
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
- **RAG**: a pattern that retrieves supporting content before generation so the model answers from evidence.
- **Azure AI Search**: the retrieval engine used to store, index, and query your document collection.
- **Embeddings**: vector representations that capture semantic meaning for similarity search.
- **Chunking**: splitting long documents into smaller passages that are easier to index and retrieve well.
- **Grounded answers**: responses that stay anchored to retrieved source material.
- **Citations**: source references that help users verify where an answer came from.
</div>

## Learn before you build

- [Retrieval-augmented generation (RAG) in Microsoft Foundry](https://learn.microsoft.com/azure/ai-foundry/concepts/retrieval-augmented-generation): end-to-end architecture overview.
- [Azure AI Search overview](https://learn.microsoft.com/azure/search/search-what-is-azure-search): retrieval service fundamentals.
- [RAG quickstart with Azure AI Search](https://learn.microsoft.com/azure/search/search-get-started-rag): grounded chat and data-connection workflow.
- [Develop generative AI apps on Microsoft Foundry](https://learn.microsoft.com/training/paths/develop-generative-ai-apps/): broader Learn path that includes retrieval patterns.

<div class="callout-info" markdown="1">
**Working in Codespaces?** The scripts and starter files for this challenge live in `challenges/challenge-04-rag/` inside the repository. Open the repo in Codespaces (button in the page header), navigate to that folder, and run the commands shown below from there.
</div>

## Step-by-step

### Step 1: Create an Azure AI Search service

If your team does not already have one, create an **Azure AI Search** service in an approved region for the event.

Before moving on, verify:

- the service exists
- your AI Foundry project can connect to it
- the pricing tier matches the hackathon guidance

### Step 2: Open "Add your data" in Microsoft Foundry

Inside AI Foundry, navigate to the feature used to connect data for grounded chat experiences. Look for **Add your data** or the equivalent data connection workflow in your environment.

The goal is to link documents, chunk them, and build an index the assistant can search.

### Step 3: Upload the university FAQ corpus

Upload the documents from:

```text
resources/sample-data/university-faq/
```

This corpus includes topics such as admissions, financial aid, housing, academic programs, registration, and student support.

Inspect the files first so you understand what the assistant should and should not be able to answer.

### Step 4: Configure chunking strategy

Choose a chunking approach for the documents.

At minimum, discuss:

- chunk size
- overlap
- whether chunks are too broad or too narrow for FAQ-style content

A practical starting point is moderate chunk sizes with some overlap so policy details are not split awkwardly across chunks. If chunks are too large, retrieval may be noisy. If they are too small, the answer may miss key context.

### Step 5: Create a vector index with Azure AI Search

Build the index and confirm the ingestion completes successfully.

Look for evidence that:

- documents were processed
- embeddings were created if your setup requires them
- searchable fields and content mappings make sense

If your environment offers both keyword and semantic or vector options, note which you selected and why.

### Step 6: Test retrieval in the Playground

Open the Playground, enable **Use your data**, and test several questions against the indexed corpus.

Try questions like:

- "What documents are required for financial aid?"
- "What should international students do before orientation?"
- "How do I contact campus housing?"

Inspect whether the answer:

- uses the uploaded documents
- cites relevant sources
- avoids inventing unsupported details

### Step 7: Extend your Prompt Flow from Challenge 03

Update the Prompt Flow so retrieval happens before final answer generation.

A typical pattern is:

1. receive the question
2. retrieve relevant document chunks
3. pass retrieved context plus the question into the answer node
4. format the grounded response

You do not need a perfect enterprise architecture. A clear, working retrieval-to-answer path is enough for this challenge.

### Step 8: Compare answers with and without RAG

Take at least three questions and compare the assistant's answer:

- **without RAG**: using your earlier flow or playground prompt
- **with RAG**: using retrieved FAQ content

Document what improved. Focus on specificity, groundedness, and citation quality.

### Step 9: Save the updated flow

Save the updated flow YAML to:

```text
challenges/challenge-04-rag/rag-flow.dag.yaml
```

## Success Criteria

- [ ] Azure AI Search index created with university FAQ documents
- [ ] Playground "Use your data" test passes with grounded answers
- [ ] Prompt Flow extended with a retrieval node or retrieval step
- [ ] At least 3 questions answered with citations from source documents
- [ ] RAG vs non-RAG comparison documented

## Tips

- **Chunk size trade-offs**: larger chunks preserve context, smaller chunks can improve retrieval precision.
- **Semantic vs keyword search**: keyword search is simpler, while semantic or hybrid options often improve relevance for natural-language questions.
- **Citation formatting**: answers are more useful when students can see where information came from.
- Review the source documents when retrieval seems wrong; sometimes the issue is the data, not the model.
- RAG improves trust when it clearly separates "what the documents say" from "what the model infers."

## Advanced

If you finish early:

- Try **hybrid search** that combines vector and keyword retrieval
- Experiment with **re-ranking** to improve which chunks reach the model
- Design a **multi-index routing** idea for future scenarios like admissions vs student services vs academic policies

<nav class="page-nav">
  <a href="{{ '/challenges/challenge-03' | relative_url }}">← Previous</a>
  <a href="{{ '/challenges/challenge-05' | relative_url }}">Next →</a>
</nav>
