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
├── Taskfile.yml          # Main entrypoint (includes or runs tasks from sub-files)
├── system/               # System-level tasks
│   ├── Taskfile.yml      #   apt, snap, services, etc.
│   └── Taskfile.yml      #   (future: Docker, networking, etc.)
├── tools/                # Dev tool installations
│   ├── vscode.yml        #   VS Code installation
│   ├── chrome.yml        #   Chrome installation
│   └── intellij.yml      #   IntelliJ installation
├── ci/                   # CI/CD pipeline helpers
│   └── Taskfile.yml
├── README.md
└── LINKS.md
```

## Usage

### List available tasks

```sh
task --list
```

### Run a specific task

```sh
task install_vscode
```

### Run multiple tasks

```sh
task install_chrome install_vscode
```

### Run a task from a specific file

If tasks are split across files, use `-t` or `--taskfile`:

```sh
task -t tools/vscode.yml install
```

### Include tasks from sub-files (main Taskfile.yml)

Tasks from included files are available directly from the root:

```sh
task setup:dotfiles
task install:node
```

### Run tasks in parallel

```sh
task --parallel install_chrome install_vscode
```

### Dry run (see what would run)

```sh
task --dry-run install_vscode
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
