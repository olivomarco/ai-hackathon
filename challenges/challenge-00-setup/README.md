# Challenge 00: Setup & Orientation

## Introduction
Azure AI Foundry gives you one place to explore models, connect resources, evaluate outputs, and move from experiments to real applications. In this hackathon, you will use it as your home base while you progress from simple prompting to grounded, production-ready AI solutions.

This first challenge is about removing friction early. By the end, your team will have a working Azure AI Foundry hub and project, a connected Azure OpenAI resource, and a verified development environment. That means later challenges can focus on building instead of troubleshooting setup.

## Description
In this challenge, you will:

- Open the repository in GitHub Codespaces or a local devcontainer
- Sign in to Azure from your development environment
- Create an Azure AI Foundry hub
- Create a project inside that hub
- Connect an Azure OpenAI Service resource to your project
- Explore the Azure AI Foundry studio, including the model catalog
- Run the environment validation script to confirm everything is ready

## Step-by-step
### Step 1: Open the repository in GitHub Codespaces or a devcontainer
Use the **Open in GitHub Codespaces** button from the root `README.md`, or open the repository locally in VS Code with the Dev Containers extension.

When the environment finishes building, open a terminal and confirm Python and Azure CLI are available:

```bash
python --version
az --version
```

If you are using Codespaces, give the devcontainer a minute to finish post-create tasks before moving on.

### Step 2: Authenticate with Azure
In the terminal, run:

```bash
az login
```

Follow the browser-based sign-in flow. If you have access to more than one Azure subscription, list them and set the correct one for the event:

```bash
az account list --output table
az account set --subscription "<your-subscription-name-or-id>"
```

Tip: Double-check that your selected subscription is the one where you are allowed to create Azure AI resources.

### Step 3: Create an Azure AI Foundry hub
1. Go to the [Azure AI Foundry portal](https://ai.azure.com/).
2. Select **Create new** and choose **Hub**.
3. Pick your Azure subscription and resource group.
4. Enter a unique hub name.
5. Choose a supported region.
6. Review the settings and create the hub.

The exact portal screens can vary slightly by tenant, region, or product updates, so follow the labels above rather than relying on screenshots.

Wait for deployment to finish before continuing.

### Step 4: Create an AI Foundry project inside the hub
Once your hub is ready:

1. Open the hub in Azure AI Foundry.
2. Select **Create project**.
3. Give the project a clear name such as `northfield-wth-team01`.
4. Confirm that the project is linked to the hub you just created.
5. Open the project dashboard.

The hub is the shared management layer. The project is your working space for experiments, deployments, and evaluations.

### Step 5: Connect an Azure OpenAI Service resource
Inside your project:

1. Open **Management center** or **Connected resources**.
2. Choose **Connect resource**.
3. Select your Azure OpenAI Service resource.
4. Confirm the subscription, resource group, and region.
5. Finish the connection flow.

If you do not already have an Azure OpenAI resource, ask your coach which shared resource or approved region you should use.

### Step 6: Browse the Model Catalog
Now explore what is available:

1. Open **Model catalog**.
2. Browse at least three models.
3. Open each model card and note the provider, capabilities, and context window.
4. Compare at least one GPT family model with another family such as Phi.

You do not need to deploy anything yet. The goal is to understand how Azure AI Foundry presents model options before you start building.

### Step 7: Validate your environment
Back in the terminal, run:

```bash
python resources/scripts/validate-environment.py
```

A successful run should confirm that your Python environment, Azure authentication, and required tooling are available. If something fails, read the output carefully and fix one issue at a time.

## Success Criteria
- [ ] Azure AI Foundry hub created
- [ ] Project created and linked to hub
- [ ] Azure OpenAI resource connected
- [ ] Model catalog explored (at least 3 models viewed)
- [ ] Environment validation script passes

## Learning Resources
- [Azure AI Foundry documentation](https://learn.microsoft.com/azure/ai-foundry/)
- [Create and manage hubs and projects in Azure AI Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/create-projects)
- [Azure OpenAI in Azure AI Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/deploy-models-openai)
- [Model catalog in Azure AI Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/model-catalog-overview)
- [Azure CLI sign-in documentation](https://learn.microsoft.com/cli/azure/authenticate-azure-cli)

## Tips
- If the portal shows the wrong subscription, switch it before creating anything.
- Region matters. Some model or resource options only appear in supported regions.
- If you can see the hub but cannot create a project, check your role assignment or ask a coach to confirm permissions.
- When something fails, capture the exact error message before trying random fixes.

## Advanced Challenges (Optional)
If you finish early:

- Explore additional model families in the model catalog and note when you might choose each one.
- Compare model cards for latency, cost, and capability trade-offs.
- Investigate what shared resources your hub can support beyond Azure OpenAI.
