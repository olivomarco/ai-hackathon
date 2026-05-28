---
title: "Challenge 00: Setup & Orientation"
parent: Challenges
nav_order: 1
---

<div class="hero-panel challenge-hero">
  <span class="hero-kicker">Challenge 00 • Foundation</span>
  <h1>Setup &amp; Orientation</h1>
  <p class="hero-tagline">Start by making the environment boring, in the best possible way. This challenge introduces Microsoft Foundry, shows how a Foundry resource and project fit together, and gets every team into a working devcontainer so the rest of the day can focus on building instead of fixing setup.</p>
  <div class="meta-strip">
    <span class="meta-badge">⏱️ 30 min</span>
    <span class="difficulty-badge difficulty-1">⭐ Beginner</span>
    <span class="meta-badge">🧭 Foundry basics</span>
  </div>
</div>

## What this challenge is about

Microsoft Foundry is the control room for the hackathon: it is where you organize resources, browse models, run playground experiments, and eventually evaluate and deploy your app. In this first stop, participants build the mental model for how a **Foundry resource** provides shared infrastructure and how a **Project** becomes the team's day-to-day workspace.

The other half of the challenge is environment confidence. The devcontainer and Azure CLI setup matter because they remove machine drift, package mismatches, and authentication surprises before later challenges depend on Python code, SDKs, and Azure resources.

## What participants will build

<div class="quick-grid">
  <div class="quick-card">
    <h3>A ready-to-use Foundry workspace</h3>
    <p>A Foundry project with auto-provisioned resources so the team has a clean starting point for the rest of the hackathon.</p>
  </div>
  <div class="quick-card">
    <h3>A reliable dev environment</h3>
    <p>A Codespaces or local devcontainer setup with Python and Azure CLI working the same way for every participant.</p>
  </div>
  <div class="quick-card">
    <h3>A shared vocabulary</h3>
    <p>A practical understanding of the model catalog, project boundaries, and how portal work connects to code.</p>
  </div>
</div>

## Key concepts

<div class="callout-info" markdown="1">
- **Foundry resource**: the Azure resource that provides shared infrastructure, networking, and RBAC for all projects within it.
- **Project**: the working space where participants deploy models, test prompts, run evaluations, and manage files.
- **Model Catalog**: the marketplace-style view of available models, capabilities, providers, and deployment options.
- **Devcontainer**: the reproducible developer environment that gives every participant the same tooling and dependencies.
- **Azure CLI**: the command-line bridge for signing in, selecting subscriptions, and validating Azure access from code.
</div>

## Learn before you build

- [Microsoft Foundry documentation](https://learn.microsoft.com/azure/ai-foundry/): official starting point for the platform.
- [Create projects in Microsoft Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/create-projects): explains project setup and required roles.
- [Model catalog overview](https://learn.microsoft.com/azure/ai-foundry/how-to/model-catalog-overview): understand what you can browse and deploy.
- [Authenticate to Azure using Azure CLI](https://learn.microsoft.com/cli/azure/authenticate-azure-cli): quick guide for sign-in and subscription selection.

<div class="callout-info" markdown="1">
**Working in Codespaces?** The scripts and starter files for this challenge live in `challenges/challenge-00-setup/` inside the repository. Open the repo in Codespaces (button in the page header), navigate to that folder, and run the commands shown below from there.
</div>

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

Double-check that your selected subscription is the one where you are allowed to create Azure AI resources.

### Step 3: Create a Microsoft Foundry project

The new Microsoft Foundry portal uses a **Foundry resource + project** model. When you create a project, the portal automatically provisions the underlying Foundry resource for you. There is no separate "hub" creation step in the new portal.

1. Go to the [Microsoft Foundry portal](https://ai.azure.com/).
2. Make sure the **New Foundry** toggle is **on** (upper-right area). These steps use the current Foundry experience.
3. In the upper-left corner, select the project name dropdown and choose **Create new project**.
4. Enter a project name such as `northfield-wth-team01`.
5. Optionally, choose or create a resource group and select a supported region.
6. Select **Create project** and wait for the portal to finish provisioning.

<div class="callout-warning" markdown="1">
If your event organiser has set up a pre-existing Foundry resource or hub-based environment, they will give you specific instructions. Hub-based projects from the earlier Azure AI Foundry experience are still accessible via the **Foundry (classic)** portal (toggle the New Foundry switch off). New hackathon setups should use the current experience above.
</div>

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

<nav class="page-nav">
  <a href="{{ '/challenges/' | relative_url }}">← Previous</a>
  <a href="{{ '/challenges/challenge-01' | relative_url }}">Next →</a>
</nav>
