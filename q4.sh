#!/usr/bin/env bash
set -euo pipefail

OWNER="$(gh api user --jq .login)"
COLLAB="${COLLAB:?Run: export COLLAB=collaborator_username}"

echo "Respository: $OWNER/devopsLab6"
echo "Collaborator to remove: $COLLAB"

gh api --method DELETE \
  "repos/$OWNER/devopsLab6/collaborators/$COLLAB"

echo "Collaborator removal request completed."

echo "Checking remaining collaborator permissions..."

PERMISSION=$(gh api \
  "repos/$OWNER/devopsLab6/collaborators/$COLLAB/permission" \
  --jq '.permission')

echo "Current permission: $PERMISSION"

if [[ "$PERMISSION" == "admin" ||
      "$PERMISSION" == "maintain" ||
      "$PERMISSION" == "write" ]]; then
  echo "WARNING: Collaborator still has write access."
else
 echo "Collaborator does not have write permission."
fi

echo "Now test a push using the collaborator's own account."
