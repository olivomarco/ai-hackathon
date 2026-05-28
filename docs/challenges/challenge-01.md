---
title: "Challenge 01: First Model Deployment"
parent: Challenges
nav_order: 2
---

<div class="hero-panel challenge-hero">
  <span class="hero-kicker">Challenge 01 • First live model</span>
  <h1>First Model Deployment</h1>
  <p class="hero-tagline">This is the moment the catalog turns into something real. Participants deploy a model, test it in the Playground, and make their first authenticated SDK call so they can see the full path from portal experiment to application code.</p>
  <div class="meta-strip">
    <span class="meta-badge">⏱️ 45 min</span>
    <span class="difficulty-badge difficulty-1">⭐ Beginner</span>
    <span class="meta-badge">🚀 Deployment + code</span>
  </div>
</div>

## What this challenge is about

A model deployment is what makes a catalog choice usable. Instead of reading model cards in the abstract, participants provision an endpoint that playgrounds and code can call, then compare how deployment choices affect speed, control, and developer experience.

This page also introduces the useful distinction between **Models-as-a-Service (MaaS)** and **Models-as-a-Platform (MaaP)**. Teams do not need to master every hosting option yet, but they should leave knowing when they are using a Microsoft-managed serving path versus a deployment they manage more directly inside Azure.

## What participants will build

<div class="quick-grid">
  <div class="quick-card">
    <h3>A working model deployment</h3>
    <p>A live model inside the project that can be selected in the Playground and reached from code.</p>
  </div>
  <div class="quick-card">
    <h3>A tested playground prompt</h3>
    <p>A quick interactive experiment that shows how system instructions shape the model’s tone and structure.</p>
  </div>
  <div class="quick-card">
    <h3>A first Python inference call</h3>
    <p>A small script that authenticates, sends messages, and prints the response from the deployed model endpoint.</p>
  </div>
</div>

## Key concepts

<div class="callout-info" markdown="1">
- **Deployment**: the runnable instance of a model that exposes an endpoint for playgrounds, apps, and SDKs.
- **MaaS**: a faster, service-style deployment path where Microsoft manages the serving layer for you.
- **MaaP**: a more platform-shaped deployment model with more control over how the model runs in your Azure environment.
- **Playground**: the fastest place to test prompts, tune behavior, and inspect output before writing application code.
- **`azure-ai-projects` SDK**: the primary Python client library for Microsoft Foundry; use `AIProjectClient` + `.get_openai_client()` to reach deployed models via the Responses API. (The `azure-ai-inference` `ChatCompletionsClient` remains available for inference-only scenarios but `azure-ai-projects` is the recommended path.)
- **Endpoint**: the project endpoint URL your script or app uses to connect to all Foundry resources.
</div>

## Learn before you build

