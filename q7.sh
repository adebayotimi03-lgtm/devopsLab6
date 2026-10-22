#!/usr/bin/env bash
set -euo pipefail

REPO="adebayotimi03-lgtm/devopsLab6"

echo "Creating a pull request from Q12345 to main..."
gh pr create \
  --repo "$REPO" \
  --base main \
  --head Q12345 \
  --title "Merge Q1-Q5 lab scripts" \
  --body "Pull request for the Q1-Q5 lab scripts."
