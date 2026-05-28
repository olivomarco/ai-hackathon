# Decision Note: Rusty Challenge Content Decisions

**Author:** Rusty
**Date:** 2026-05-28T16:23:27.374+01:00
**Status:** Proposed

## Context
Rusty was asked to create student-facing challenge guides for Challenges 00, 01, and 02, coach-facing solution guides for the same challenges, and a fictional university FAQ corpus for the later RAG challenge.

## Decisions
- Kept all challenge content aligned to the WTH template from `PLAN.md`: Introduction, Description, Success Criteria, Learning Resources, Tips, and Advanced Challenges.
- Wrote coach guides to optimize facilitation, not answer leakage, by including timing, common pitfalls, and coaching questions.
- Used Azure AI Foundry concepts consistently across the first three challenges: hub/project setup, model deployment, playground experimentation, SDK usage, and content safety.
- Anchored Challenge 02 and the sample corpus to a shared fictional setting: **Northfield University**.
- Made the corpus broad enough for future RAG evaluation by covering policy, deadlines, support services, and sensitive edge cases such as mental health and academic integrity.

## Consequences
- Early challenge content is now scaffolded for beginners and should reduce coach load during setup and first-use friction.
- The Northfield theme creates continuity into later prompt, RAG, and evaluation challenges.
- The sample corpus favors consistency and grounding quality over open-ended creativity, which is appropriate for a guided hackathon.

## Related
- `/PLAN.md`
- `challenges/challenge-00-setup/`
- `challenges/challenge-01-first-model/`
- `challenges/challenge-02-prompt-engineering/`
- `resources/sample-data/university-faq/`
