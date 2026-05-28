# Challenge 00: Setup & Orientation

## Introduction
Microsoft Foundry (the platform previously called Azure AI Foundry) gives you one place to explore models, connect resources, evaluate outputs, and move from experiments to real applications. In this hackathon, you will use it as your home base while you progress from simple prompting to grounded, production-ready AI solutions.

This first challenge is about removing friction early. By the end, your team will have a working Microsoft Foundry project, access to deployed AI models, and a verified development environment. That means later challenges can focus on building instead of troubleshooting setup.

## Description
In this challenge, you will:

- Open the repository in GitHub Codespaces or a local devcontainer
- Sign in to Azure from your development environment
- Create a Microsoft Foundry project
- Explore the Microsoft Foundry portal, including the model catalog
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

### Step 3: Create a Microsoft Foundry project
The new Microsoft Foundry portal uses a **Foundry resource + project** model. When you create a project, the portal automatically provisions the underlying Foundry resource for you. There is no separate "hub" creation step in the new portal.

1. Go to the [Microsoft Foundry portal](https://ai.azure.com/).
2. Make sure the **New Foundry** toggle is **on** (upper-right area). These steps use the current Foundry experience.
3. In the upper-left corner, select the project name dropdown and choose **Create new project**.
4. Enter a project name such as `northfield-wth-team01`.
5. Optionally, choose or create a resource group and select a supported region.
6. Select **Create project** and wait for the portal to finish provisioning.

> **Note:** If your event organiser has set up a pre-existing Foundry resource or hub-based environment, they will give you specific instructions. Hub-based projects from the earlier Azure AI Foundry experience are still accessible via the **Foundry (classic)** portal (toggle the New Foundry switch off). New hackathon setups should use the current experience above.

### Step 4: Verify your project settings
Once your project is ready:

1. Open the project dashboard in the Foundry portal.
2. On the **Home** page, note the **project endpoint** (it looks like `https://<resource>.services.ai.azure.com/api/projects/<project>`). Copy this value; you will need it when configuring your environment variables.
3. Azure OpenAI model access is built into your Foundry resource. You do not need to separately attach an Azure OpenAI Service resource in the new portal.

### Step 5: Browse the Model Catalog
Now explore what is available:

1. In the Foundry portal, select **Discover** in the upper-right navigation.
2. Select **Models** in the left pane to open the model catalog.
3. Browse at least three models.
4. Open each model card and note the provider, capabilities, and context window.
5. Compare at least one GPT family model with another family such as Phi.

You do not need to deploy anything yet. The goal is to understand how Microsoft Foundry presents model options before you start building.

### Step 6: Validate your environment
Back in the terminal, run:

```bash
python resources/scripts/validate-environment.py
```

A successful run should confirm that your Python environment, Azure authentication, and required tooling are available. If something fails, read the output carefully and fix one issue at a time.

## Success Criteria
- [ ] Microsoft Foundry project created
- [ ] Project endpoint noted from the Foundry portal home page
- [ ] Model catalog explored (at least 3 models viewed via Discover → Models)
- [ ] Environment validation script passes

## Learning Resources
- [Microsoft Foundry documentation](https://learn.microsoft.com/azure/ai-foundry/)
- [Create a Foundry project](https://learn.microsoft.com/azure/ai-foundry/how-to/create-projects)
- [Deploy models in Microsoft Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/deploy-models-openai)
- [Microsoft Foundry Models overview](https://learn.microsoft.com/azure/ai-foundry/concepts/foundry-models-overview)
- [Azure CLI sign-in documentation](https://learn.microsoft.com/cli/azure/authenticate-azure-cli)

## Tips
- If the portal shows the wrong subscription, switch it before creating anything.
- Region matters. Some model options only appear in supported regions.
- If you cannot create a project, check your role assignment (you need **Foundry Owner** or **Foundry Account Owner**) or ask a coach to confirm permissions.
- When something fails, capture the exact error message before trying random fixes.
- Copy your project endpoint from the Foundry portal home page; you will need it in later challenges.

## Advanced Challenges (Optional)
If you finish early:

- Explore additional model families in the model catalog and note when you might choose each one.
- Compare model cards for latency, cost, and capability trade-offs.
- Review the **Operate → Admin** panel to understand how multiple projects can share one Foundry resource.
