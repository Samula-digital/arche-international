#!/usr/bin/env bash
set -u

INTERVAL_SECONDS="${AUTO_DEPLOY_INTERVAL_SECONDS:-6}"
BRANCH="${AUTO_DEPLOY_BRANCH:-main}"
REMOTE="${AUTO_DEPLOY_REMOTE:-origin}"

cd "$(dirname "$0")/.."

echo "Auto deploy started at $(date)"
echo "Watching $(pwd)"
echo "Pushing to ${REMOTE}/${BRANCH}"

while true; do
  if [ -f .auto-deploy.lock ]; then
    sleep "$INTERVAL_SECONDS"
    continue
  fi

  if ! git diff --quiet || ! git diff --cached --quiet || [ -n "$(git ls-files --others --exclude-standard)" ]; then
    touch .auto-deploy.lock
    message="Auto deploy $(date '+%Y-%m-%d %H:%M:%S')"

    echo "[$(date)] Changes detected"
    git add -A

    if git diff --cached --quiet; then
      echo "[$(date)] No staged changes after add"
      rm -f .auto-deploy.lock
      sleep "$INTERVAL_SECONDS"
      continue
    fi

    if git commit -m "$message"; then
      if ! git push "$REMOTE" "$BRANCH"; then
        echo "[$(date)] Push failed, trying rebase then push"
        git pull --rebase "$REMOTE" "$BRANCH" && git push "$REMOTE" "$BRANCH"
      fi
    else
      echo "[$(date)] Commit failed"
    fi

    rm -f .auto-deploy.lock
  fi

  sleep "$INTERVAL_SECONDS"
done
