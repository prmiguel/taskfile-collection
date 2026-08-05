# AI Agent Instructions

Taskfile (go-task) collection for system setup and dev-tool installation across Ubuntu, Arch Linux, macOS, and Windows. Every Taskfile uses `version: '3'` and the schema header `# yaml-language-server: $schema=https://taskfile.dev/schema.json`.

## Running tasks

```sh
task --list-all                    # list all tasks (the default task runs this)
task node:install-22               # run a namespaced task
task --dry-run vscode:install      # preview without executing
task --parallel a:install b:install # run tasks in parallel
task -t tools/vscode.yml install   # run a task from a single file
```

Tasks are namespaced by the `includes:` name in `Taskfile.yml` (not always the filename: `tools/gh-cli.yml` → `gh:`). Most installs invoke `sudo` internally, so a privileged session is required.

## Structure

- `Taskfile.yml` — entrypoint; `includes:` all namespaces below. Register new files here.
- `system/Taskfile.yml` — update, upgrade, cleanup, snap-install
- `tools/*.yml` — one file per tool: vscode, chrome, gh-cli, intellij, cursor, windsurf, antigravity, claude, docker, git, node, sdkman
- `container/Taskfile.yml` — Docker-based tasks (run, exec, node, npm, claude-cli)
- `ci/Taskfile.yml` — local validation helpers, NOT CI pipelines

## Gotchas

- Repo has no `.github/workflows`. `ci:*` are local-only: `ci:check-taskfile` runs `task --list-all` (YAML syntax check); `ci:lint` runs `yamllint .` and requires yamllint to be installed (no config file in repo).
- `container:exec DOCKERFILE=<name>` builds `container/<name>.Dockerfile` — no Dockerfiles exist yet, so it fails until one is added.
- `vscode:install-cursor` is a duplicate of `cursor:install`; use `cursor:install`.
- `docker:setup-repo` requires curl, not Docker (only `container:*` tasks need Docker).
- `sdkman:install` checks curl AND java.
- `node:install-*` depend on `install-nvm`; nvm is pinned via `NVM_VERSION: v0.40.1` in `tools/node.yml`. Versions: 18, 20, 22, 23, 24.
- `system:cleanup` has no Windows branch (update/upgrade do).
- `container:*` take vars via `requires: vars:`: `container:run IMAGE=<img> CMD=<cmd> [MOUNTS=...]`, `container:exec DOCKERFILE=<name> [ARGS=...]`, `container:npm CMD=...` (defaults `MOUNTS="-v $PWD:/app -w /app"`).
- YAML quirk: `desc` values containing a colon-space (e.g. `(usage: task snap-install PACKAGE=<name>)`) must be quoted or the file won't parse.

## Conventions (follow for new tasks)

- Group related tasks in one file under `tools/`, `system/`, or `container/`; register via `includes:` in `Taskfile.yml`.
- Dispatch per platform with `cmd:` blocks + `platforms:` + `if:` for distros:
  - Ubuntu: `platforms: [linux]` + `if: test -f /etc/debian_version`
  - Arch: `platforms: [linux]` + `if: test -f /etc/arch-release`
  - macOS: `platforms: [darwin]`; Windows: `platforms: [windows]`
- Every task gets `desc` (add `summary` for non-trivial ones) and `silent: true`.
- Declare `preconditions:` (with `sh:` + `msg:`) and `requires: vars:` for any required tool/var; use `deps:` for ordering.
