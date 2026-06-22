# AI Agent Instructions

This repository is a Taskfile-based automation collection for system setup and dev tool installation.

## Structure

- `Taskfile.yml` — main entrypoint, includes all sub-files
- `system/Taskfile.yml` — system tasks (update, upgrade, cleanup)
- `tools/vscode.yml` — VS Code + Cursor
- `tools/chrome.yml` — Google Chrome
- `tools/gh-cli.yml` — GitHub CLI
- `tools/intellij.yml` — IntelliJ IDEA CE
- `ci/Taskfile.yml` — CI validation helpers

## Usage

Tasks are namespaced by include name:

- `vscode:install` — Install VS Code
- `vscode:install-cursor` — Install Cursor editor
- `chrome:install` — Install Google Chrome
- `gh:install` — Install GitHub CLI
- `intellij:install` — Install IntelliJ IDEA CE
- `system:update` — Update apt package lists
- `system:upgrade` — Upgrade all packages
- `system:cleanup` — Remove unused packages
- `ci:check-taskfile` — Validate taskfile YAML
- `ci:lint` — Run yamllint

## Conventions

- Use `includes:` in the main `Taskfile.yml` to add new sub-files
- Group related tasks into a single file under `tools/` or `system/`
- Use `desc` on every task
- Keep `silent: true` for install commands to reduce noise
