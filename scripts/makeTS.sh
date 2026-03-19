#!/usr/bin/env bash

if [ $# -eq 0 ]; then
  echo "Usage: $(basename "$0") <project-name>"
  exit 1
fi

if ! command -v npm >/dev/null; then
  echo "npm required but not installed."
  exit 1
fi

# Store the project in its own variable
project="$1"

# Try create the project directory
mkdir "$project" || {
  # If the
  echo "Directory already exists"
  exit 1
}

# Run the project scaffolding in a subshell
(
  cd "$project"

  mkdir -p dist src tests
  touch src/index.ts

  echo -e "node_modules/\ndist/" > .gitignore

  npm init -y
  echo ""

  npm i -D typescript
  echo ""

  npx tsc --version && npx tsc --init
  echo ""

  if command -v git >/dev/null; then
    git init
    echo ""
  fi

  echo "TypeScript project created"
)
