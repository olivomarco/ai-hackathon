# Decision: Fix broken cross-page links in docs/challenges/

**Agent:** Basher  
**Date:** 2026-05-28  
**Requested by:** Marco (olivomarco)  
**Status:** Completed

---

## Problem

Seven `docs/challenges/challenge-XX.md` pages each ended with a Markdown link pointing to:

```
../../challenges/challenge-XX-name/README.md
```

The Jekyll Pages site is rooted at `docs/`. A `../../` traversal from `docs/challenges/` exits the published tree entirely, producing a **404** on the live site (e.g. `https://olivomarco.github.io/challenges/challenge-01-first-model/README.md`).

---

## Files Touched

| File | Old link target | New link target |
|------|----------------|-----------------|
| `docs/challenges/challenge-00.md` | `../../challenges/challenge-00-setup/README.md` | `https://github.com/olivomarco/ai-hackathon/tree/main/challenges/challenge-00-setup` |
| `docs/challenges/challenge-01.md` | `../../challenges/challenge-01-first-model/README.md` | `https://github.com/olivomarco/ai-hackathon/tree/main/challenges/challenge-01-first-model` |
| `docs/challenges/challenge-02.md` | `../../challenges/challenge-02-prompt-engineering/README.md` | `https://github.com/olivomarco/ai-hackathon/tree/main/challenges/challenge-02-prompt-engineering` |
| `docs/challenges/challenge-03.md` | `../../challenges/challenge-03-prompt-flow/README.md` | `https://github.com/olivomarco/ai-hackathon/tree/main/challenges/challenge-03-prompt-flow` |
| `docs/challenges/challenge-04.md` | `../../challenges/challenge-04-rag/README.md` | `https://github.com/olivomarco/ai-hackathon/tree/main/challenges/challenge-04-rag` |
| `docs/challenges/challenge-05.md` | `../../challenges/challenge-05-evaluation/README.md` | `https://github.com/olivomarco/ai-hackathon/tree/main/challenges/challenge-05-evaluation` |
| `docs/challenges/challenge-06.md` | `../../challenges/challenge-06-deploy/README.md` | `https://github.com/olivomarco/ai-hackathon/tree/main/challenges/challenge-06-deploy` |

No other `../../` escaping links were found in `docs/` after a full audit.

---

## URL Pattern Used

```
https://github.com/olivomarco/ai-hackathon/tree/main/challenges/challenge-XX-name
```

Each link text follows the pattern: **Open the full challenge guide on GitHub:** `[challenges/challenge-XX-name](URL)` — followed by a note to open in Codespaces.

---

## Why `tree/main/<folder>` over `blob/main/<folder>/README.md`

| Option | Behaviour |
|--------|-----------|
| `blob/main/challenges/.../README.md` | Renders the README file in raw/blob view — shows only the README, no sibling files visible |
| **`tree/main/challenges/...`** | Renders the **folder view** — GitHub automatically renders `README.md` inline at the bottom AND lists `solution.md`, any notebooks, and other artefacts in the file tree above |

Using `tree/main` gives participants one-click access to the full challenge folder including `solution.md`, which is the intended workflow.

---

## Verification

Post-edit grep confirmed zero remaining `../../` links in `docs/`:

```
grep -rn "\.\./\.\." docs/ --include="*.md"
# → no output (clean)
```
