# Decision: Inline Challenge Content Instead of GitHub Links

**Date:** 2026-05-28  
**Author:** Rusty (Content / Editorial)  
**Status:** Accepted

---

## Decision

All hands-on challenge content (Step-by-step, Success Criteria, Tips, Advanced) has been inlined directly into the `docs/challenges/challenge-XX.md` Pages files rather than linking out to the source READMEs in `challenges/*/` via GitHub blob/tree URLs.

---

## Why inline instead of `include_relative`

Jekyll's `include_relative` tag resolves paths relative to the current file and the Jekyll source directory. The source challenge READMEs live in `challenges/challenge-XX-NAME/README.md` at the repository root, which is **outside** the Jekyll source directory (`docs/`). Jekyll cannot include files from outside its source directory, making `include_relative` (or `{% include %}` with a base-path workaround) unworkable without restructuring the repository layout.

Alternatives considered:

- **Symlinks**: Not supported by GitHub Pages builds running on the Actions `jekyll-build-pages` action.
- **Pre-build copy step**: Would require a custom workflow step to copy files before Jekyll builds, adding CI complexity and still creating duplication.
- **Direct inlining**: Straightforward, no build changes required, and works with the current Jekyll/Pages setup. Chosen for its simplicity.

---

## Drift risk: two sources of truth

Inlining creates a **known drift risk** between:

- `challenges/challenge-XX-NAME/README.md` (the Codespaces working-folder version, used inside the dev container)
- `docs/challenges/challenge-XX.md` (the Pages-rendered version, viewed in the browser)

Future content updates — new steps, corrected commands, SDK version changes — **must be applied to both files**. The recommended workflow is:

1. Edit `challenges/challenge-XX-NAME/README.md` first (the authoritative hands-on guide).
2. Reflect the same changes in `docs/challenges/challenge-XX.md` (the Pages version).
3. If a coach solution changes, update both `challenges/challenge-XX-NAME/solution.md` and `docs/challenges/challenge-XX-coach.md`.

A future automation option would be a CI check that detects out-of-sync section content between the two files and raises a PR review comment. This has not been implemented yet.

---

## `nav_exclude: true` for coach pages

The 7 new `docs/challenges/challenge-XX-coach.md` pages are set to `nav_exclude: true` in their front-matter. This hides them from the just-the-docs sidebar navigation so students browsing the site do not encounter the solution path before attempting the challenge.

They are still:

- **rendered by Jekyll** and accessible at their URL (e.g., `/challenges/challenge-00-coach`)
- **indexed by search** (`search_exclude: false`) so coaches can find them via the site search bar
- **linked from the Coach Hub** (`/coach-hub`) in the per-challenge coach notes table

The choice of `nav_exclude: true` over a separate authentication layer reflects the event context: this is a facilitated hackathon with trusted coaches, not a public exam. The soft barrier (not in the nav, not advertised to students) is sufficient. Full access control would require a backend that GitHub Pages cannot provide.

---

## References

- [Jekyll include_relative documentation](https://jekyllrb.com/docs/includes/)
- `docs/coach-hub.md`: coach landing page with per-challenge coach notes table
- `docs/challenges/challenge-XX-coach.md`: the 7 new coach pages created in this session
