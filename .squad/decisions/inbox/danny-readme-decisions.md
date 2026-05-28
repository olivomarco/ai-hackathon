# README.md Writing Decisions — Danny

**Date:** 2026-05-28T16:23:27.374+01:00  
**Author:** Danny, Lead & Content Architect  
**Status:** Complete

---

## Decisions Made

### 1. Structure & Tone
- **Decision:** Use a welcoming, action-oriented tone throughout
- **Rationale:** Target audience includes both students (first-time AI learners) and coaches. Tone signals "this is achievable" without being overly simplistic.

### 2. Badge Selection
- **Decision:** Include 3 badges: GitHub Pages build status, MIT License, GitHub Codespaces
- **Rationale:** 
  - Pages badge signals deployment pipeline readiness
  - License badge builds trust (clear intellectual property)
  - Codespaces badge is a direct CTA for immediate engagement

### 3. What is WTH? Section (3 paragraphs)
- **Decision:** Lead with explanation of WTH format, then describe the hackathon experience, then outcome
- **Rationale:** Establish context for readers unfamiliar with WTH format before diving into what *this* hackathon delivers

### 4. Learning Outcomes
- **Decision:** Use exact 6-point list from PLAN.md section 1 (High-Level Learning Outcomes)
- **Rationale:** Ensures consistency with content architecture; provides clear competency targets

### 5. Who is This For? — Two Subsections
- **Decision:** Separate "Students" and "Coaches" with welcoming language
- **Rationale:** Allows each audience to quickly self-assess fit without filtering unrelated content

### 6. Prerequisites — Specific List
- **Decision:** Five concrete prerequisites (Azure subscription, GitHub, Python, APIs, VS Code familiarity)
- **Rationale:** Prevents signup friction; clarifies expected baseline; VS Code listed as "helpful, not required" to lower barriers

### 7. Getting Started — 3-Step Format
- **Decision:** Codespaces badge → Azure login → Challenge 00 link
- **Rationale:** Mirrors actual workflow; Codespaces badge is visual/clickable (lowers friction); Azure login is a one-time step; Challenge 00 provides clear next action

### 8. Challenges Table
- **Decision:** 
  - Include all 7 challenges (00–06)
  - Add columns: Duration, Difficulty, Key Skills
  - Link each title to challenge README
  - Include total estimated time: ~7.25 hours
- **Rationale:** 
  - Hyperlinked titles enable navigation from README to challenge content
  - Duration + difficulty allows teams to pace themselves
  - Key Skills preview what they'll learn
  - Total time confirms 1-day event viability

### 9. Repository Structure
- **Decision:** 15-line annotated tree (directories + brief comments)
- **Rationale:** 
  - Provides quick mental map without overwhelming detail
  - Comments explain *why* each folder exists (e.g., "solution.md — coaches only")
  - Omits hidden files (.git, .gitignore) for clarity

### 10. For Coaches Section
- **Decision:** 
  - Link to Coach Hub (placeholder: docs.microsoft.com path)
  - Note that solution.md files are coaches-only
  - Include a checklist for event facilitation
- **Rationale:** 
  - Coach Hub link provides discovery path to extended resources
  - Explicitly marking solutions as coaches-only protects student experience
  - Checklist gives coaches immediate guidance without a separate document

### 11. Resources
- **Decision:** 4 curated links: Azure AI Foundry docs, learning path, AI Skills Navigator, WTH format guide
- **Rationale:** 
  - Mix of official Microsoft docs + community WTH resources
  - Each link serves a specific purpose (API reference, learning structure, certifications, event format)

### 12. Contributing Section
- **Decision:** Brief note with reference to CONTRIBUTING.md (note: file doesn't exist yet)
- **Rationale:** 
  - Sets expectation that contributions are welcome
  - Honest about work-in-progress (CONTRIBUTING.md coming)
  - Doesn't promise what isn't ready

### 13. License
- **Decision:** MIT License with link to LICENSE file
- **Rationale:** 
  - Matches organizational policy
  - Enables reuse in other hackathons
  - Clear and permissive

---

## Content Architecture Alignment

- ✅ Reflects 7-challenge structure from PLAN.md section 2
- ✅ Uses Learning Outcomes from PLAN.md section 1
- ✅ Honors content decisions (e.g., Challenge 00 is setup-only, RAG is Ch 04)
- ✅ Supports both 1-day and extended pacing (time estimates provided)
- ✅ Separates student and coach experiences (no solutions on public Pages)

---

## Open Items for Follow-Up

1. **Codespaces badge repo path** — Currently uses placeholder `microsoft/ai-hackathon`. Update to actual org/repo URL when deployed.
2. **CONTRIBUTING.md** — Referenced but not yet written. Create after README is finalized.
3. **Coach Hub URL** — Currently references docs.microsoft.com path. Verify actual URL and update if needed.
4. **Jekyll Pages deployment** — README assumes Pages workflow is configured. Confirm workflow in .github/ is ready.

---

## Summary

The README follows the specification precisely, balancing clarity for students with practical guidance for coaches. It serves as the primary entry point for the hackathon, establishing tone, setting expectations, and providing clear next steps. All learning outcomes from the content architecture are reflected in a learner-friendly format.
