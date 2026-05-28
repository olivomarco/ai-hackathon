# Decision: Difficulty Badge Contrast Fix in Hero Panels

**Date:** 2026-05-28
**Author:** Linus (Site / Chrome specialist)
**Status:** Applied

---

## Bug Observed

On `https://olivomarco.github.io/ai-hackathon/challenges/challenge-00.html`, the
`.difficulty-badge.difficulty-1` badge ("⭐ Beginner") was invisible inside the hero panel.
It rendered as white text on a `#edf8f0` near-white light-green background — essentially
unreadable.

## Root Cause

`.hero-panel` sets `color: white` (dark blue bg, all text white). The cascade rule:

```scss
.hero-panel h1, .hero-panel p, .hero-panel a, .hero-panel strong { color: inherit; }
```

propagates white text to descendants. `.meta-badge` explicitly declares `color: #fff` with
a dark translucent background — fine. But `.difficulty-badge` had **no explicit `color:`
declaration**, so it inherited the parent's white text and rendered it on its own light
pastel background (e.g. `#edf8f0`). Result: invisible.

## Two-Layer Fix Applied

### 1. Primary fix — explicit color on `.difficulty-badge`

Added `color: #1f2937` (dark slate) directly to the base `.difficulty-badge` rule so all
badges, everywhere in the document, always carry their own readable text color regardless
of parent context.

### 2. Defensive fix — `.hero-panel .difficulty-badge` scoped override

Added a hero-scoped override:

```scss
.hero-panel .difficulty-badge {
  color: #1f2937;
}
```

This is belt-and-suspenders: even if a future refactor drops or changes the base
`.difficulty-badge` color, hero panel placements are protected by a higher-specificity rule.

## Colour Ramp Sanity Check

| Class         | Background | Semantic Meaning |
|---------------|------------|-----------------|
| `.difficulty-1` | `#edf8f0` | Light green — Beginner ✅ |
| `.difficulty-2` | `#eef6ff` | Light blue — Easy ✅ |
| `.difficulty-3` | `#f4f0ff` | Light purple — Intermediate ✅ |
| `.difficulty-4` | `#fff3e6` | Light orange — Advanced ✅ |
| `.difficulty-5` | `#ffe8e8` | Light red — Expert ✅ |

Palette is intuitive (cool→warm, easy→hard). No changes made.
