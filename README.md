# Bash Project Scaffolding Scripts

A collection of simple programming project scaffolding scripts
written in Bash

- Author: Ethan Kletschke
- Version: `0.1.0`
- Developed on: Ubuntu (WSL2)
- License: MIT

## Table of Contents

- [Bash Project Scaffolding Scripts](#bash-project-scaffolding-scripts)
  - [Table of Contents](#table-of-contents)
  - [Scripts](#scripts)
    - [`makeTS`](#makets)
    - [`makeCob`](#makecob)
      - [CLI Options](#cli-options)
      - [Handling Edge Cases Using `getopts` and Boolean Flags](#handling-edge-cases-using-getopts-and-boolean-flags)

## Scripts

### `makeTS`

`makeTS` scaffolds a TypeScript project using `npm` and `git`.

Usage: `makeTS <project-name>`

Requirements:

- `npm` (Node.js Package Manager).
  - The command will not continue if `npm` is not installed.
- `git` (Git).

### `makeCob`

`makeCob` scaffolds a GnuCOBOL project.

#### CLI Options

`makeCob` takes the following command line options via `getopts`:

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

#### Handling Edge Cases Using `getopts` and Boolean Flags

While experimenting with `getopts`, I thought of something: What if the user
provides contradicting flags, like specifying a minimal project setup flag AND
a full project setup flag?

In `makeCob`, I attempted to handle edge cases like this by using Boolean
flags for each option. This, coupled with not running any commands within the
`getopts` loop allows for the most recent, possibly conflicting
setup flag to take effect. This means that if the user specified `-bf`, the
full project structure is generated, and conversely, if `-fb` is specified,
the "Bare Mode" project will be generated. This also allows for the `-h` flag to
work as intended without running alongside other flags.
