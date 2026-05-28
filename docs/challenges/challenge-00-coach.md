---
title: "Challenge 00 Coach Notes: Setup & Orientation"
parent: Challenges
nav_order: 100
nav_exclude: true
search_exclude: false
---

<div class="hero-panel challenge-hero">
  <span class="hero-kicker">Challenge 00 • Coach Notes</span>
  <h1>Setup &amp; Orientation: Coach View</h1>
  <p class="hero-tagline">Reference answer key, expected blockers, and timing for coaches running this challenge. Not visible to students from the main navigation.</p>
</div>

<div class="callout-warning" markdown="1">
**Coaches only.** Students get more out of the challenge when they discover the path themselves. Use these notes to unblock teams, not to dictate solutions.
</div>

## Overview

Students should leave this challenge with a stable working environment and a clear mental model of how Microsoft Foundry is organised. The core outcomes are: devcontainer running, Azure sign-in completed, Foundry project created, project endpoint noted, and basic familiarity with the studio interface.

This challenge sets the pace for the day. If teams get stuck here, later technical challenges slow down quickly, so coaches should prioritise removing subscription, permission, and region blockers early.

## Step-by-Step Solution

1. Confirm the team opened the repo in Codespaces or a devcontainer and can run `python --version` and `az --version`.
2. Have them run `az login` and verify the active subscription with `az account show --output table`.
3. In the Microsoft Foundry portal (ai.azure.com), make sure the **New Foundry** toggle is **on**. Guide them to select the project dropdown in the upper-left and choose **Create new project**. There is no separate hub creation step in the new portal.
4. Once the project is ready, have them copy the **project endpoint** from the Foundry project home page (format: `https://<resource>.services.ai.azure.com/api/projects/<project>`).
5. Ask students to explore the model catalog via **Discover → Models** and inspect at least three model cards.
6. Have them run `python resources/scripts/validate-environment.py` and resolve any failures in order.

A good completion check is to ask one student to show their project endpoint and explain what it represents.

## Common Issues

- **Permission errors while creating a project**: Students may have reader access but not contributor rights. They need **Foundry Owner** or **Foundry Account Owner** on the subscription or resource group. Confirm RBAC before they keep retrying.
- **Wrong subscription selected**: Azure CLI and portal selections do not always match what students expect.
- **Region availability issues**: Some regions may not support the needed model options.
- **"New Foundry" toggle confusion**: If students see the old hub-based layout, they have the toggle switched off. The new experience has no hub creation step.
- **Devcontainer still initialising**: Students sometimes run checks before post-create setup is complete.

## Coaching Tips

Use questions that help students diagnose, not just follow instructions:

- "What subscription is active right now?"
- "What is your project endpoint URL?"
- "Which region did you choose, and why?"
- "What does the error message say exactly?"
- "Can you show me the model catalog in the Discover section?"

If a team is blocked, reduce scope. Get one successful sign-in or one successful resource creation before discussing the full flow again.

## Timing

- **0–10 minutes**: Watch for Codespaces/devcontainer issues.
- **10–15 minutes**: Recommended coach check-in. Confirm Azure sign-in and active subscription.
- **15–25 minutes**: Most teams should be creating the Foundry project.
- **25–30 minutes**: Push teams to run the validation script and document any unresolved blockers.

Intervene quickly if a team is stuck on permissions for more than a few minutes; that is usually not a productive struggle.

### Expected Student Questions

- **"Why don't we need to create a hub anymore?"**  
  The new Microsoft Foundry portal uses a simpler model: a Foundry resource is created automatically when you create your first project. Hub-based projects still work in the classic portal, but new projects use the simpler flow.

- **"Why can't I see the Azure OpenAI resource I expected?"**  
  Ask them to confirm subscription and region. In the new portal, Azure OpenAI capabilities are built into the Foundry resource; they deploy models directly instead of connecting a separate service.

- **"Do we need to deploy a model now?"**  
  Not yet. This challenge is only about setup and orientation.

<nav class="page-nav">
  <a href="{{ '/coach-hub' | relative_url }}">← Back to Coach Hub</a>
  <a href="{{ '/challenges/challenge-00' | relative_url }}">Student page →</a>
</nav>
