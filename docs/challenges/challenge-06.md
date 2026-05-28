---
title: "Challenge 06: Deploy & Integrate"
parent: Challenges
nav_order: 7
---

<div class="hero-panel challenge-hero">
  <span class="hero-kicker">Challenge 06 • From demo to app</span>
  <h1>Deploy &amp; Integrate</h1>
  <p class="hero-tagline">The final challenge is about product shape. Participants publish their AI workflow behind an endpoint, call it from application code, and think through what changes when an experiment becomes something another system or another user depends on.</p>
  <div class="meta-strip">
    <span class="meta-badge">⏱️ 1 hr</span>
    <span class="difficulty-badge difficulty-5">⭐⭐⭐⭐⭐ Expert stretch</span>
    <span class="meta-badge">🔌 Endpoint integration</span>
  </div>
</div>

## What this challenge is about

Deploying is the transition from workshop output to usable service. Instead of keeping logic inside a portal session, teams publish a managed endpoint that can be called from a web app, script, or downstream system through an authenticated REST API.

This is also where production thinking starts to matter. Teams are now packaging and deploying the **University Q&A Assistant** they shaped in Challenges 02–05, so even a minimal Flask integration surfaces real concerns: secret handling, retries, logging, latency, and release workflow. That makes this challenge a useful bridge from hackathon experimentation to responsible app delivery.

## What participants will build

<div class="quick-grid">
  <div class="quick-card">
    <h3>A managed endpoint</h3>
    <p>A published deployment that exposes the team’s model or flow through a stable, callable interface.</p>
  </div>
  <div class="quick-card">
    <h3>A Flask-connected experience</h3>
    <p>A lightweight application layer that sends requests to the endpoint and renders the response to a user.</p>
  </div>
  <div class="quick-card">
    <h3>A production-minded checklist</h3>
    <p>An initial plan for secrets, CI/CD, observability, error handling, and rollout decisions beyond the hackathon.</p>
  </div>
</div>

## Key concepts

<div class="callout-info" markdown="1">
- **Managed online endpoint**: a hosted inference surface for real-time requests.
- **REST API**: the HTTP interface your app uses to send inputs and receive predictions or responses.
- **Flask**: a lightweight Python web framework that is perfect for a simple integration demo.
- **Deployment**: the packaged and published version of your flow or model for external use.
- **CI/CD**: the automation path for validating, packaging, and releasing changes safely.
</div>

## Learn before you build

- [Deploy a flow as a managed online endpoint](https://learn.microsoft.com/azure/ai-foundry/how-to/flow-deploy): deployment entry point for the hackathon flow.
- [Managed online endpoints overview](https://learn.microsoft.com/azure/machine-learning/concept-endpoints-online): Azure-hosted real-time deployment guidance.
- [Flask quickstart](https://flask.palletsprojects.com/en/stable/quickstart/): lightweight path for the local integration app.
- [Requests: HTTP for Humans](https://requests.readthedocs.io/en/latest/): REST request patterns and response handling.

<div class="callout-info" markdown="1">
**Working in Codespaces?** The scripts and starter files for this challenge live in `challenges/challenge-06-deploy/` inside the repository. Open the repo in Codespaces (button in the page header), navigate to that folder, and run the commands shown below from there.
</div>

## Step-by-step

### Step 1: Package the Prompt Flow

Start from the Prompt Flow version you validated in Challenges 04 and 05.

Before deploying, confirm:

- the flow works end to end
- required connections are valid
- prompt, retrieval, and formatting steps are saved
- any needed environment settings are documented

Think of this as the version you would be comfortable showing to a real stakeholder.

### Step 2: Deploy to a Managed Online Endpoint

In Microsoft Foundry, deploy the flow to a **Managed Online Endpoint**.

As you configure deployment, pay attention to:

- endpoint name
- authentication method
- instance or scaling settings
- deployment status and readiness

Wait for the endpoint to report that it is ready before debugging client code.

### Step 3: Test the endpoint with REST

Test the deployment outside the studio.

Example `curl` pattern:

```bash
curl -X POST "$ENDPOINT_URL" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $ENDPOINT_KEY" \
  -d '{
    "question": "What documents are needed for financial aid?"
  }'
```

Example Python client pattern:

```python
import os
import requests

endpoint = os.getenv("UNIVERSITY_QA_ENDPOINT")
key = os.getenv("UNIVERSITY_QA_KEY")

payload = {"question": "How do I contact campus housing?"}
headers = {
    "Content-Type": "application/json",
    "Authorization": f"Bearer {key}",
}

response = requests.post(endpoint, json=payload, headers=headers, timeout=30)
print(response.json())
```

Make sure the endpoint returns a valid response before you move on to the web app.

### Step 4: Create the Flask web app

Create this file:

```text
challenges/challenge-06-deploy/app.py
```

Your app should:

- display a text input form
- send the question to the managed endpoint
- show the answer
- show source citations when available

Starter scaffold:

```python
import os
import requests
from dotenv import load_dotenv
from flask import Flask, render_template_string, request

load_dotenv()
app = Flask(__name__)

HTML = """
<!doctype html>
<title>University Q&A Assistant</title>
<h1>Northfield University Q&A Assistant</h1>
<form method="post">
  <input type="text" name="question" style="width: 420px;" placeholder="Ask a university question">
  <button type="submit">Ask</button>
</form>
{% if answer %}
  <h2>Answer</h2>
  <p>{{ answer }}</p>
{% endif %}
{% if citations %}
  <h3>Sources</h3>
  <ul>
  {% for citation in citations %}
    <li>{{ citation }}</li>
  {% endfor %}
  </ul>
{% endif %}
"""

@app.route("/", methods=["GET", "POST"])
def home():
    answer = None
    citations = []
    if request.method == "POST":
        question = request.form["question"]
        # TODO: call managed endpoint and map the response to answer/citations
    return render_template_string(HTML, answer=answer, citations=citations)

if __name__ == "__main__":
    app.run(debug=True)
```

### Step 5: Run the Flask app in the devcontainer

Install any missing dependencies and run the app locally.

Suggested check:

```bash
python challenges/challenge-06-deploy/app.py
```

Open the local port, submit a question, and verify that the UI renders both the answer and citations.

### Step 6: Optional cloud deployment

If time allows, deploy the Flask app to **Azure App Service** or **Azure Container Apps**.

This is optional, but it is a strong final demo because it shows both the AI endpoint and the user-facing app running in Azure.

## Success Criteria

- [ ] Flow deployed to managed online endpoint
- [ ] Endpoint tested via REST call and returns a valid response
- [ ] Flask app created and running locally
- [ ] Web UI shows response and citations
- [ ] Bonus: Flask app deployed to Azure App Service or Container Apps

## Tips

- **Endpoint authentication**: check whether your deployment expects a bearer token, key, or another auth pattern.
- **CORS and frontend choices**: for this challenge, a server-side Flask app is simpler than calling the endpoint directly from browser JavaScript.
- **Cost management**: stop or scale down endpoints after the hackathon if the event guidance requires it.
- Endpoint cold starts can look like failures. Confirm readiness and retry once before rewriting your app.
- Keep the UI simple. The goal is integration, not front-end polish.

## Advanced

If you finish early:

- Add **streaming responses** to the Flask app
- Support **conversation history** so the assistant can handle follow-up questions
- Sketch a **CI/CD flow** for updating the endpoint when the Prompt Flow changes

<nav class="page-nav">
  <a href="{{ '/challenges/challenge-05' | relative_url }}">← Previous</a>
  <a href="{{ '/resources' | relative_url }}">Next →</a>
</nav>
