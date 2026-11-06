#!/bin/sh
# Push this site (moveyolife-site) to GitHub.
# Usage, from anywhere:  sh ~/Sites/moveyolife-site/deploy.sh "What changed"
set -e
cd "$(dirname "$0")"
msg="${1:-Update site}"
git add -A
if git diff --cached --quiet; then
  echo "No local changes to commit."
else
  git commit -m "$msg"
fi
git pull --rebase
git push
echo ""
echo "Deployed. Live in about a minute: https://kedc13.github.io/moveyolife-site/"
