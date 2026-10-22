#!/usr/bin/env bash
set -euo pipefail

REPO="adebayotimi03-lgtm/devopsLab6"

echo "Merging pull request #2..."
gh pr merge 2 --repo "$REPO" --merge

echo "Pull request merge command completed."
