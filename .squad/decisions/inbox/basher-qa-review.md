# Basher QA Review

**Date:** 2026-05-28T16:23:27.374+01:00
**Requested by:** Marco Olivo

## Key findings

- Full QA sweep completed across student guides, coach guides, docs pages, and infra files.
- 14 issue groups were identified.
- 11 issue groups were fixed directly.
- 3 issue groups were left as follow-up items for Rusty/Linus judgment.

## Fixes applied

- Added missing `Step-by-step` sections to Challenges 00–02.
- Removed broken screenshot links from Challenge 00 setup guidance.
- Aligned `requirements.txt`, `.env.example`, and `validate-environment.py` with code snippets and Challenge 06 endpoint variables.
- Standardized coach guide headings across all reviewed `solution.md` files.
- Updated outdated Azure AI Foundry / setup / coach hub / resources links.
- Reinforced the University Q&A Assistant narrative in docs challenge pages 03–06.

## Follow-up needed

1. Decide whether starter files should be added for Challenges 03–06 artifacts.
2. Decide whether Challenge 05 should ship a fuller evaluation starter script.
3. Decide whether maintained setup screenshots should be added for event-ready branches.

## Validation evidence

- Targeted structural/content QA script returned **0 remaining issues** after fixes.
- `python -m compileall resources/scripts/validate-environment.py` passed.
- Virtualenv install from `requirements.txt` succeeded.
- `resources/scripts/validate-environment.py` executed successfully; only expected fresh-repo `.env` configuration remained outstanding.
