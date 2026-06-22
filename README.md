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

## Supported Platforms

Each task auto-detects the OS and distro using `platforms:` and `if:` conditions. No flags needed.

| Platform | Detected By | Package Manager |
|----------|-------------|----------------|
| Ubuntu / Debian | `test -f /etc/debian_version` | `apt`, `snap` |
| Arch Linux | `test -f /etc/arch-release` | `pacman`, `yay` (AUR) |
| macOS | `platforms: [darwin]` | `brew` |
| Windows | `platforms: [windows]` | `winget` |

## Adding a New Task

1. Pick the right category file or create a new one under `tools/`, `system/`, etc.
2. Define your task using the [Taskfile schema](https://taskfile.dev/#/usage):
   ```yaml
   tasks:
     install_my_tool:
       desc: Install My Tool
       cmds:
         - curl -fsSL https://example.com/install.sh | sh
   ```
3. If it's a separate file, include it in the main `Taskfile.yml` using `includes:`.

## Links

For external references and resources, see [LINKS.md](LINKS.md).
