#!/usr/bin/env bash
set -Eeuo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
RESET='\033[0m'

info() {
  printf "%b%s%b\n" "$CYAN" "$1" "$RESET"
}

success() {
  printf "%b%s%b\n" "$GREEN" "$1" "$RESET"
}

warn() {
  printf "%b%s%b\n" "$YELLOW" "$1" "$RESET"
}

fail() {
  printf "%b%s%b\n" "$RED" "$1" "$RESET" >&2
  exit 1
}

require_command() {
  command -v "$1" >/dev/null 2>&1 || fail "Required command not found: $1"
}

ensure_extension() {
  local extension_name="$1"
  if az extension show --name "$extension_name" >/dev/null 2>&1; then
    success "Azure CLI extension '$extension_name' is already installed."
  else
    info "Installing Azure CLI extension '$extension_name'"
    az extension add --name "$extension_name" --yes >/dev/null
    success "Installed Azure CLI extension '$extension_name'."
  fi
}

get_workspace_field() {
  local workspace_name="$1"
  local query="$2"
  az ml workspace show \
    --name "$workspace_name" \
    --resource-group "$RESOURCE_GROUP" \
    --query "$query" \
    --output tsv 2>/dev/null || true
}

get_project_endpoint() {
  local endpoint
  endpoint="$(get_workspace_field "$FOUNDRY_PROJECT_NAME" 'discovery_url')"
  [[ -n "$endpoint" && "$endpoint" != "null" ]] || endpoint="$(get_workspace_field "$FOUNDRY_PROJECT_NAME" 'discoveryUrl')"
  [[ -n "$endpoint" && "$endpoint" != "null" ]] || endpoint="$(get_workspace_field "$FOUNDRY_PROJECT_NAME" 'properties.discoveryUrl')"
  [[ -n "$endpoint" && "$endpoint" != "null" ]] || endpoint="$(get_workspace_field "$FOUNDRY_PROJECT_NAME" 'properties.discovery_url')"
  if [[ -z "$endpoint" || "$endpoint" == "null" ]]; then
    endpoint="https://${FOUNDRY_PROJECT_NAME}.api.azureml.ms"
    warn "Could not resolve the project discovery URL from Azure CLI; using ${endpoint} as a fallback."
  fi
  printf "%s" "$endpoint"
}

get_project_key() {
  local key
  key="$(az ml workspace show-keys --name "$FOUNDRY_PROJECT_NAME" --resource-group "$RESOURCE_GROUP" --query primaryKey --output tsv 2>/dev/null || true)"
  [[ -n "$key" && "$key" != "null" ]] || key="$(az ml workspace list-keys --name "$FOUNDRY_PROJECT_NAME" --resource-group "$RESOURCE_GROUP" --query primaryKey --output tsv 2>/dev/null || true)"
  if [[ -z "$key" || "$key" == "null" ]]; then
    key="<retrieve-from-ai-foundry-portal>"
    warn "Could not retrieve an Azure AI project key from Azure CLI. Update AZURE_AI_KEY manually after provisioning if needed."
  fi
  printf "%s" "$key"
}

# Verify required tooling and Azure authentication up front.
require_command az
if ! az account show >/dev/null 2>&1; then
  fail "Azure CLI is not authenticated. Run 'az login' first."
fi

# Allow organizers to override names/region through environment variables.
LOCATION="${LOCATION:-eastus}"
RESOURCE_GROUP="${RESOURCE_GROUP:-wth-ai-foundry-rg}"
FOUNDRY_HUB_NAME="${FOUNDRY_HUB_NAME:-wth-ai-foundry-hub}"
FOUNDRY_PROJECT_NAME="${FOUNDRY_PROJECT_NAME:-wth-ai-foundry-project}"
OPENAI_ACCOUNT_NAME="${OPENAI_ACCOUNT_NAME:-wthaifoundryopenai}"
OPENAI_DEPLOYMENT_NAME="${OPENAI_DEPLOYMENT_NAME:-gpt-4o-mini}"
SEARCH_SERVICE_NAME="${SEARCH_SERVICE_NAME:-wthaifoundrysearch}"
SEARCH_SKU="${SEARCH_SKU:-basic}"

# Use an explicit subscription when one has been supplied.
if [[ -n "${AZURE_SUBSCRIPTION_ID:-}" ]]; then
  info "Setting Azure subscription to ${AZURE_SUBSCRIPTION_ID}"
  az account set --subscription "$AZURE_SUBSCRIPTION_ID"
fi

# Install the Azure ML extension used for AI Foundry hub/project creation.
info "Ensuring required Azure CLI extensions are available"
ensure_extension ml

# Register the providers backing AI Foundry, Azure OpenAI, and Azure AI Search.
info "Registering Azure resource providers used by the hackathon"
az provider register --namespace Microsoft.CognitiveServices >/dev/null
az provider register --namespace Microsoft.MachineLearningServices >/dev/null
az provider register --namespace Microsoft.Search >/dev/null
success "Provider registration submitted."

# Create the resource group once, then reuse it on later runs.
info "Creating or reusing the resource group"
if [[ "$(az group exists --name "$RESOURCE_GROUP")" == "true" ]]; then
  success "Resource group '$RESOURCE_GROUP' already exists."
else
  az group create --name "$RESOURCE_GROUP" --location "$LOCATION" --output none
  success "Created resource group '$RESOURCE_GROUP'."
fi

# Create the Azure AI Foundry hub if it does not already exist.
info "Creating or reusing the Azure AI Foundry hub"
if az ml workspace show --name "$FOUNDRY_HUB_NAME" --resource-group "$RESOURCE_GROUP" >/dev/null 2>&1; then
  success "Hub '$FOUNDRY_HUB_NAME' already exists."
