# Taskfile Collection

A centralized collection of [Taskfile](https://taskfile.dev) definitions for automating system setup, tool installation, and common dev workflows across Linux and macOS.

## What is Task?

[Task](https://taskfile.dev) is a task runner / build tool that aims to be simpler and easier to use than GNU Make. Tasks are defined in YAML (`Taskfile.yml`) and support variables, dependencies, platforms, and conditionals out of the box.

## Installation

### Linux (Debian/Ubuntu)

```sh
curl -1sLf 'https://dl.cloudsmith.io/public/task/task/setup.deb.sh' | sudo -E bash
sudo apt install task
```

### Linux (Fedora/RHEL)

```sh
curl -1sLf 'https://dl.cloudsmith.io/public/task/task/setup.rpm.sh' | sudo -E bash
sudo dnf install task
```

### Linux (Arch)

```sh
sudo pacman -S go-task
```

### Linux (Alpine)

```sh
curl -1sLf 'https://dl.cloudsmith.io/public/task/task/setup.alpine.sh' | sudo -E bash
apk add task
```

### macOS

```sh
brew install go-task
```

### Cross-platform (npm)

```sh
npm install -g @go-task/cli
```

### Install script (any OS)

```sh
sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b ~/.local/bin
```

See [taskfile.dev/installation](https://taskfile.dev/installation) for more options.

## Directory Structure

Taskfiles are organized by category. Each file covers a related set of tasks.

```
taskfile-collection/
├── Taskfile.yml          # Main entrypoint (includes all sub-directories)
├── system/               # System-level tasks
│   └── Taskfile.yml      #   update, upgrade, cleanup, snap
├── tools/                # Dev tool installations
│   ├── vscode.yml        #   VS Code, Insiders, Cursor
│   ├── chrome.yml        #   Google Chrome
│   ├── gh-cli.yml        #   GitHub CLI
│   ├── intellij.yml      #   IntelliJ IDEA CE
│   ├── cursor.yml        #   Cursor AI editor + CLI
│   ├── windsurf.yml      #   Windsurf AI editor
│   ├── antigravity.yml   #   Antigravity (Docker)
│   ├── claude.yml        #   Claude CLI + Desktop
│   ├── docker.yml        #   CLI, Engine, Desktop
│   ├── git.yml           #   Git
│   ├── node.yml          #   nvm + Node.js versions
│   └── sdkman.yml        #   SDKMAN
├── ci/                   # CI/CD helpers
│   └── Taskfile.yml      #   YAML lint, validation
├── README.md
└── LINKS.md
```

## Usage

### List available tasks

```sh
task --list
```

### List all tasks

```sh
task --list-all
```

### Run a specific task

Tasks are namespaced by their include name:

```sh
task vscode:install
task chrome:install
task gh:install
task intellij:install
task cursor:install
task cursor:install-cli
task windsurf:install
task claude:install-cli
task claude:install-desktop
task docker:install-cli
task docker:install-engine
task docker:install-desktop
task git:install
task node:install-22
task sdkman:install
task system:update
```

### Run multiple tasks

```sh
task vscode:install chrome:install
```

### Run a task directly from a file

```sh
task -t tools/vscode.yml install
```

### Run tasks in parallel

```sh
task --parallel vscode:install chrome:install
```

### Dry run (see what would run without executing)

```sh
task --dry-run vscode:install
```

## Execution Modes

Each tool can be installed or run in different modes:

| Mode | Description | When to Use |
|------|-------------|-------------|
| **Native** | Installed directly on the host OS | Full integration, CLI in PATH |
| **npm** | Installed via npm (requires Node.js) | JS/TS tools, cross-platform CLIs |
| **Container** | Runs inside a Docker container | Avoid host pollution, no native package |

Choose the mode that fits your workflow. Container tasks are prefixed with `container:`, npm tasks use `preconditions` to verify Node.js is installed.

## Container Platform

Some tools can run inside Docker containers instead of being installed natively. Container tasks live under `container/` and are namespaced with `container:`.

```sh
# Run Node.js in a container (no local install needed)
task container:node CMD="node --version"

# Run npm in a container
task container:npm CMD="install" MOUNTS="-v $PWD:/app -w /app"

# Run Claude CLI in a container
task container:claude-cli ARGS="--help"

# Generic container runner
task container:run IMAGE=python:3 CMD="python --version"
```

All container tasks require Docker CLI. They auto-check with `preconditions:`.

## Prerequisites

Tasks declare what they need using `preconditions:` and `requires:`. If a prerequisite is missing, Task shows a clear message and stops.

```sh
# Example: claude:install-cli checks for Node.js first
$ task claude:install-cli
task: "claude:install-cli" failed: Node.js and npm are required. Run 'task node:install-22' first.
```

| Prerequisite | Check | Needed By |
|-------------|-------|-----------|
| Docker CLI | `docker --version` | `container:*`, `docker:setup-repo` |
| Node.js + npm | `node --version && npm --version` | `claude:install-cli` |
| curl | `command -v curl` | `node:install-nvm`, `sdkman:install`, `docker:setup-repo` |

## Supported Platforms

Each task auto-detects the OS and distro using `platforms:` and `if:` conditions. No flags needed.

| Platform | Detected By | Package Manager |
|----------|-------------|----------------|
| Ubuntu / Debian | `test -f /etc/debian_version` | `apt`, `snap` |
| Arch Linux | `test -f /etc/arch-release` | `pacman`, `yay` (AUR) |
| macOS | `platforms: [darwin]` | `brew` |
| Windows | `platforms: [windows]` | `winget` |
| Container | `docker --version` | Docker (any OS) |

## Adding a New Task

1. Pick the right category file or create a new one under `tools/`, `system/`, or `container/`.
2. Define your task using the [Taskfile schema](https://taskfile.dev/#/usage):
   ```yaml
   tasks:
     install_my_tool:
       desc: Install My Tool
       cmds:
         - curl -fsSL https://example.com/install.sh | sh
       preconditions:
         - sh: command -v curl
           msg: "curl is required."
   ```
3. If it's a separate file, include it in the main `Taskfile.yml` using `includes:`.

## Links

For external references and resources, see [LINKS.md](LINKS.md).
