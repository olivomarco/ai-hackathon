---
title: Coach Hub
nav_order: 5
has_children: false
---

# Coach Hub

Your job is to create momentum, not to become the team's keyboard. In What The Hack, great coaching means asking better questions rather than giving faster answers.

Coaches for this event should focus on facilitation, pacing, and unblock strategy. Student-facing challenge pages stay public; full solution guides remain in the repository so you can use them selectively when a team is truly stuck.

## Event Day Checklist

### Pre-event

- Verify participants have a working GitHub path and an Azure subscription route
- Confirm you can access the repo locally, including `solution.md` files in each challenge folder
- Skim the challenge sequence so you know where setup ends and AI work begins
- Check the event’s escalation path for Azure subscription or portal issues

### During the event

- Start every team at Challenge 00 and confirm their environment is actually usable
- Watch for drift: teams often think they are blocked by code when they are really blocked by setup
- Keep teams time-boxed and encourage strategic skipping if the event clock gets tight
- Use questions first, direct fixes second

### Post-event

- Help teams capture what they built and what they learned
- Encourage cleanup of unused Azure resources if the event requires it
- Share next-step learning resources for teams that want to keep building

## Facilitation Principles

### Ask, don’t tell

Good prompts for teams:

- “What changed right before it stopped working?”
- “Where do you think the request is failing: auth, config, or code?”
- “What does success look like for this challenge?”
- “If you had to test one assumption first, which would it be?”

### Identify struggle vs. stuck

Healthy struggle looks like experimentation, note-taking, and narrowing hypotheses. A stuck team repeats the same failing action, cannot name the blocker, or loses confidence in the next step. Intervene when they stop learning from the attempt.

### Celebrate progress, not just completion

Call out good debugging, clear prompt design, and smart teamwork. Teams gain energy when you recognize real progress between checkpoints.

## Per-challenge timing guide

| Challenge | Expected Time | Warning Sign | Intervention |
|-----------|---------------|--------------|--------------|
| 00 Setup | 30 min | >45 min | Check Azure subscription issues, Codespaces readiness, and AI Foundry access. |
| 01 First Model | 45 min | >1 hr | Verify endpoint, deployment, key, and SDK configuration. |
| 02 Prompt Engineering | 1 hr | Teams keep changing everything at once | Help them test one prompt variable at a time. |
| 03 Prompt Flow | 1.5 hr | Flow runs but outputs are inconsistent | Review node wiring, branching assumptions, and structured outputs. |
| 04 RAG | 1.5 hr | Retrieval works poorly or answers hallucinate | Check indexing, grounding data quality, and citation expectations. |
| 05 Evaluation | 1 hr | Teams ignore metrics they do not like | Reframe metrics as design feedback, not a pass/fail judgment. |
| 06 Deploy & Integrate | 1 hr | Endpoint works in studio but not in app | Inspect auth, request payload shape, and integration error handling. |

## Common blockers across all challenges

| Blocker | What it usually means | What to do |
|---------|------------------------|------------|
| “Azure is broken” | Wrong tenant, missing subscription, or quota issue | Re-check account, subscription, and region before touching code. |
| “The model is not responding” | Deployment mismatch or bad credentials | Confirm the exact deployment name, endpoint URL, and key source. |
| “Prompt flow output is weird” | Inputs or assumptions changed between nodes | Trace one example end-to-end and inspect every intermediate value. |
| “RAG answers are off-topic” | Weak retrieval or poor chunk quality | Verify indexing, source data, and whether grounding is actually enabled. |
| “Nothing works anymore” | Several changes landed at once | Roll back to the last known-good step and recover incrementally. |

## Solution guides are in the repo

Coach solution guides are intentionally not published on this site. Clone the repository and use `challenges/*/solution.md` as your back-pocket reference when teams need structured rescue help.

<p class="coach-note">Use solution guides to restore momentum, not to short-circuit discovery.</p>

## Emergency resources

- Azure AI Foundry documentation: <https://learn.microsoft.com/azure/ai-foundry/>
- Azure status page: <https://azure.status.microsoft/en-us/status>
- Portal sign-in/account issues: confirm tenant, subscription, and event instructions first
- Event escalation: follow your organizer’s support route for Azure Pass, quota, or tenant problems
