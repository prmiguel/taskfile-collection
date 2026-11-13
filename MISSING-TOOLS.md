# Extended Tooling Catalog

Catalog of the expanded, non-root-first toolset added on top of the original
collection. Every tool listed under **Implemented** has a real task; see the
task name in the third column. `docker` was already covered by `tools/docker.yml`
and is not repeated here.

> All new namespaces are registered in the root `Taskfile.yml` `includes:`:
> `kubernetes:`, `containers:`, `cloud:`, `iac:`, `databases:`, `shell:`,
> `git-extras:`, `network:`, `security:`, `llm-local:`.
>
> Run `task --list-all` for the authoritative list, or `task <ns>:install-all`.

## Legend
- ✅ implemented (task exists)
- 💡 backlog (GUI-heavy, licensed, or daemon-bound; not scripted yet)

---

## ☸️ Kubernetes (`tools/kubernetes.yml`)
| Task | Tool | Purpose |
|------|------|---------|
| `kubernetes:kubectl` | kubectl | K8s CLI → `~/.local/bin` |
| `kubernetes:krew` | krew | kubectl plugin manager → `~/.krew` |
| `kubernetes:kubectx` | kubectx/kubens | context/namespace switching |
| `kubernetes:k9s` | k9s | cluster TUI → `~/.local/bin` |
| `kubernetes:helm` | helm | package manager |
| `kubernetes:kustomize` | kustomize | overlay configs |
| `kubernetes:minikube` | minikube | local single-node cluster |
| `kubernetes:kind` | kind | K8s-in-Docker |
| `kubernetes:k3d` | k3d | k3s-in-Docker |
| `kubernetes:stern` | stern | multi-pod log tailing |
| `kubernetes:kubecolor` | kubecolor | colorized kubectl |
| `kubernetes:k8sgpt` | k8sgpt | AI-powered diagnostics |

## 📦 Containers (`tools/containers.yml`)
| Task | Tool | Purpose |
|------|------|---------|
| `containers:podman` | podman | daemonless engine (system pkg) |
| `containers:podman-compose` | podman-compose | Compose for Podman |
| `containers:buildah` | buildah | OCI image builder |
| `containers:skopeo` | skopeo | image inspect/copy |
| `containers:nerdctl` | nerdctl | containerd CLI |
| `containers:dive` | dive | image layer explorer |
| `containers:ctop` | ctop | container top |
| `containers:lazydocker` | lazydocker | Docker TUI |
| `containers:crane` | crane | image copy/inspect |
| `containers:regctl` | regctl | OCI registry client |

## ☁️ Cloud CLIs (`tools/cloud.yml`)
| Task | Provider |
|------|----------|
| `cloud:aws-cli` | AWS → `~/.local/aws-cli` |
| `cloud:gcloud` | Google Cloud → `~/google-cloud-sdk` |
| `cloud:azure-cli` | Microsoft Azure |
| `cloud:oci-cli` | Oracle Cloud Infrastructure |
| `cloud:doctl` | DigitalOcean |
| `cloud:hcloud` | Hetzner |
| `cloud:vultr-cli` | Vultr |
| `cloud:linode-cli` | Akamai/Linode |
| `cloud:scaleway-cli` | Scaleway |
| `cloud:flyctl` | Fly.io → `~/.fly` |
| `cloud:netlify-cli` | Netlify |
| `cloud:vercel` | Vercel |
| `cloud:wrangler` | Cloudflare Workers |
| `cloud:cf-terraforming` | Cloudflare → Terraform |
| `cloud:rclone` | multi-cloud storage sync |
| `cloud:syncthing` | peer-to-peer file sync |

## 🏗️ Infrastructure-as-Code (`tools/iac.yml`)
`iac:terraform`, `iac:opentofu`, `iac:terragrunt`, `iac:terramate`,
`iac:pulumi`, `iac:cdk` (AWS CDK), `iac:ansible`, `iac:ansible-lint`,
`iac:packer`, `iac:vagrant`, `iac:infracost`, `iac:tflint`, `iac:tfsec`,
`iac:checkov`, `iac:driftctl`, `iac:conftest` (OPA), `iac:terraform-docs`,
`iac:crossplane`.

## 🗄️ Databases & Data (`tools/databases.yml`)
`databases:duckdb`, `databases:psql`, `databases:pgcli`, `databases:mycli`,
`databases:litecli`, `databases:sqlite3`, `databases:mongosh`,
`databases:redis-cli`, `databases:iredis`, `databases:valkey-cli`,
`databases:clickhouse-client`, `databases:cockroach`, `databases:surrealdb`,
`databases:turso`, `databases:usql`, `databases:lazysql`, `databases:harlequin`,
`databases:gobang`, `databases:dbeaver`, `databases:qsv`, `databases:xan`.

