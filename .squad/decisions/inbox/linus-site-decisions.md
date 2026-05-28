# Decision: GitHub Pages information architecture for the WTH AI Hackathon

**Author:** Linus (Frontend Dev)
**Date:** 2026-05-28T16:23:27.374+01:00
**Status:** Proposed

## Context
The hackathon needs a student-friendly GitHub Pages experience in `docs/` using Jekyll and `just-the-docs`. The site has to work as the public navigation layer for participants and coaches while preserving the repo-only boundary for solution guides.

## Decisions

### Site Structure
- Use `docs/` as the full Jekyll site root
- Publish five top-level pages: Home, Getting Started, Challenges, Coach Hub, and FAQ
- Create seven challenge placeholder pages so sidebar navigation works before challenge content is published

### Theme & UX
- Use `just-the-docs` for search, responsive sidebar navigation, and low-friction GitHub Pages deployment
- Add Azure-aligned visual treatment with a custom hero panel, bright link color, challenge difficulty badges, and lightweight callout styles
- Keep the information architecture plain-language and event-day friendly so students can scan quickly on laptops or tablets

### Build Behavior
- Keep `theme: just-the-docs` in `_config.yml`
- Add a custom `_sass/color_schemes/default.scss` because `color_scheme: default` requires a real scheme file to compile
- Validate locally with Bundler + Jekyll from the `docs/` directory before handoff

### Publishing Boundary
- Keep coach solution guides out of the public Pages site
- Link challenge placeholders toward repo-based README locations instead of publishing unfinished content prematurely

## Consequences
- The site is immediately navigable even before wave-2 challenge content lands
- Styling stays lightweight and maintainable because it extends the theme instead of replacing it
- The build now has an explicit local dependency path (`docs/Gemfile`) for repeatable verification
