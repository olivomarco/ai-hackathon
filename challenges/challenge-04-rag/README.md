# Challenge 04: RAG — Retrieval-Augmented Generation

## Introduction
Large language models are powerful, but they do not automatically know your university’s current policies, deadlines, or support details. Without grounding, they may answer confidently with incomplete or invented information.

**Retrieval-Augmented Generation (RAG)** improves this by retrieving relevant documents first and then asking the model to answer using that evidence. Think of it as giving your assistant a searchable university knowledge base before it speaks.

In this challenge, you will upgrade the **University Q&A Assistant** so it can answer questions using the **Northfield University FAQ corpus** stored in `resources/sample-data/university-faq/`.

## What you'll build
You will build a grounded Q&A experience that:

1. Indexes the Northfield University FAQ documents in **Azure AI Search**
2. Tests retrieval using **Use your data** in Azure AI Foundry
3. Extends your Prompt Flow from Challenge 03 with a retrieval step
4. Produces answers with source citations

The outcome should feel more trustworthy than the earlier assistant because answers are based on specific retrieved documents instead of prompt instructions alone.

## Step-by-step
### Step 1: Create an Azure AI Search service
If your team does not already have one, create an **Azure AI Search** service in an approved region for the event.

Before moving on, verify:

- the service exists
- your AI Foundry project can connect to it
- the pricing tier matches the hackathon guidance

### Step 2: Open “Add your data” in Azure AI Foundry
Inside AI Foundry, navigate to the feature used to connect data for grounded chat experiences. Look for **Add your data** or the equivalent data connection workflow in your environment.

The goal is to link documents, chunk them, and build an index the assistant can search.

### Step 3: Upload the university FAQ corpus
Upload the documents from:

```text
resources/sample-data/university-faq/
```

This corpus includes topics such as admissions, financial aid, housing, academic programs, registration, and student support.

Encourage your team to inspect the files first so you understand what the assistant should and should not be able to answer.

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

- “What documents are required for financial aid?”
- “What should international students do before orientation?”
- “How do I contact campus housing?”

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
Take at least three questions and compare the assistant’s answer:

- **without RAG** — using your earlier flow or playground prompt
- **with RAG** — using retrieved FAQ content

Document what improved. Focus on specificity, groundedness, and citation quality.

### Step 9: Save the updated flow
Save the updated flow YAML to:

```text
challenges/challenge-04-rag/rag-flow.dag.yaml
```

## Success Criteria
- [ ] Azure AI Search index created with university FAQ documents
- [ ] Playground “Use your data” test passes with grounded answers
- [ ] Prompt Flow extended with a retrieval node or retrieval step
- [ ] At least 3 questions answered with citations from source documents
- [ ] RAG vs non-RAG comparison documented

## Learning Resources
- [Retrieval-augmented generation (RAG) in Azure AI Foundry](https://learn.microsoft.com/azure/ai-foundry/concepts/retrieval-augmented-generation)
- [Azure AI Search overview](https://learn.microsoft.com/azure/search/search-what-is-azure-search)
- [Use your data in Azure AI Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/connections-add-data)
- [Grounded generation patterns with Azure AI Search](https://learn.microsoft.com/training/paths/develop-generative-ai-solutions-azure-ai-foundry/)

## Tips
- **Chunk size trade-offs**: larger chunks preserve context, smaller chunks can improve retrieval precision.
- **Semantic vs keyword search**: keyword search is simpler, while semantic or hybrid options often improve relevance for natural-language questions.
- **Citation formatting**: answers are more useful when students can see where information came from.
- Review the source documents when retrieval seems wrong; sometimes the issue is the data, not the model.
- RAG improves trust when it clearly separates “what the documents say” from “what the model infers.”

## Advanced
If you finish early:

- Try **hybrid search** that combines vector and keyword retrieval
- Experiment with **re-ranking** to improve which chunks reach the model
- Design a **multi-index routing** idea for future scenarios like admissions vs student services vs academic policies