## 🐚 Shell & UX (`tools/shell.yml`)
`shell:zsh`, `shell:oh-my-zsh`, `shell:starship`, `shell:fzf`, `shell:ripgrep`,
`shell:bat`, `shell:eza`, `shell:zoxide`, `shell:jq`, `shell:yq`, `shell:sd`,
`shell:direnv`, `shell:atuin`, `shell:tmux`, `shell:zellij`, `shell:just`,
`shell:navi`, `shell:gum`, `shell:glow`, `shell:vhs`, `shell:htop`,
`shell:btop`, `shell:dust`, `shell:duf`, `shell:procs`, `shell:hyperfine`,
`shell:tldr`, `shell:fd`, `shell:lsd`, `shell:broot`, `shell:watchexec`,
`shell:glances`.

## 🌿 Git Power Tools (`tools/git-extras.yml`)
`git-extras:lazygit`, `git-extras:gitui`, `git-extras:delta`,
`git-extras:git-extras`, `git-extras:git-cliff`, `git-extras:cocogitto`,
`git-extras:commitizen`, `git-extras:pre-commit`, `git-extras:gitleaks`,
`git-extras:trufflehog`, `git-extras:git-absorb`, `git-extras:git-branchless`,
`git-extras:git-town`, `git-extras:jujutsu` (jj), `git-extras:glab`,
`git-extras:tea`, `git-extras:git-lfs`, `git-extras:git-flow`,
`git-extras:onefetch`, `git-extras:tokei`.

## 🌐 Networking (`tools/network.yml`)
`network:tailscale`, `network:zerotier`, `network:wireguard`, `network:mosh`,
`network:sshx`, `network:tmate`, `network:ngrok`, `network:cloudflared`,
`network:bore`, `network:frp`, `network:chisel`, `network:caddy`,
`network:nmap`, `network:masscan`, `network:rustscan`, `network:mtr`,
`network:trippy`, `network:gping`, `network:doggo`, `network:dog`,
`network:iperf3`, `network:speedtest-cli`, `network:fast`, `network:curlie`,
`network:httpie`, `network:xh`, `network:websocat`, `network:socat`,
`network:lnav`, `network:angle-grinder`, `network:magic-wormhole`,
`network:croc`, `network:grpcurl`, `network:termshark`.

## 🔐 Security (`tools/security.yml`)
`security:sops`, `security:age`, `security:gopass`, `security:pass`,
`security:bitwarden-cli`, `security:onepassword-cli`, `security:trivy`,
`security:grype`, `security:syft`, `security:cosign`, `security:slsa-verifier`,
`security:chainctl`, `security:semgrep`, `security:bandit`,
`security:osv-scanner`, `security:shellcheck`, `security:shfmt`,
`security:hadolint`, `security:yamllint`, `security:actionlint`,
`security:trufflehog`, `security:nuclei`, `security:ffuf`,
`security:gobuster`, `security:sqlmap`, `security:nikto`, `security:lynis`,
`security:mkcert`, `security:step-cli`.

## 🤖 Local AI / LLM (`tools/llm-local.yml`)
`llm-local:ollama`, `llm-local:llama-cpp`, `llm-local:open-webui`,
`llm-local:aider`, `llm-local:llm` (Simon Willison), `llm-local:aichat`,
`llm-local:tgpt`, `llm-local:mods`, `llm-local:oterm`, `llm-local:fabric`,
`llm-local:opencommit`, `llm-local:gemini-cli`, `llm-local:codex`.

---

## 💡 Backlog (not scripted yet)
- **GUI apps** — Lens/OpenLens, Podman Desktop, Portainer, Burp Suite,
  OWASP ZAP, Wireshark (GUI), Postman, Insomnia, LM Studio, GitButler.
- **Server daemons** — Vault, Consul, Nomad, PostgREST, Litestream, Dagger,
  Earthly (need a running service or subscription).
- **Editor extensions** — Continue, Cody (installed inside an editor).
- **Desktop-only** — OBS Studio, Flameshot.
- **Other cloud CLIs** — Alibaba Cloud (`aliyun`), IBM Cloud.

## Conventions used (per `AGENTS.md`)
- Every file starts with `# yaml-language-server: $schema=https://taskfile.dev/schema.json` + `version: '3'`.
- Installs target `~/.local/bin` or user-level package managers (`pip3 install --user`, user-prefix `npm -g`, `go install`, `cargo install`) — **no `sudo`** where avoidable. Genuine system packages and VPN daemons still use `sudo`.
- Platform dispatch via `platforms: [linux|darwin|windows]` and `if: test -f /etc/debian_version` / `/etc/arch-release` guards.
- Every `cmds` entry that carries `platforms:`/`if:` uses the `- cmd:` map form (plain scalars cannot have attached keys).
- Every task has `desc:`, `preconditions:` with helpful `msg:`, and `silent: true`.
- Registered in the root `Taskfile.yml` under `includes:` with short namespaces.
- Each file ends with an `install-all` aggregate task.

Examples:

```sh
task kubernetes:install-all   # kubectl, helm, k9s, minikube...
task iac:install-all          # terraform, opentofu, terragrunt, pulumi...
task databases:duckdb         # just duckdb
task network:tailscale        # mesh VPN
task llm-local:ollama         # local LLMs
```

For system/CLI utilities, image conversion & optimization, image generation,
audio/video/speech, documents and other helpers, see the second catalog:
[MISSING-TOOLS-2.md](MISSING-TOOLS-2.md).
