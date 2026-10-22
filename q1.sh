#!/usr/bin/env bash
set -euo pipefail

gh repo create devopsLab6 --public --description "DevOps Lab 6"

gh repo view "$(gh api user --jq .login)/devopsLab6" \
  --json name,visibility,url
