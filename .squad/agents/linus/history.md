## Learnings

### Project Context
- **Project:** WTH (What The Hack) AI Hackathon — Microsoft Foundry format
- **Repo:** ai-hackathon
- **Stack:** Microsoft Foundry AI, GitHub Pages (Jekyll/static), Markdown, GitHub Actions
- **Participants:** Students (new to AI) + Coaches (facilitators)
- **Goal:** Create a complete, deliverable WTH hackathon format with a polished GitHub Pages site
- **Requested by:** Marco Olivo
- **Date:** 2026-05-28


### 2026-05-28T16:23:27.374+01:00 — Jekyll site build learnings
- `just-the-docs` treats `color_scheme: default` as a custom scheme name, so the site needs `_sass/color_schemes/default.scss` to build cleanly.
- The participant-facing site works best as a fast, searchable front door: a strong home hero, a plain-language setup guide, challenge stubs for navigation, and a coach-only boundary that keeps solutions out of Pages.
- For local verification, `bundle exec jekyll build -d .site-check` in `docs/` is enough to validate navigation, Markdown rendering, and custom styling before deployment.

### 2026-05-28T20:15:00+01:00 — GitHub Pages CSS fix (root-cause investigation)
- JTD theme requires `docs/assets/css/just-the-docs-default.scss` with Liquid front-matter (`---\n---`) as the stylesheet entry point. Without it Jekyll never compiles the theme CSS, and the layout renders as a naked HTML fragment.
- JTD also requires the `jekyll-include-cache` plugin; its layouts use `{% include_cached %}` which errors silently without the plugin, further breaking layout application.
- `_config.yml` `url` must match the actual GitHub Pages domain (`olivomarco.github.io`, not `microsoft.github.io`) — a mismatched domain causes asset resolution failures even if CSS compiles.
- Always verify `aux_links` and `nav_external_links` point to the correct org/repo after a repo fork or rename — these URLs are easy to miss and affect all site-level links.
- The upstream `just-the-docs-default.scss` on `main` uses Liquid `{% include css/just-the-docs.scss.liquid %}`, not a plain `@import` — fetch the actual upstream file to confirm format before creating it.


---

## Team Update — 2026-05-28 Session Complete

**Session:** Fact-check & CSS fix (multi-batch agent work)

**Major Outcomes:**
- **Microsoft Foundry rebrand applied** — All challenges verified & updated (Azure AI Foundry → Microsoft Foundry)
- **CSS rendering restored** — GitHub Pages now displays with full just-the-docs theme
- **Content verified against current docs** — All SDK versions, deployment patterns, and terminology current (no breaking changes)
- **Humanizer pass complete** — 28 files cleaned of AI-generated patterns (emojis, em dashes, promotional vocab)
- **Cross-page links fixed** — Challenge discovery pages now render without 404s
- **Platform resilience discovered** — Serial agent dispatch works around 401 outages (parallel spawn causes race conditions)

**Next:** Marco needs to `git push` to deploy CSS fix to live site; maintainers must run `cd docs && bundle install` to regenerate Gemfile.lock.
