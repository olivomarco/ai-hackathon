# Challenge 01: Your First Model Deployment

## Introduction
A model deployment is how you make a model available for real use in your project. In Microsoft Foundry, deployment turns a catalog choice into something your playgrounds, apps, and SDK code can call.

As you explore the catalog, you will notice two common deployment ideas:

- **Models-as-a-Service (MaaS)**: Microsoft hosts and manages the serving experience for you.
- **Models-as-a-Platform (MaaP)**: You deploy the model into your Azure environment with more platform-level control.

For this challenge, you will focus on a simple first deployment so you can move quickly from portal testing to code.

## Description
You will deploy a GPT model, test it in the Playground, and then call it from Python using the Azure AI Inference SDK. After that, you will compare it with a second model to notice differences in response style, speed, and detail.

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

- “What is retrieval-augmented generation?”
- “Explain the difference between an API and an SDK.”
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

## Learning Resources
- [Deploy models in Microsoft Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/deploy-models-openai)
- [Microsoft Foundry model catalog overview](https://learn.microsoft.com/azure/ai-foundry/how-to/model-catalog-overview)
- [Azure AI Projects SDK for Python](https://learn.microsoft.com/python/api/overview/azure/ai-projects-readme)
- [Azure AI Inference SDK for Python](https://learn.microsoft.com/python/api/overview/azure/ai-inference-readme)
- [Use chat playground in Microsoft Foundry](https://learn.microsoft.com/azure/ai-foundry/concepts/concept-playgrounds)

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
