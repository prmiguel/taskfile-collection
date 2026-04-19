# AI Agent Instructions

This repository is a small Taskfile-based automation project.

## What to know

- The only project metadata is in `Taskfile.yml`.
- There is no application source tree, package manifest, or standard build system in this repository.
- `Taskfile.yml` defines the available commands and is the authoritative entrypoint for automation.

## Key file

- `Taskfile.yml` — contains task definitions and commands.

## How to act

- Inspect `Taskfile.yml` first when asked about project behavior or automation.
- If a task change is requested, update `Taskfile.yml` using the existing Taskfile schema.
- Do not assume there are backend/frontend frameworks, tests, or package managers unless the user adds them.

## Existing tasks

- `default` — prints a greeting message.
- `install_vscode` — installs Visual Studio Code on Debian/Ubuntu systems.
- `install_chrome` — installs Google Chrome on Debian/Ubuntu systems.

## When in doubt

- Ask the user for clarification before adding non-Taskfile files or creating a broader application structure.
