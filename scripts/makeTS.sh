#!/usr/bin/env bash

# If no arguments are provided
if [ $# -eq 0 ]; then
  # Display a help message and exit the script
  echo "Usage: $(basename "$0") <project-name>"
  exit 1
fi

# TODO -> Test the argument against -z

# If NPM isn't installed
if ! command -v npm >/dev/null; then
  # Display an error message and exit
  echo "npm required but not installed."
  exit 1
fi

# Store the project in its own variable
project="$1"

# Try create the project directory
mkdir "$project" || {
  # If the directory exists, exit with code 1
  echo "Directory already exists"
  exit 1
}

# Run the project scaffolding in a subshell
(
  cd "$project"

  # Create the dist, src, and tests directories
  mkdir -p dist src tests

  # Create an empty index.ts file
  touch src/index.ts

  # Create a .gitignore
  echo -e "node_modules/\ndist/" > .gitignore

  # Initialise an NPM project
  npm init -y

  # Print a blank line for readability
  echo ""

  # Install TypeScript as a dev dependency
  npm i -D typescript

  # Blank line for readability
  echo ""

  # Initialise a TypeScript project
  npx tsc --version && npx tsc --init

  # Blank line for readability
  echo ""

  # If git is installed
  if command -v git >/dev/null; then
    # Initialise a repository
    git init

    # Blank line for readability
    echo ""
  fi

  # Message to display when the script is done
  echo "TypeScript project created"
)
