#!/usr/bin/env bash
set -Eeuo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RESET='\033[0m'

success() {
  printf "%b%s%b\n" "$GREEN" "$1" "$RESET"
}

warn() {
  printf "%b%s%b\n" "$YELLOW" "$1" "$RESET"
}

info() {
  printf "%b%s%b\n" "$CYAN" "$1" "$RESET"
}

info "Setting up the WTH AI Foundry Hackathon workspace..."

if [[ -f requirements.txt ]]; then
  info "Installing Python requirements from requirements.txt"
  pip install -r requirements.txt
  success "Python dependencies are installed."
else
  warn "requirements.txt was not found; skipping pip install."
fi

if [[ ! -f .env && -f .env.example ]]; then
  cp .env.example .env
  success "Created .env from .env.example"
elif [[ -f .env ]]; then
  warn ".env already exists; leaving it unchanged."
else
  warn ".env.example was not found; skipping environment bootstrap."
fi

printf "\n%b==============================================%b\n" "$GREEN" "$RESET"
printf "%b  Welcome to the WTH AI Foundry Hackathon!  %b\n" "$GREEN" "$RESET"
printf "%b==============================================%b\n\n" "$GREEN" "$RESET"

printf "%bChallenge quick links%b\n" "$CYAN" "$RESET"
printf "  • Challenge 00: challenges/challenge-00-setup/\n"
printf "  • Challenge 01: challenges/challenge-01-first-model/\n"
printf "  • Challenge 02: challenges/challenge-02-prompt-engineering/\n"
printf "  • Challenge 03: challenges/challenge-03-prompt-flow/\n"
printf "  • Challenge 04: challenges/challenge-04-rag/\n"
printf "  • Challenge 05: challenges/challenge-05-evaluation/\n"
printf "  • Challenge 06: challenges/challenge-06-deploy/\n"
printf "  • Docs site: docs/\n\n"

warn "Next steps:"
printf "  1. Run: az login\n"
printf "  2. Run: python resources/scripts/validate-environment.py\n"
