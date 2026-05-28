# Work Routing

How to decide who handles what.

## Routing Table

| Work Type | Route To | Examples |
|-----------|----------|---------|
| Challenge architecture, scope decisions, content strategy | Danny | What challenges to include, learning objectives, hackathon format |
| GitHub Pages site, UI/UX, participant frontend | Linus | Site layout, navigation, styling, accessibility |
| GitHub Actions, repo structure, CI/CD, Pages pipeline | Livingston | Workflows, branch protection, deployment, repo scaffolding |
| Challenge writing, student guides, coach guides | Rusty | Problem statements, hints, walkthroughs, FAQs |
| QA, validation, coach solution guides, testing | Basher | End-to-end testing, broken links, coach reference solutions |
| Session logging, decisions, memory | Scribe | Automatic — never needs routing |
| Work queue monitoring, issue triage | Ralph | GitHub issue scanning, PR status |

## Issue Routing

| Label | Action | Who |
|-------|--------|-----|
| `squad` | Triage → assign sub-label | Danny (Lead triages) |
| `squad:danny` | Architecture / content planning | Danny |
| `squad:linus` | Frontend / GitHub Pages | Linus |
| `squad:livingston` | DevOps / GitHub infra | Livingston |
| `squad:rusty` | Curriculum / content writing | Rusty |
| `squad:basher` | QA / coach enablement | Basher |

## Escalation

- Ambiguous work → Danny assesses and routes
- Cross-domain work → Danny decomposes, parallel fan-out
- QA rejection → Basher nominates a different agent for revision (never the original author)