else
  az ml workspace create \
    --name "$FOUNDRY_HUB_NAME" \
    --resource-group "$RESOURCE_GROUP" \
    --location "$LOCATION" \
    --kind hub \
    --output none
  success "Created hub '$FOUNDRY_HUB_NAME'."
fi
HUB_ID="$(az ml workspace show --name "$FOUNDRY_HUB_NAME" --resource-group "$RESOURCE_GROUP" --query id --output tsv)"

# Create the Foundry project attached to the hub when needed.
info "Creating or reusing the Azure AI Foundry project"
if az ml workspace show --name "$FOUNDRY_PROJECT_NAME" --resource-group "$RESOURCE_GROUP" >/dev/null 2>&1; then
  success "Project '$FOUNDRY_PROJECT_NAME' already exists."
else
  az ml workspace create \
    --name "$FOUNDRY_PROJECT_NAME" \
    --resource-group "$RESOURCE_GROUP" \
    --location "$LOCATION" \
    --kind project \
    --hub-id "$HUB_ID" \
    --output none
  success "Created project '$FOUNDRY_PROJECT_NAME'."
fi

# Create the Azure OpenAI account and deploy gpt-4o-mini for model access.
info "Creating or reusing the Azure OpenAI resource"
if az cognitiveservices account show --name "$OPENAI_ACCOUNT_NAME" --resource-group "$RESOURCE_GROUP" >/dev/null 2>&1; then
  success "Azure OpenAI account '$OPENAI_ACCOUNT_NAME' already exists."
else
  az cognitiveservices account create \
    --name "$OPENAI_ACCOUNT_NAME" \
    --resource-group "$RESOURCE_GROUP" \
    --kind OpenAI \
    --sku S0 \
    --location "$LOCATION" \
    --yes \
    --output none
  success "Created Azure OpenAI account '$OPENAI_ACCOUNT_NAME'."
fi

# Create the default model deployment once, then leave it in place.
info "Creating or reusing the gpt-4o-mini deployment"
if az cognitiveservices account deployment show \
  --name "$OPENAI_ACCOUNT_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --deployment-name "$OPENAI_DEPLOYMENT_NAME" >/dev/null 2>&1; then
  success "Deployment '$OPENAI_DEPLOYMENT_NAME' already exists."
else
  az cognitiveservices account deployment create \
    --name "$OPENAI_ACCOUNT_NAME" \
    --resource-group "$RESOURCE_GROUP" \
    --deployment-name "$OPENAI_DEPLOYMENT_NAME" \
    --model-name gpt-4o-mini \
    --model-version 1 \
    --model-format OpenAI \
    --output none
  success "Created deployment '$OPENAI_DEPLOYMENT_NAME'."
fi

# Provision Azure AI Search for the RAG challenge if it is missing.
info "Creating or reusing the Azure AI Search service"
if az search service show --name "$SEARCH_SERVICE_NAME" --resource-group "$RESOURCE_GROUP" >/dev/null 2>&1; then
  success "Search service '$SEARCH_SERVICE_NAME' already exists."
else
  az search service create \
    --name "$SEARCH_SERVICE_NAME" \
    --resource-group "$RESOURCE_GROUP" \
    --sku "$SEARCH_SKU" \
    --location "$LOCATION" \
    --output none
  success "Created search service '$SEARCH_SERVICE_NAME'."
fi

# Resolve the connection details and write a fresh .env file for organizers.
info "Collecting connection details"
SUBSCRIPTION_ID="$(az account show --query id --output tsv)"
PROJECT_ENDPOINT="$(get_project_endpoint)"
PROJECT_KEY="$(get_project_key)"
OPENAI_ENDPOINT="$(az cognitiveservices account show --name "$OPENAI_ACCOUNT_NAME" --resource-group "$RESOURCE_GROUP" --query properties.endpoint --output tsv)"
OPENAI_KEY="$(az cognitiveservices account keys list --name "$OPENAI_ACCOUNT_NAME" --resource-group "$RESOURCE_GROUP" --query key1 --output tsv)"
SEARCH_ENDPOINT="https://${SEARCH_SERVICE_NAME}.search.windows.net"
SEARCH_KEY="$(az search admin-key show --service-name "$SEARCH_SERVICE_NAME" --resource-group "$RESOURCE_GROUP" --query primaryKey --output tsv)"

cat > .env <<ENVFILE
# Azure AI Foundry Configuration
AZURE_AI_ENDPOINT=${PROJECT_ENDPOINT}
AZURE_AI_KEY=${PROJECT_KEY}

# Azure Subscription
AZURE_SUBSCRIPTION_ID=${SUBSCRIPTION_ID}
AZURE_RESOURCE_GROUP=${RESOURCE_GROUP}

# Azure OpenAI (if using directly)
AZURE_OPENAI_ENDPOINT=${OPENAI_ENDPOINT}
AZURE_OPENAI_API_KEY=${OPENAI_KEY}
AZURE_OPENAI_DEPLOYMENT_NAME=${OPENAI_DEPLOYMENT_NAME}

# Azure AI Search (for Challenge 04 RAG)
AZURE_SEARCH_ENDPOINT=${SEARCH_ENDPOINT}
AZURE_SEARCH_KEY=${SEARCH_KEY}
AZURE_SEARCH_INDEX_NAME=university-faq
ENVFILE

success "Provisioning complete. Connection details have been written to .env"
info "Next: run python resources/scripts/validate-environment.py"
