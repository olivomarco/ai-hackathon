# Decision: Apply just-the-docs Default Layout to All Pages

**Date:** 2026-05-28  
**Author:** Linus (Site/Chrome specialist)  
**Status:** Implemented

---

## What Was Wrong

`curl -sL https://olivomarco.github.io/ai-hackathon/` returned raw HTML fragments — `<div>`, `<h1>`, `<h2>` — with no `<html>`, `<head>`, `<link rel="stylesheet">`, or `<body>` tag.

**Root cause:** No page had `layout: default` in its front-matter, and `docs/_config.yml` had no `defaults:` block to set a fallback. Jekyll converts Markdown to an HTML fragment but never wraps it in a layout unless told to. The just-the-docs `_layouts/default.html` is the file that injects the full HTML shell — `<html><head>` with the stylesheet `<link>`, sidebar, search bar, header, and footer. Without it, visitors see unstyled, chrome-less content.

### Secondary issue: `_sass/custom.scss` at wrong path

`docs/_sass/custom.scss` existed but was **not** being auto-included by just-the-docs. JTD's convention is `_sass/custom/custom.scss`. The file was sitting in `_sass/` directly, making all custom styles dead code.

### Tertiary issue: stale title

`docs/_config.yml` `title:` still read `"WTH: Build Intelligent Apps with Azure AI Foundry"` after the project-wide rename to "Microsoft Foundry".

---

## The Fix

### Fix 1 — `defaults:` block in `_config.yml`

```yaml
defaults:
  - scope:
      path: ""
    values:
      layout: default
```

Jekyll's `defaults:` lets you set front-matter values for any path glob. `path: ""` matches every file in the site. This means every page that does not explicitly declare a `layout:` gets `layout: default` injected, causing JTD's full HTML shell to wrap the converted Markdown.

### Fix 2 — Move `_sass/custom.scss` → `_sass/custom/custom.scss`

just-the-docs 0.12 auto-imports `_sass/custom/custom.scss` at the end of its Sass pipeline. The file was at `_sass/custom.scss` (wrong), so none of the custom styles (hero panels, callouts, difficulty badges, etc.) were ever compiled into the output CSS. Moving the file to the expected path activates them.

### Fix 3 — Correct site title

Changed `title:` from `"WTH: Build Intelligent Apps with Azure AI Foundry"` to `"WTH: Build Intelligent Apps with Microsoft Foundry"` to match the rest of the content.

---

## Why JTD 0.12 Needs Explicit `defaults:` When Pages Lack `layout:` Front-Matter

Jekyll has no "automatic layout" feature — it only applies a layout when:
1. The page's own front-matter declares `layout: <name>`, or
2. A matching `defaults:` rule in `_config.yml` injects one.

Some themes (e.g., Minima) declare `layout: default` in their own `_layouts/` definitions so that pages inherit it via Jekyll's layout chain. just-the-docs does **not** do this — its `default` layout is the top-level entry point, not a base inherited automatically.

Therefore, a fresh JTD site with no `defaults:` block and no per-page `layout:` in front-matter will build successfully (no errors) but output completely unstyled, shell-less HTML fragments. The Sass pipeline and all theme assets compile fine — they just never get linked to any page. This is a known "silent failure" mode for JTD.

The `defaults:` fix is the recommended solution in JTD's documentation and is what the JTD starter template includes out of the box.
