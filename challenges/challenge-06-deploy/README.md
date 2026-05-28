# Challenge 06: Deploy & Integrate

## Introduction
A good prototype is not the finish line. Real AI applications need a deployment target, an interface, and a way for users to interact with the system outside the studio.

In this final challenge, you will take the **University Q&A Assistant** you built and improved in earlier challenges and move it toward a production-style setup. You will deploy it as a **managed online endpoint** and connect it to a simple Python web app.

## What you'll build
You will:

1. Package your Prompt Flow as a deployable application
2. Deploy it to a **Managed Online Endpoint** in Azure AI Foundry
3. Test the endpoint with a REST call
4. Build a simple **Flask** web app that sends student questions to the endpoint and shows responses with citations

This challenge turns the project into a working end-to-end demo teams can showcase.

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
In Azure AI Foundry, deploy the flow to a **Managed Online Endpoint**.

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

## Learning Resources
- [Deploy flows and apps in Azure AI Foundry](https://learn.microsoft.com/azure/ai-foundry/how-to/deploy-flow)
- [Managed online endpoints overview](https://learn.microsoft.com/azure/machine-learning/concept-endpoints-online)
- [Flask quickstart](https://flask.palletsprojects.com/en/stable/quickstart/)
- [Requests: HTTP for Humans](https://requests.readthedocs.io/en/latest/)

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
