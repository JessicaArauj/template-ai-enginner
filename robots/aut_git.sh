#!/usr/bin/env bash
set -euo pipefail

# Simple helper to stage, commit and push changes in a consistent way.

COMMIT_TYPES=(
  "feat - new feature"
  "fix - bug fix"
  "chore - maintenance/refinement"
  "docs - documentation"
  "refactor - code improvement"
  "test - tests"
  "perf - performance"
  "style - formatting"
)

usage() {
  cat <<'EOF'
Usage: script/git/aut_git.sh [options]

Options:
  -m, --message TEXT   Commit message (if omitted you will be prompted)
  -b, --branch  NAME   Branch to push (defaults to current branch)
      --no-push        Skip git push (stage+commit only)
  -h, --help           Show this help

Examples:
  script/git/aut_git.sh -m "feat: add local backend"
  script/git/aut_git.sh --no-push
EOF
}

MESSAGE=""
BRANCH=""
PUSH_ENABLED=1

prompt_commit_message() {
  echo "Choose the commit type:"
  local i=1
  for entry in "${COMMIT_TYPES[@]}"; do
    printf "  %d) %s\n" "$i" "$entry"
    ((i++))
  done
  read -rp "Type (1-${#COMMIT_TYPES[@]}): " selection
  if [[ -z "$selection" ]]; then
    selection=1
  fi
  if ! [[ "$selection" =~ ^[0-9]+$ ]] || ((selection < 1 || selection > ${#COMMIT_TYPES[@]})); then
    echo "Invalid selection; defaulting to 'feat'."
    selection=1
  fi
  local chosen="${COMMIT_TYPES[$((selection-1))]}"
  local type_token="${chosen%% *}"

  read -rp "Scope (backend): " scope
  read -rp "Short summary: " summary
  summary="$(echo "$summary" | xargs)"
  if [[ -z "$summary" ]]; then
    echo "Summary is required."
    exit 1
  fi

  if [[ -n "$scope" ]]; then
    MESSAGE="${type_token}(${scope}): ${summary}"
  else
    MESSAGE="${type_token}: ${summary}"
  fi
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -m|--message)
      MESSAGE="${2-}"
      shift 2
      ;;
    -b|--branch)
      BRANCH="${2-}"
      shift 2
      ;;
    --no-push)
      PUSH_ENABLED=0
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --)
      shift
      break
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if ! git rev-parse --git-dir >/dev/null 2>&1; then
  echo "Error: this script must be run inside a git repository." >&2
  exit 1
fi

if [[ -z "$BRANCH" ]]; then
  BRANCH="$(git rev-parse --abbrev-ref HEAD)"
fi

if [[ -z "$MESSAGE" ]]; then
  prompt_commit_message
fi

echo "Staging all changes..."
git add -A

if git diff --cached --quiet; then
  echo "Nothing to commit."
  exit 0
fi

echo "Committing..."
git commit -m "$MESSAGE"

if [[ $PUSH_ENABLED -eq 1 ]]; then
  echo "Pushing to origin/$BRANCH..."
  git push origin "$BRANCH"
else
  echo "Push skipped (use --no-push to keep local)."
fi

echo "Done."
