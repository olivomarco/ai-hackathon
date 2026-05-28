# Linus CSS Fix — GitHub Pages Theme Broken
**Date:** 2026-05-28  
**Agent:** Linus (Frontend Developer)

---

## Root Cause (Confirmed)

Two compounding issues caused the live site to render as a raw HTML fragment with no theme:

1. **Missing master stylesheet** — `docs/assets/css/just-the-docs-default.scss` did not exist. Without this file (with its empty front-matter `---\n---`) Jekyll has no entry point to compile the JTD theme CSS. The theme's `_layouts/default.html` references this compiled file; without it, no stylesheet is injected.

2. **Missing `jekyll-include-cache` plugin** — JTD uses `{% include_cached %}` in its layout partials. Without this plugin registered, those includes silently fail or error, breaking layout rendering entirely.

Secondary config errors (wrong `url`, wrong repo links) don't break rendering per se but would cause broken assets/links once the CSS issue is fixed.

---

## Files Changed

| File | Change |
|------|--------|
| `docs/assets/css/just-the-docs-default.scss` | **CREATED** — master stylesheet entry point with Liquid front-matter matching upstream JTD format |
| `docs/_config.yml` | `url` fixed to `olivomarco.github.io`; added `jekyll-include-cache` plugin; fixed `nav_external_links` repo URL; fixed `aux_links` Codespaces URL and Discussion URL |
| `docs/Gemfile` | Added `gem "jekyll-include-cache"` |
| `README.md` | Replaced all 3 `microsoft/ai-hackathon` occurrences with `olivomarco/ai-hackathon` |

---

## Manual Action Required (Marco)

1. **Review changes** — `git diff` to confirm nothing was inadvertently touched in content files.
2. **Commit and push**:
   ```bash
   git add docs/assets/css/just-the-docs-default.scss docs/_config.yml docs/Gemfile README.md
   git commit -m "fix: restore JTD theme CSS and fix repo config refs

   - Add docs/assets/css/just-the-docs-default.scss (required JTD entry point)
   - Add jekyll-include-cache plugin to Gemfile and _config.yml
   - Fix url to olivomarco.github.io
   - Fix nav/aux links to olivomarco/ai-hackathon
   - Fix README badges and Codespaces links"
   git push
   ```
3. **Wait for Pages build** (~2 min) then verify https://olivomarco.github.io/ai-hackathon/ loads with full theme.

---

## Notes

- `docs/Gemfile.lock` intentionally NOT updated — CI will regenerate it.
- `docs/_sass/custom.scss` and `docs/_sass/color_schemes/default.scss` are syntactically clean — no issues found.
- The `nav_external_links` Azure AI Foundry URL already pointed to `/azure/ai-foundry/` (correct) — no change needed there.
