#!/usr/bin/env bash
set -euo pipefail

OWNER="$(gh api user --jq .login)"
COLLAB="${COLLAB:?Run: export COLLAB=collaborator_username}"

echo "Checking respository: $OWNER/devopsLab6"
gh repo view "$OWNER/devopsLab6"



echo
echo "Checking collaborator permissions..."
gh api "repos/$OWNER/devopsLab6/collaborators/$COLLAB/permission" \
  --jq '{username: .user.login, permission: .permission, role: .role_name}'

