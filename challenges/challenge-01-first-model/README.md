# Challenge 01: Your First Model Deployment

## Introduction
A model deployment is how you make a model available for real use in your project. In Azure AI Foundry, deployment turns a catalog choice into something your playgrounds, apps, and SDK code can call.

As you explore the catalog, you will notice two common deployment ideas:

- **Models-as-a-Service (MaaS)**: Microsoft hosts and manages the serving experience for you.
- **Models-as-a-Platform (MaaP)**: You deploy the model into your Azure environment with more platform-level control.

For this challenge, you will focus on a simple first deployment so you can move quickly from portal testing to code.

## Description
You will deploy a GPT model, test it in the Playground, and then call it from Python using the Azure AI Inference SDK. After that, you will compare it with a second model to notice differences in response style, speed, and detail.

## Step-by-step
### Step 1: Open Deployments in Azure AI Foundry
Inside your project, open the **Deployments** area. Review any existing deployments so you understand whether your team is starting from scratch or reusing approved event resources.

### Step 2: Deploy GPT-4o-mini
1. Open the **Model catalog** or **Deployments** flow.
2. Find **GPT-4o-mini**.
3. Choose the deployment option that uses **Models-as-a-Service**.
4. Give the deployment a clear name, such as `gpt-4o-mini-chat`.
5. Start the deployment and wait until the status changes to **Succeeded** or **Ready**.

As you deploy, note which model family you chose, what pricing or quota information is shown, and how Azure AI Foundry explains the deployment option.

### Step 3: Test in the Playground
Open **Chat Playground** and select your deployment.

Try a custom system prompt such as:

```text
You are a concise technical tutor. Explain concepts using simple language and one practical example.
```

Then send a few user prompts:

- “What is retrieval-augmented generation?”
- “Explain the difference between an API and an SDK.”
- “Give me a 3-bullet summary of Azure AI Foundry.”

Notice how the system prompt changes tone and structure.

### Step 4: Create your Python file
Create a file named:

```text
challenges/challenge-01-first-model/solution.py
```

You will use it to call your deployed model programmatically.

### Step 5: Call the model with `azure-ai-inference`
Install the SDK if needed:

```bash
pip install azure-ai-inference
```

Use this starter code and fill in the missing pieces:

```python
import os
from azure.ai.inference import ChatCompletionsClient
from azure.ai.inference.models import SystemMessage, UserMessage
from azure.core.credentials import AzureKeyCredential
from dotenv import load_dotenv

load_dotenv()

# TODO: Get your endpoint and key from AI Foundry
endpoint = os.getenv("AZURE_AI_ENDPOINT")
key = os.getenv("AZURE_AI_KEY")

client = ChatCompletionsClient(endpoint=endpoint, credential=AzureKeyCredential(key))

# TODO: Send a message and print the response
```

A completed version will usually:

1. Load the endpoint and key from environment variables
2. Send a list of messages including a system message and a user message
3. Print the first response choice to the terminal

Store secrets outside your code. A `.env` file can be helpful during development, but do not commit credentials.

### Step 6: Compare a second model
Deploy or inspect a second model such as **GPT-4o** or **Phi-4**.

Run the same prompt against both models and compare:

- How detailed is the answer?
- How fast does it respond?
- Does the tone feel different?
- Which model feels more suitable for your future hackathon app?

## Success Criteria
- [ ] GPT-4o-mini deployed and visible in Deployments tab
- [ ] Playground test with a custom system prompt completed
- [ ] Python script calls the model and prints a response
- [ ] Two models compared (note differences in style/verbosity)

## Learning Resources
- [Deploy models in Azure AI Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/deploy-models-openai)
- [Azure AI Foundry model catalog overview](https://learn.microsoft.com/azure/ai-foundry/how-to/model-catalog-overview)
- [Azure AI Inference SDK for Python](https://learn.microsoft.com/python/api/overview/azure/ai-inference-readme)
- [Use chat playground in Azure AI Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/playgrounds)

## Tips
- The endpoint URL and API key are available from your deployment or connected resource details in Azure AI Foundry.
- If your script fails immediately, print whether `AZURE_AI_ENDPOINT` and `AZURE_AI_KEY` are set before debugging anything deeper.
- Make sure you use the inference endpoint format expected by the SDK, not a random portal URL.
- Keep your first script simple. One request and one printed response is enough.

## Advanced Challenges (Optional)
If you finish early:

- Add streaming output so the response appears token by token.
- Measure prompt and completion token usage if your chosen SDK response includes it.
- Compare one prompt across three models and document trade-offs in cost, speed, and quality.
