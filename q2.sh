#!/usr/bin/env bash
set -euo pipefail

OWNER="$(gh api user --jq .login)"
COLLAB="${COLLAB:?Run: export COLLAB=collaborator_username}"

echo "Owner: $OWNER"
echo "Collaborator: $COLLAB"

gh repo view "$OWNER/devopsLab6"

gh api --method PUT \
  "repos/$OWNER/devopsLab6/collaborators/$COLLAB"

echo "Collaborator invitation requested."
