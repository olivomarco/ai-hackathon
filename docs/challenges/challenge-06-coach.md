---
title: "Challenge 06 Coach Notes: Deploy & Integrate"
parent: Challenges
nav_order: 106
nav_exclude: true
search_exclude: false
---

<div class="hero-panel challenge-hero">
  <span class="hero-kicker">Challenge 06 • Coach Notes</span>
  <h1>Deploy &amp; Integrate: Coach View</h1>
  <p class="hero-tagline">Reference answer key, expected blockers, and timing for coaches running this challenge. Not visible to students from the main navigation.</p>
</div>

<div class="callout-warning" markdown="1">
**Coaches only.** Students get more out of the challenge when they discover the path themselves. Use these notes to unblock teams, not to dictate solutions.
</div>

## Overview

This final challenge is the celebration point of the hackathon. Students should connect the dots from model deployment, prompt design, orchestration, grounding, and evaluation into one deployable experience they can demo.

The main goal is not a perfect production app. It is a credible end-to-end integration: deployed endpoint, working client call, and a simple web UI for the University Q&A Assistant.

## Common Issues

- **Endpoint cold start or delayed readiness**: Students may debug the client before the deployment is actually ready.
- **Authentication errors**: The most common issue after deployment is using the wrong header, key, or endpoint URL.
- **Quota or deployment limits**: Some teams may hit environment limits when deploying managed endpoints.
- **Response-shape confusion**: The endpoint returns data, but students do not know how to extract answer text and citations.
- **Local app dependency gaps**: Flask or requests may not be installed in the environment yet.

Encourage teams not to overbuild. A plain but working app is a successful outcome.

## Coaching Tips

Guide with questions like:

- "Did you test the endpoint directly before adding Flask?"
- "What exact JSON shape comes back from the endpoint?"
- "Where are citations stored in the response?"
- "Is this a deployment problem, an auth problem, or an app parsing problem?"
- "What is the smallest demo that still proves the full flow works?"

Because this is the final challenge, make space for short demos. A quick celebration moment helps teams recognize how much they built.

## Timing

- **0–15 minutes**: Prepare deployment package and start endpoint deployment
- **15–30 minutes**: Wait for readiness, test via REST
- **30–50 minutes**: Build and run the Flask app locally
- **50–60 minutes**: Final polish and showcase prep

If time is tight, prioritize endpoint testing plus a minimal local UI over optional cloud hosting.

## Expected Questions

- **"Why is the endpoint not responding yet?"**  
  Check deployment readiness first. Cold starts and provisioning delays are common.

- **"How should students handle auth in the app?"**  
  Keep secrets in environment variables and send the header required by the deployed endpoint.

- **"What should we celebrate as success here?"**  
  A working demo where a user asks a university question and sees a grounded answer with citations through a real deployed endpoint.

<nav class="page-nav">
  <a href="{{ '/coach-hub' | relative_url }}">← Back to Coach Hub</a>
  <a href="{{ '/challenges/challenge-06' | relative_url }}">Student page →</a>
</nav>
