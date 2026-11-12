# AI Agent Instructions

Taskfile (go-task) collection for installing dev tools and AI coding agents on Ubuntu/Debian, Arch, macOS, and Windows. The Taskfiles are the product: there is no app code, package manifest, test suite, lockfile, or CI workflow.

## Running tasks

```sh
task                              # default task runs `task --list-all`
task --list-all                   # all 49 tasks (all have `desc`)
task node:install-22              # run a namespaced task
task --parallel vscode:install chrome:install
task -t tools/vscode.yml install  # run one file directly
task -n -v vscode:install         # preview commands without executing
```

- Requires the `task` binary (go-task; not vendored). Install it per README before validating anything.
- Use `--dry`/`-n`, never `--dry-run`: Task rejects `--dry-run` (README documents the wrong flag).
- Most tasks set `silent: true`, so `task -n <task>` prints nothing; add `-v` to see the plan.
- Namespaces come from the `includes:` keys in `Taskfile.yml`, not filenames (`tools/gh-cli.yml` → `gh:`).
- Installs mostly call `sudo`; expect a privileged session.

## Validation

- `task ci:check-taskfile` — the only real check. From the repo root it runs `task --list-all`, parsing every *included* Taskfile. A new file not registered in `includes:` is neither validated nor listed.
- `task ci:lint` — runs `yamllint .`; yamllint is not installed by default and there is no yamllint config.
- No test suite, formatter, typecheck, or `.github/workflows` exists; `ci:*` are local helpers only.

## Structure

- `Taskfile.yml` — entrypoint; `includes:` every namespace. Register new files here.
- `system/Taskfile.yml` — update, upgrade, cleanup, snap-install.
- `tools/*.yml` — one tool per file: vscode, chrome, gh-cli, intellij, cursor, windsurf, antigravity, claude, docker, git, node, sdkman.
- `agents/*.yml` — AI agents: opencode, mimocode, kilo, claude-code, cursor-agent; `agents/Taskfile.yml` has `install-all`.
- `ai-tools/*.yml` — rtk; `ai-tools/Taskfile.yml` has `install-all`.
- `container/Taskfile.yml` — Docker-based run/exec/node/npm/claude-cli.
- `ci/Taskfile.yml` — local validation helpers, not CI pipelines.

## Gotchas

- No `status:`, `sources:`, or `generates:` exists anywhere: tasks never skip, so every run re-downloads/reinstalls (including `nvm` on every `node:install-*`).
- Linux dispatch covers only Debian (`/etc/debian_version`) and Arch (`/etc/arch-release`). Other distros match no `cmd:` and the task silently succeeds doing nothing; there is no Fedora/Alpine support despite README install docs.
- For package-managed installs, Arch uses `yay` and Windows uses `winget`; the only deviations are `opencode:install` (`paru`/`choco`) plus vendor install scripts for agents/rtk. Don't copy opencode's package managers into new tasks.
- `vscode:install-cursor` duplicates `cursor:install`; use `cursor:install`.
- `cursor-agent:install` is the standalone Cursor Agent CLI (binary `agent`, installed to `~/.local/bin`), not the Cursor IDE launcher (`cursor:install-cli` installs `cursor`).
- `claude-code:install` is Anthropic's native installer (binary `claude`, no Node); `claude:install-cli` is the npm route and requires Node/npm.
- `agents:install-all` / `ai-tools:install-all` list `deps:` as `':opencode:install'` etc. The leading colon resolves siblings at the root namespace; without it they would resolve under `agents:`/`ai-tools:`. `deps:` run in parallel.
- `sdkman:install`'s java `precondition` is blocking even though its message says "recommended".
- `antigravity:install` only pulls a Docker image and prints a run hint; it needs Docker but declares no precondition.
- `docker:setup-repo` is Debian-only but is a `dep` of `install-cli`/`install-engine`; its curl precondition applies on every OS while its command no-ops off Debian. It adds the APT repo, not Docker itself.
- `container:exec DOCKERFILE=<name>` builds `container/<name>.Dockerfile`; none exist yet, so it fails until one is added. Invoke it as `task container:exec`; using `-t container/Taskfile.yml` changes the working directory to `container/` and breaks the path.
- Container task vars: `run IMAGE CMD [MOUNTS]`, `exec DOCKERFILE [ARGS]`, `node CMD [MOUNTS]`, `npm CMD [MOUNTS]` (defaults to `-v $PWD:/app -w /app`), `claude-cli [ARGS]`.
- `node:install-*` depend on `install-nvm`; nvm is pinned to `NVM_VERSION: v0.40.1` in `tools/node.yml`. Versions: 18, 20, 22, 23, 24.
- `system:cleanup` has no Windows branch (update/upgrade do).
- YAML quirk: quote `desc` values containing a colon-space (e.g. `"(usage: task snap-install PACKAGE=<name>)"`) or the file stops parsing.

## Conventions (new tasks)

- Start every Taskfile with the `# yaml-language-server` schema header and `version: '3'`.
- Put tasks in the right category file under `tools/`, `system/`, or `container/`; register new files in the root `Taskfile.yml` `includes:`.
- Dispatch per platform with `cmd:` + `platforms:` + `if:`:
  - Ubuntu/Debian: `platforms: [linux]` + `if: test -f /etc/debian_version`
  - Arch: `platforms: [linux]` + `if: test -f /etc/arch-release`
  - macOS: `platforms: [darwin]`; Windows: `platforms: [windows]`
- Give every task `desc` (plus `summary` when non-trivial) and `silent: true`; the four container run/exec/node/npm tasks are the current non-silent exceptions.
- Declare `preconditions:` (`sh:` + `msg:`) and `requires: vars:` for required tools/vars; use `deps:` for ordering.
- npm variants are named `install-npm` and guard with `node --version && npm --version` (e.g. `opencode:install-npm`).
