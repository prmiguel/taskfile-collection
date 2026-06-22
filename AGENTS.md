# AI Agent Instructions

This repository is a Taskfile-based automation collection for system setup and dev tool installation across Ubuntu, Arch Linux, macOS, and Windows.

## Structure

- `Taskfile.yml` — main entrypoint, includes all sub-files
- `system/Taskfile.yml` — system tasks (update, upgrade, cleanup, snap)
- `tools/vscode.yml` — VS Code, VS Code Insiders, Cursor
- `tools/chrome.yml` — Google Chrome
- `tools/gh-cli.yml` — GitHub CLI
- `tools/intellij.yml` — IntelliJ IDEA CE
- `tools/cursor.yml` — Cursor AI editor + CLI
- `tools/windsurf.yml` — Windsurf AI editor
- `tools/antigravity.yml` — Antigravity (Docker)
- `tools/claude.yml` — Claude CLI + Desktop
- `tools/docker.yml` — Docker CLI, Engine, Desktop
- `tools/git.yml` — Git
- `tools/node.yml` — nvm + Node.js (last 5 versions)
- `tools/sdkman.yml` — SDKMAN
- `ci/Taskfile.yml` — CI validation helpers

## Tasks

### System
- `system:update` — Update package lists (apt/pacman/brew/winget)
- `system:upgrade` — Upgrade all packages
- `system:cleanup` — Remove unused packages, clean cache
- `system:snap-install PACKAGE=<name>` — Install a snap package (Ubuntu)

### Tools
- `vscode:install` — VS Code
- `vscode:install-insiders` — VS Code Insiders
- `vscode:install-cursor` — Cursor editor (legacy, prefer cursor:install)
- `chrome:install` — Google Chrome
- `gh:install` — GitHub CLI
- `intellij:install` — IntelliJ IDEA CE
- `cursor:install` — Cursor AI editor
- `cursor:install-cli` — Cursor CLI in PATH
- `windsurf:install` — Windsurf editor
- `antigravity:install` — Antigravity via Docker
- `claude:install-cli` — Claude CLI (npm)
- `claude:install-desktop` — Claude Desktop app
- `docker:setup-repo` — Add Docker apt repo (Ubuntu)
- `docker:install-cli` — Docker CLI (client only)
- `docker:install-engine` — Docker Engine (client + daemon)
- `docker:install-desktop` — Docker Desktop
- `git:install` — Git
- `node:install-nvm` — nvm (Node Version Manager)
- `node:install-18` — Node.js 18
- `node:install-20` — Node.js 20
- `node:install-22` — Node.js 22
- `node:install-23` — Node.js 23
- `node:install-24` — Node.js 24
- `sdkman:install` — SDKMAN

### CI
- `ci:check-taskfile` — Validate taskfile YAML
- `ci:lint` — Run yamllint

## Supported Platforms

| Platform | Detection | Manager |
|----------|-----------|---------|
| Ubuntu | `test -f /etc/debian_version` + `platforms: [linux]` | `apt`, `snap` |
| Arch Linux | `test -f /etc/arch-release` + `platforms: [linux]` | `pacman`, `yay` |
| macOS | `platforms: [darwin]` | `brew` |
| Windows | `platforms: [windows]` | `winget` |

## Conventions

- Use `includes:` in the main `Taskfile.yml` to add new sub-files
- Group related tasks into a single file under `tools/` or `system/`
- Use `desc` on every task
- Keep `silent: true` for install commands to reduce noise
- For Linux distro-specific commands, use `platforms: [linux]` + `if: test -f <release-file>`
- For macOS/Windows, use `platforms: [darwin]` / `platforms: [windows]`
