# SKILL: WTH Hackathon Format Design

## What This Skill Covers
Designing a "What The Hack" (WTH) hackathon-in-a-box content architecture — the pattern for structuring challenges, guides, and supporting infrastructure.

## When to Use
- Creating any WTH-format hackathon regardless of technology focus
- Designing progressive challenge sequences for hands-on learning events
- Structuring content for coach-facilitated, team-based technical workshops

## The Pattern

### Challenge Design Formula

1. **Challenge 00 is always Setup** — isolate environment issues from learning
2. **Linear progression** — each challenge depends on the previous (unless audience is advanced)
3. **Time allocation follows difficulty** — Beginner: 30-45min, Intermediate: 1-1.5hr, Advanced: 1-1.5hr
4. **Total time ≈ event duration × 0.8** — leave 20% for breaks, transitions, intros
5. **5–7 challenges is the sweet spot** — fewer feels shallow, more creates time pressure

### Each Challenge Contains

**Student Guide (README.md):**
- Introduction (motivation/context)
- Description (what to accomplish)
- Success Criteria (checkboxes — unambiguous completion signal)
- Learning Resources (official docs, not full tutorials)
- Tips (progressive hints: vague → specific)
- Advanced Challenges (stretch goals for fast teams)

**Coach Guide (solution.md):**
- Step-by-step solution walkthrough
- Common pitfalls and unblocking strategies
- Coaching tips (questions to ask, not answers to give)
- Timing guidance (when to intervene)

### Difficulty Escalation Pattern

```
Setup (always first) → Basics (use the tool) → Design (make decisions) →
Orchestrate (combine pieces) → Real-World Scenario (complex integration) →
Quality/Safety (evaluate & improve) → Production (deploy & operationalize)
```

### Repo Structure Pattern

```
/
├── challenges/challenge-NN-slug/   ← Paired student + coach content
├── docs/                           ← GitHub Pages (student-facing only)
├── resources/                      ← Shared data, scripts, images
└── .devcontainer/                  ← Reproducible environment
```

### Key Principles
- Coach solutions NEVER go on the public site
- Devcontainer is mandatory for hackathon reliability
- Provide sample data for any challenge that needs external input
- Write success criteria as checkboxes — participants self-assess
- Evaluation/safety challenges come BEFORE deployment challenges
- Each challenge folder is self-contained (no cross-folder imports)

## Anti-Patterns to Avoid
- Parallel challenge tracks (too complex for coaches to manage)
- Mixing setup with first learning challenge (environment issues block learning)
- Publishing solutions publicly (defeats the hackathon model)
- Leaving data sourcing to participants (creates divergent experiences)
- Putting deployment before evaluation (ships irresponsible AI)
