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
│   └── Taskfile.yml      #   apt update, upgrade, cleanup, snap
├── tools/                # Dev tool installations
│   ├── vscode.yml        #   VS Code + Cursor
│   ├── chrome.yml        #   Google Chrome
│   ├── gh-cli.yml        #   GitHub CLI
│   └── intellij.yml      #   IntelliJ IDEA CE
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
