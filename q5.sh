#!/usr/bin/env bash
set -euo pipefail

OWNER="$(gh api user --jq .login)"
REPO="$OWNER/devopsLab6"

echo "Respository: $REPO"

if ! gh label list --repo "$REPO" --limit 200 \
  --json name --jq '.[].name' | grep -Fxq 'enhancement'; then
  gh label create enhancement \
   --repo "$REPO" \
   --description "New feature or improvement"
fi

gh issue create \
  --repo "$REPO" \
  --title "create helloworld echo file" \
  --body "echo Hi Pearse from Timi" \
  --assignee "@me" \
  --label "enhancement"

echo "Q5 completed successfully."
