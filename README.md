# Bash Project Scaffolding Scripts

A collection of simple programming project scaffolding scripts
written in Bash

- Author: Ethan Kletschke
- Version: `0.0.4`
- Developed on: Ubuntu (WSL2)
- License: MIT

## Table of Contents

- [Bash Project Scaffolding Scripts](#bash-project-scaffolding-scripts)
  - [Table of Contents](#table-of-contents)
  - [Scripts](#scripts)
    - [`makeTS`](#makets)
    - [`makeCob`](#makecob)

## Scripts

### `makeTS`

`makeTS` scaffolds a TypeScript project using `npm` and `git`.

Usage: `makeTS <project-name>`

Requirements:

- `npm` (Node.js Package Manager).
  - The command will not continue if `npm` is not installed.
- `git` (Git).

### `makeCob`

`makeCob` scaffolds a GnuCOBOL project. It takes the following command line
options via `getopts`:

- `-b` (Bare Mode) => Creates a minimal, flattened project structure. This
  means that there will be no `src` directory or `bin` directory. This can
  aid beginners to the COBOL language who aren't familiar with multi-folder
  project layouts.
- `-f` (Full Project Mode) => Creates a full project structure (same as
  specifying `-g`, `-s`, and `-m`, or specifying `-gsm`)
- `-g` => Creates a Git repository in the project directory
- `-h` => Shows the usage (help) menu and exits the script
- `-m` => Initialises a makefile for the project
- `-s` => Initialises Bash build scripts for the project
- `-v` => Enable verbose output for `makeCob`
- `-x` => Uses fixed format code instead of free format code when generating
  the project.
