# Challenge 00: Setup & Orientation — Coach's Guide

## Overview
Students should leave this challenge with a stable working environment and a clear mental model of how Azure AI Foundry is organized. The core outcomes are: devcontainer running, Azure sign-in completed, hub created, project created, Azure OpenAI connected, and basic familiarity with the studio interface.

This challenge sets the pace for the day. If teams get stuck here, later technical challenges slow down quickly, so coaches should prioritize removing subscription, permission, and region blockers early.

## Step-by-Step Solution
1. Confirm the team opened the repo in Codespaces or a devcontainer and can run `python --version` and `az --version`.
2. Have them run `az login` and verify the active subscription with `az account show --output table`.
3. In Azure AI Foundry, guide them to create a **hub** first, not just a project.
4. Once the hub deploys, create a **project** inside the hub and verify the association.
5. Open the project management area and connect an Azure OpenAI resource.
6. Ask students to explore the model catalog and inspect at least three model cards.
7. Have them run `python resources/scripts/validate-environment.py` and resolve any failures in order.

A good completion check is to ask one student to explain the difference between a hub, a project, and a connected resource.

## Common Issues
- **Permission errors while creating a hub or project**: Students may have reader access but not contributor rights. Confirm RBAC before they keep retrying.
- **Wrong subscription selected**: Azure CLI and portal selections do not always match what students expect.
- **Region availability issues**: Some regions may not support the needed Azure OpenAI options.
- **Azure OpenAI approval confusion**: Some students assume the resource can be created instantly everywhere. Remind them to use the approved event setup.
- **Devcontainer still initializing**: Students sometimes run checks before post-create setup is complete.

## Coaching Tips
Use questions that help students diagnose, not just follow instructions:

- “What subscription is active right now?”
- “What resource did you create first: hub or project?”
- “Which region did you choose, and why?”
- “What does the error message say exactly?”
- “Can you show me where the resource connection appears in the project?”

If a team is blocked, reduce scope. Get one successful sign-in or one successful resource creation before discussing the full flow again.

## Timing
- **0–10 minutes**: Watch for Codespaces/devcontainer issues.
- **10–15 minutes**: Recommended coach check-in. Confirm Azure sign-in and active subscription.
- **15–25 minutes**: Most teams should be creating the hub/project.
- **25–30 minutes**: Push teams to run the validation script and document any unresolved blockers.

Intervene quickly if a team is stuck on permissions for more than a few minutes; that is usually not a productive struggle.

### Expected Student Questions
- **“Why do we need both a hub and a project?”**  
  Explain that the hub is the shared management boundary and the project is the working space for the team.

- **“Why can’t I see the Azure OpenAI resource I expected?”**  
  Ask them to confirm subscription, region, and whether the resource already exists in the correct tenant.

- **“Do we need to deploy a model now?”**  
  Not yet. This challenge is only about setup and orientation.