- [Deploy models in Microsoft Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/deploy-models-openai): deployment concepts and portal flow.
- [Model catalog overview](https://learn.microsoft.com/azure/ai-foundry/how-to/model-catalog-overview): compare model families and deployment paths.
- [Azure AI Projects SDK for Python](https://learn.microsoft.com/python/api/overview/azure/ai-projects-readme): primary SDK for Microsoft Foundry; covers `AIProjectClient` and `get_openai_client()`.
- [Azure AI Inference SDK for Python](https://learn.microsoft.com/python/api/overview/azure/ai-inference-readme): inference-only client (still supported, still beta).
- [Use playgrounds in Microsoft Foundry](https://learn.microsoft.com/azure/ai-foundry/quickstarts/get-started-playground): quick path for interactive testing.

<div class="callout-info" markdown="1">
**Working in Codespaces?** The scripts and starter files for this challenge live in `challenges/challenge-01-first-model/` inside the repository. Open the repo in Codespaces (button in the page header), navigate to that folder, and run the commands shown below from there.
</div>

## Step-by-step

### Step 1: Open Deployments in Microsoft Foundry

Inside your project, select **Build** in the upper-right navigation, then **Models** in the left pane to see your deployments. Review any existing deployments so you understand whether your team is starting from scratch or reusing approved event resources.

### Step 2: Deploy gpt-4.1-mini

1. In the Foundry portal, select **Discover** in the upper-right navigation, then **Models** in the left pane.
2. Search for **gpt-4.1-mini** (Microsoft's current recommended fast, low-cost model for hackathons).
3. Select the model card and choose **Deploy**.
4. Give the deployment a clear name, such as `gpt-4-1-mini-chat`.
5. Start the deployment and wait until the status changes to **Succeeded** or **Ready**.

As you deploy, note which model family you chose, what pricing or quota information is shown, and how Microsoft Foundry explains the deployment option.

### Step 3: Test in the Playground

Open **Chat Playground** and select your deployment.

Try a custom system prompt such as:

```text
You are a concise technical tutor. Explain concepts using simple language and one practical example.
```

Then send a few user prompts:

- "What is retrieval-augmented generation?"
- "Explain the difference between an API and an SDK."
- "Give me a 3-bullet summary of Microsoft Foundry."

Notice how the system prompt changes tone and structure.

### Step 4: Create your Python file

Create a file named:

```text
challenges/challenge-01-first-model/solution.py
```

You will use it to call your deployed model programmatically.

### Step 5: Call the model with `azure-ai-projects`

Install the SDK if needed:

```bash
pip install azure-ai-projects>=2.0.0
```

Use this starter code and fill in the missing pieces:

```python
import os
from azure.ai.projects import AIProjectClient
from azure.identity import DefaultAzureCredential
from dotenv import load_dotenv

load_dotenv()

# TODO: Get your project endpoint from the Foundry portal home page
project = AIProjectClient(
    endpoint=os.environ["FOUNDRY_PROJECT_ENDPOINT"],
    credential=DefaultAzureCredential(),
)
openai = project.get_openai_client()

# TODO: Send a message and print the response
# Hint: use openai.responses.create(model=..., input=...)
```

A completed version will usually:

1. Load the project endpoint from the `FOUNDRY_PROJECT_ENDPOINT` environment variable
2. Authenticate using `DefaultAzureCredential` (which picks up your `az login` session automatically)
3. Create an OpenAI client via `project.get_openai_client()`
4. Send a request using `openai.responses.create(model=<deployment-name>, input=<your prompt>)`
5. Print `response.output_text` to the terminal

Store your project endpoint outside your code. A `.env` file can be helpful during development, but do not commit credentials or endpoints.

### Step 6: Compare a second model

Deploy or inspect a second model such as **gpt-4.1** or **Phi-4**.

Run the same prompt against both models and compare:

- How detailed is the answer?
- How fast does it respond?
- Does the tone feel different?
- Which model feels more suitable for your future hackathon app?

## Success Criteria

- [ ] gpt-4.1-mini deployed and visible in Deployments tab
- [ ] Playground test with a custom system prompt completed
- [ ] Python script calls the model and prints a response
- [ ] Two models compared (note differences in style/verbosity)

## Tips

- The endpoint URL and API key are available from your deployment or connected resource details in Microsoft Foundry.
- If your script fails immediately, print whether `FOUNDRY_PROJECT_ENDPOINT` is set before debugging anything deeper.
- Make sure you use the project endpoint format expected by the SDK (`https://<resource>.services.ai.azure.com/api/projects/<project>`), not a random portal URL.
- Keep your first script simple. One request and one printed response is enough.

## Advanced Challenges (Optional)

If you finish early:

- Add streaming output so the response appears token by token.
- Measure prompt and completion token usage if your chosen SDK response includes it.
- Compare one prompt across three models and document trade-offs in cost, speed, and quality.

<nav class="page-nav">
  <a href="{{ '/challenges/challenge-00' | relative_url }}">← Previous</a>
  <a href="{{ '/challenges/challenge-02' | relative_url }}">Next →</a>
</nav>
