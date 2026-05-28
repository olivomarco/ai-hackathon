# Challenge 01: Your First Model Deployment — Coach's Guide

## Overview
Students should complete their first full platform-to-code loop in this challenge: choose a model, deploy it, test it in the playground, and invoke it from Python. The learning goal is not just “get text back,” but to understand what a deployment is and how an SDK call maps to a resource they created in Azure AI Foundry.

This is also where teams first encounter the difference between a portal interaction and a programmable endpoint, so expect confusion around endpoints, credentials, and deployment readiness.

## Step-by-Step Solution
1. In the project, open **Deployments** and start a deployment for **GPT-4o-mini** using the approved option for the event.
2. In the **Deployments** tab, watch the status until it shows **Succeeded** or **Ready** before debugging code.
3. Open Chat Playground, select the deployment, and test at least one custom system prompt.
4. Have students create `challenges/challenge-01-first-model/solution.py`.
5. Install `azure-ai-inference` if it is not already available.
6. Retrieve the correct endpoint and key from Azure AI Foundry.
7. Create a `ChatCompletionsClient`, send a system message plus a user message, and print the first returned response.
8. Repeat the same prompt with a second model such as GPT-4o or Phi-4 and compare outputs.

The key verification moment is seeing a successful SDK response that matches the same deployment tested in the playground.

## Common Issues
- **Wrong endpoint format**: Students often paste a portal page URL instead of the inference endpoint.
- **Deployment not ready yet**: They start coding before the deployment reaches ready status.
- **Missing environment variables**: `AZURE_AI_ENDPOINT` or `AZURE_AI_KEY` may be unset or copied with extra whitespace.
- **Key vs Azure AD confusion**: If the sample code uses `AzureKeyCredential`, they need the API key path, not a different auth flow.
- **Comparing prompts unfairly**: Students sometimes change both the model and the prompt at once, which makes comparison less useful.

## Coaching Tips
Helpful coaching questions:

- “What exact endpoint are you using?”
- “Is the deployment status ready, or are you testing too early?”
- “What happens if you print just whether the environment variables exist?”
- “Are you changing the model only, or the prompt too?”
- “What did you observe in the playground that you expected to see in code?”

Guide teams to isolate one variable at a time. A lot of confusion disappears once they compare playground success with their SDK request structure.

## Timing
- **0–10 minutes**: Model selection and deployment start
- **10–20 minutes**: Playground testing while deployment finishes
- **20–35 minutes**: Python SDK call implementation
- **35–45 minutes**: Compare a second model and discuss observations

Intervene if a team spends more than 5–7 minutes debugging code before confirming deployment readiness and correct endpoint values.

### Expected Student Questions
- **“What is the difference between MaaS and MaaP here?”**  
  Give a high-level answer: MaaS is the fastest managed route for this challenge; MaaP provides more platform control in other scenarios.

- **“Where do I find the endpoint and key?”**  
  Point them back to deployment or resource details in Azure AI Foundry rather than handing over the exact clicks immediately.

- **“Why does GPT-4o sound different from GPT-4o-mini?”**  
  Encourage them to describe observed trade-offs in detail, speed, and tone instead of assuming one model is simply “better.”
