# Build Intelligent Apps with Microsoft Foundry

[![Deploy GitHub Pages](https://github.com/olivomarco/ai-hackathon/actions/workflows/deploy-pages.yml/badge.svg)](https://github.com/olivomarco/ai-hackathon/actions/workflows/deploy-pages.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/olivomarco/ai-hackathon)

*A What The Hack hackathon: from prompt to production*

---

## What is What The Hack?

**What The Hack** (WTH) is Microsoft's hackathon-in-a-box format designed to teach cloud and AI technologies through hands-on challenge-based learning. This repository brings WTH to Microsoft Foundry, a unified platform for building, evaluating, and deploying intelligent applications.

This hackathon, you and your team will work through seven progressive challenges over a single day (6–8 hours). Rather than lectures, you'll learn by *doing*: deploying models, engineering prompts, building AI workflows, and shipping a real AI-powered application. Coaches are on hand to guide discovery, unblock issues, and help you think through design decisions, but the learning is yours to own.

By the end, you'll have hands-on experience with the Microsoft Foundry platform, practical skills in prompt engineering and RAG (Retrieval-Augmented Generation), and a deployment-ready AI application to show for your work.

---

## Learning Outcomes

By the end of this hackathon, you will be able to:

- Navigate Microsoft Foundry and create an AI project with connected resources
- Deploy and interact with models from the Azure AI model catalog
- Engineer effective prompts and implement prompt flow orchestration
- Build a grounded RAG (Retrieval-Augmented Generation) application
- Evaluate AI model outputs for quality, safety, and responsible AI compliance
- Deploy an AI endpoint and integrate it into an application

---

## Who is this for?

### Students

You're a great fit for this hackathon if you:

- Have some Python experience (variables, functions, pip) and understand REST APIs and JSON
- Are curious about how AI models work and want to build with them
- Have a GitHub account and access to Azure (via Azure Pass, Azure for Students, or a trial subscription)
- Are ready to learn by solving real challenges, not watching tutorials

No prior Azure or AI experience needed. Just bring curiosity and a willingness to debug.

### Coaches

You're ready to coach if you:

- Are familiar with Microsoft Foundry, Azure OpenAI Service, and prompt engineering
- Enjoy helping teams think through problems (instead of giving direct answers)
- Can spend 6–8 hours supporting 2–3 teams
- Have access to the [Coach Hub](docs/coach-hub.md) and solution materials in this repo

---

## Prerequisites

Before you start, make sure you have:

- **Azure subscription**: Provided via Azure Pass, Azure for Students, or a free trial
- **GitHub account**: With Codespaces access (required for the dev environment)
- **Basic Python**: Comfortable with variables, functions, pip, and virtual environments
- **Basic API knowledge**: Understand REST APIs, HTTP requests, and JSON
- **VS Code familiarity**: Helpful, but not required (the devcontainer includes everything)

---

## Getting Started

### 1. Open in GitHub Codespaces or Dev Container

Click the badge below to open a fully configured development environment:

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/olivomarco/ai-hackathon)

**Alternative**: Open locally with [Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers) in VS Code.

### 2. Authenticate with Azure

Once your environment is ready, authenticate to Azure:

```bash
az login
```

Follow the prompts to sign in with your Azure account. This connects your workspace to your Azure subscription so you can provision Microsoft Foundry resources.

### 3. Start with Challenge 00

Read [Challenge 00: Setup & Orientation](challenges/challenge-00-setup/README.md) to begin. This 30-minute challenge will verify your environment and get you familiar with the Microsoft Foundry interface.

---

## Challenges

| # | Challenge | Duration | Difficulty | Key Skills |
|---|-----------|----------|------------|------------|
| 00 | [Setup & Orientation](challenges/challenge-00-setup/README.md) | 30 min | ⭐ | Microsoft Foundry, resource/Project |
| 01 | [First Model Deployment](challenges/challenge-01-first-model/README.md) | 45 min | ⭐ | Model Catalog, AI Inference SDK |
| 02 | [Prompt Engineering](challenges/challenge-02-prompt-engineering/README.md) | 1 hr | ⭐⭐ | System prompts, few-shot, CoT |
| 03 | [Prompt Flow](challenges/challenge-03-prompt-flow/README.md) | 1.5 hr | ⭐⭐⭐ | Orchestration, flow design |
| 04 | [RAG: Grounding with Your Data](challenges/challenge-04-rag/README.md) | 1.5 hr | ⭐⭐⭐⭐ | Vector search, AI Search |
| 05 | [Evaluation & Responsible AI](challenges/challenge-05-evaluation/README.md) | 1 hr | ⭐⭐⭐⭐ | Metrics, safety evaluation |
| 06 | [Deploy & Integrate](challenges/challenge-06-deploy/README.md) | 1 hr | ⭐⭐⭐⭐⭐ | Endpoints, integration |

**Total estimated time: ~7.25 hours** (perfect for a 1-day event with breaks)

---

## Repository Structure

```
ai-hackathon/
├── README.md                          # ← You are here
├── challenges/                        # Challenge content and solutions
│   ├── challenge-00-setup/
│   ├── challenge-01-first-model/
│   ├── challenge-02-prompt-engineering/
│   ├── challenge-03-prompt-flow/
│   ├── challenge-04-rag/
│   ├── challenge-05-evaluation/
│   └── challenge-06-deploy/
├── src/                               # Sample code and templates for participants
├── docs/                              # Supporting documentation (Jekyll/GitHub Pages)
├── .devcontainer/                     # Dev environment config (Python, Azure CLI)
├── .github/                           # GitHub Actions workflows (Pages build)
└── PLAN.md                            # Content architecture and design decisions
```

Each challenge folder contains:
- `README.md`: the challenge brief (what to build)
- `solution.md`: the solution guide (coaches only)
- Sample data or starter code (if needed)

---

## For Coaches

### Getting Started

Visit the [Coach Hub](docs/coach-hub.md) for tips on facilitating WTH events and working with your teams.

### Solution Guides

Solution guides for each challenge are included in this repo under `challenges/*/solution.md`. These are **for coaches only**; share judiciously to encourage discovery over answers.

Clone or access this repo locally and navigate to the challenge solution you need.

### Quick-Start Coaching Checklist

1. Verify all participants have Azure subscriptions and Codespaces access
2. Review the challenge brief before your team starts
3. Walk through Challenge 00 with them to confirm the environment works
4. For each challenge, guide them toward the solution without giving it away
5. Use the solution guide to unblock them if they're truly stuck

---

## Resources

- **[Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-foundry/)**: Official docs and tutorials
- **[Azure AI Learning Path](https://learn.microsoft.com/training/paths/develop-generative-ai-solutions-azure-ai-foundry/)**: Structured training modules
- **[Microsoft AI Skills Navigator](https://microsoft.com/ai/skills)**: Browse AI and cloud certifications
- **[What The Hack Format Guide](https://microsoft.github.io/WhatTheHack/)**: Learn about WTH events

---

## Contributing

We welcome improvements to challenge content, documentation, and code samples. See `CONTRIBUTING.md` for guidelines (coming soon).

---

## License

This hackathon content is licensed under the [MIT License](LICENSE). Use it in your own events, adapt it, and share it, just give credit to Microsoft and the WTH community.

---

**Ready to build?** Start with [Challenge 00](challenges/challenge-00-setup/README.md).
