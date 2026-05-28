# BUG FIX: Jekyll Kramdown markdown="1" Attribute on HTML Block Elements

**Date:** 2026-05-28  
**Fixed by:** Linus (Site/Chrome specialist)

## The Bug

Jekyll's Kramdown processor does NOT process markdown content (tables, lists, links, emphasis) inside HTML block-level elements unless the wrapping element carries the `markdown="1"` attribute.

**Evidence:** Marco screenshotted the broken "Per-challenge coach notes" table in `coach-hub.md` rendering as raw pipe characters (`|`) instead of an HTML table.

## The Fix

Added `markdown="1"` to exactly 4 divs:

1. **`docs/coach-hub.md:80`** — `<div class="challenge-card">`  
   - Wrapped the "Per-challenge coach notes" table  
   - Now renders correctly as HTML table

2. **`docs/setup.md:31`** — `<div class="callout-tip">`  
   - Wrapped Codespaces setup tip  
   - Links and emphasis now render properly

3. **`docs/setup.md:57`** — `<div class="callout-warning">`  
   - Wrapped manual setup warning  
   - Links now clickable instead of literal

4. **`docs/setup.md:98`** — `<div class="callout-info">`  
   - Wrapped validation script heads-up  
   - Code and emphasis now render correctly

## Style Rule (New)

**Mandatory rule for all future content:**

Every `<div class="callout-*">` or `<div class="challenge-card">` that wraps markdown body content **MUST** include the `markdown="1"` attribute.

**Exceptions** (no markdown inside—do not add attribute):
- `hero-panel`, `quick-grid`, `quick-card`, `meta-strip`, `cta-row`, `table-wrapper`, `page-nav`  
  These wrap raw HTML/CSS only.

## Verification

```bash
grep -rn '<div class=' docs/ --include="*.md" | grep -v 'markdown="1"' | grep -v 'hero-panel\|quick-grid\|quick-card\|meta-strip\|cta-row\|table-wrapper'
```

**Result:** No output (zero lines). ✓

## Notes

- Challenge pages (`docs/challenges/challenge-*.md` and `challenge-*-coach.md`) already have correct `markdown="1"` attributes (Rusty applied those already).
- This fix ensures future contributors avoid the same issue.
