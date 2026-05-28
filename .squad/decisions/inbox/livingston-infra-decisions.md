# Decision: WTH Hackathon Repo Infrastructure Bootstrap

**Author:** Livingston (DevOps & GitHub Engineer)
**Date:** 2026-05-28T16:23:27.374+01:00
**Status:** Proposed

## Context
The WTH AI Hackathon repository needed its baseline delivery infrastructure so organizers can run the event consistently in Codespaces/devcontainers and publish student-facing docs through GitHub Pages.

## Decisions
- Create the canonical challenge, docs, and resources directory structure up front so content authors can drop material into predictable locations.
- Standardize on a Python 3.11 devcontainer with Azure CLI, Node.js 20, and GitHub CLI to match the hackathon toolchain.
- Use a repo-root `requirements.txt` plus a post-create bootstrap script to keep Codespaces setup deterministic and repeatable.
- Add organizer automation for Azure provisioning with explicit idempotency checks before creating a resource group, AI Foundry hub/project, Azure OpenAI deployment, and Azure AI Search service.
- Publish docs through a dedicated GitHub Pages workflow using Jekyll 4.x and `just-the-docs` from `docs/`.
- Add contributor hygiene assets (`.gitignore`, issue templates, PR template, MIT license) so forks and community contributions start with sensible defaults.

## Consequences
- Organizers can fork the repo and bootstrap infrastructure with fewer manual setup steps.
- The provisioning script may need small command updates if Azure CLI preview commands for AI Foundry projects change.
- GitHub Pages deployment is now isolated to `docs/**` updates, reducing unnecessary workflow runs.

## Related
- `/PLAN.md`
- `/.devcontainer/devcontainer.json`
- `/.github/workflows/deploy-pages.yml`
