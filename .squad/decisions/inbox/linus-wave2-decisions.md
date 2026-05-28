# Decision: Participant-facing challenge guide pattern for wave 2

**Author:** Linus (Frontend Dev)
**Date:** 2026-05-28T16:23:27.374+01:00
**Status:** Proposed

## Context
The GitHub Pages site needed the seven `docs/challenges/` pages turned from placeholders into participant-facing guide pages. These pages are not the full workshop instructions; they are the discovery layer that helps students understand what each challenge is for before they open the repo README.

## Decisions

### Content pattern
- Use the same information architecture on all seven challenge pages for fast scanning during an event:
  - short plain-language overview
  - time and difficulty badges
  - “what participants will build” cards
  - key concepts callout
  - official learning links
  - direct repo README link
  - previous/next pager
- Keep step-by-step instructions out of the Pages site and point participants to the in-repo challenge guide for execution details.

### Visual treatment
- Extend the existing Azure-style hero treatment instead of inventing a second visual language.
- Add compact meta badges and page navigation so challenge pages feel like a connected sequence rather than isolated markdown files.
- Reuse lightweight card and callout patterns to keep the site polished without making content hard to maintain.

### Resource strategy
- Add a dedicated `docs/resources.md` page as a shared reference shelf.
- Prefer official Microsoft Learn URLs for platform, SDK, RAG, and evaluation topics.
- Include community links separately so participants can find support without mixing docs and discussion sources.

## Consequences
- Participants get orientation first, then hands-on detail in the repo README.
- Coaches can point teams to one consistent public page pattern across the full challenge ladder.
- The public site remains concise and searchable while the repo continues to hold the deeper lab content.
