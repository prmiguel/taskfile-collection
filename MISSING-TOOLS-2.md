# Extended Tooling Catalog 2 — Utilities, Media & Generative AI

Second catalog, complementing [MISSING-TOOLS.md](MISSING-TOOLS.md). Where the
first file covered cloud, Kubernetes, IaC, databases, networking and security,
this one focuses on **system/CLI utilities**, **image conversion & optimization**,
**image generation**, **audio/video/speech**, **documents & data**, and **AI
helpers**.

Nothing here is scripted yet — every entry is a **suggestion** with a proposed
task namespace and a non-root-first install method so it can be turned into a
`tools/*.yml` file later.

## Legend
- 💡 suggested (not yet scripted)
- Install column: `cargo` / `go` / `pip` / `npm` = user-level (`~/.local/bin`,
  `~/.cargo/bin`, `~/.local/bin` via `pip3 install --user`, user-prefix `npm -g`)
- `apt`/`pacman`/`brew`/`winget` = system package manager (`apt`/`pacman` use `sudo`)
- `script` = vendor installer that writes to `~/.local` (verify before adding)
- `binary` = single release binary into `~/.local/bin`

Proposed new namespaces / files:
`sysutils:` (`tools/sysutils.yml`), `media:` (`tools/media.yml`),
`genai:` (`tools/genai.yml`), `docs:` (`tools/docs.yml`),
`diagrams:` (`tools/diagrams.yml`), `devtools:` (`tools/devtools.yml`).

---

## 🖥️ System monitoring & information — `tools/sysutils.yml`
| Tool | Purpose | Install |
|------|---------|---------|
| bottom (`btm`) | Cross-platform process/system monitor | cargo / brew |
| zenith | Zoomable CPU/mem/disk monitor | cargo |
| gtop | System dashboard (Node) | npm |
| vtop | Terminal activity monitor | npm |
| s-tui | CPU stress test + monitor | pip |
| nmon | System performance monitor | apt / brew |
| tiptop | System monitor | pip |
| fastfetch | Fast system info (neofetch successor) | apt / brew |
| macchina | System info with themes | cargo |
| cpufetch | CPU architecture info | binary |
| bandwhich | Per-process bandwidth monitor | cargo |
| nethogs | Per-process network usage | apt / brew |
| iftop | Bandwidth by connection | apt / brew |
| nload | Live network load | apt / brew |
| vnstat | Long-term network stats | apt / brew |
| iotop | Per-process disk I/O | apt / brew |
| sysbench | CPU/memory/disk benchmarks | apt / brew |
| stress-ng | System stress testing | apt / brew |
| bcal / bitwise | Byte/base conversions | apt / brew |

## 📁 Files, search & navigation — `tools/sysutils.yml`
| Tool | Purpose | Install |
|------|---------|---------|
| yazi | Blazing-fast TUI file manager | cargo |
| ranger | VI-keyed file manager | pip |
| nnn | File browser + disk usage | apt / brew |
| lf | Fast, scriptable file manager | go |
| joshuto | Ranger-like (Rust) | cargo |
| xplr | Hackable TUI file explorer | cargo |
| vifm / mc | Classic dual-pane managers | apt / brew |
| fclones | Fast duplicate finder | cargo |
| rmlint | Duplicate/lint remover | apt / brew |
| czkawka (`czkawka_cli`) | Duplicate finder (Rust) | cargo |
| ncdu | Disk usage (ncurses) | apt / brew |
| gdu | Fast disk usage (Go) | go |
| diskonaut | Interactive disk-space TUI | cargo |
| dua-cli | Disk usage analyzer | cargo |
| ripgrep-all (`rga`) | Search inside PDFs/ebooks/archives | cargo |
| fselect | Find files with SQL-like queries | cargo |
| skim (`sk`) | Fuzzy finder (fzf alternative) | cargo |
| television (`tv`) | Fast general fuzzy finder | cargo |
| entr | Run commands on file change | apt / brew |
| fswatch / inotify-tools | File-change watchers | apt / brew |
| trash-cli | `rm` to trash | pip |
| renameutils / f2 | Batch renaming | apt / brew, cargo |

## 🗜️ Archives & compression — `tools/sysutils.yml`
| Tool | Purpose | Install |
|------|---------|---------|
| 7-Zip (`7zz`/`p7zip`) | Archive create/extract | apt / brew |
| zstd | Fast compression | apt / brew |
| pigz | Parallel gzip | apt / brew |
| pbzip2 | Parallel bzip2 | apt / brew |
| pixz | Parallel xz | apt / brew |
| lz4 | Very fast compression | apt / brew |
| xz / brotli | Compression codecs | apt / brew |
| unrar / unar (`lsar`) | RAR / universal extract | apt / brew |
| atool | Wrapper for many archive types | apt / brew |
| ouch | Painless compression/decompression | cargo |
| patool | Archive wrapper (Python) | pip |
| rmw | Safe `rm` with trash | apt / brew |

## 💾 Disk, backup & sync — `tools/sysutils.yml`
| Tool | Purpose | Install |
|------|---------|---------|
| restic | Encrypted, deduplicated backups | apt / brew / go |
| borgbackup | Deduplicating backup | apt / brew / pip |
| kopia | Fast encrypted snapshots | binary / brew |
| duplicity | Encrypted bandwidth-efficient backup | apt / brew |
| rsync | Fast incremental file transfer | apt / brew |
| unison | Bidirectional file sync | apt / brew |
| rsnapshot | Filesystem snapshot backups | apt / brew |
| bup | Git-based backup | pip / apt |
| plakar | Verifiable dedup backup engine | go |

## 🖼️ Image conversion & optimization — `tools/media.yml`
| Tool | Purpose | Install |
|------|---------|---------|
| ImageMagick (`magick`) | The image Swiss-army knife | apt / brew |
| GraphicsMagick (`gm`) | Faster ImageMagick fork | apt / brew |
| libvips (`vips`) | Fast, low-memory image processing | apt / brew |
| sharp-cli | Image resize/convert (libvips) | npm |
| oxipng | PNG optimizer (Rust) | cargo |
| optipng | Lossless PNG optimizer | apt / brew |
| pngquant | Lossy PNG quantizer | apt / brew |
| zopfli / zopflipng | Max PNG/gzip compression | apt / brew |
| jpegoptim | JPEG optimizer | apt / brew |
| libjpeg-turbo (`jpegtran`) | Lossless JPEG transform | apt / brew |
| mozjpeg (`cjpeg`) | Better JPEG encoder | apt / brew |
| guetzli | Perceptual JPEG encoder | apt / brew |
| libwebp (`cwebp`/`dwebp`) | WebP encode/decode | apt / brew |
| libavif (`avifenc`/`avifdec`) | AVIF encode/decode | apt / brew |
| gifsicle | GIF create/optimize | apt / brew |
| gifski | High-quality GIF from video | cargo |
| svgo | SVG optimizer | npm |
| scour | SVG optimizer (Python) | pip |
| resvg | Fast SVG renderer | cargo |
| librsvg (`rsvg-convert`) | SVG rasterizer | apt / brew |
| Inkscape CLI | SVG editor/export | apt / brew |
| potrace | Bitmap → vector | apt / brew |
| vtracer | Image → SVG (Rust) | cargo |
| optimizt | Prep images for the web | npm |
| imgp | Batch resize/rotate | pip |
| squoosh-cli | Codec-based image compression | npm |
| exiftool | Read/write metadata | apt / brew |
| jhead | JPEG EXIF editor | apt / brew |
| chafa | Terminal image viewer | apt / brew |
| viu | Terminal image viewer (Rust) | cargo |
| timg | Terminal image/video viewer | apt / brew |
| catimg / jp2a | ASCII/ANSI image display | apt / brew |
| ueberzugpp | Image previews in terminal | binary |
| carbon-now-cli | Beautiful images of code | npm |
| freeze | Code/terminal → image | go |
| gowall | Recolor/upscale/OCR images | binary |

## 🎨 Image generation (local + API) — `tools/genai.yml`
| Tool | Purpose | Install |
|------|---------|---------|
| stable-diffusion.cpp (`sd`) | CLI SD/Flux inference (C/C++) | build |
| ComfyUI | Node-based SD/Flux workflows (API) | git + pip |
| InvokeAI | Local SD/Flux suite + CLI | pip |
| Fooocus | Simplified SD UI/CLI | git |
| AUTOMATIC1111 WebUI | Classic SD web UI + API | git |
| Forge / SwarmUI | Faster SD/Flux frontends | git |
| mflux | Flux on Apple Silicon (MLX) | pip |
| imaginairy (`imagine`) | CLI image generation/editing | pip |
| diffusers | HuggingFace diffusion toolkit | pip |
| kohya_ss / OneTrainer | LoRA/model training | git |
| Stable Horde worker | Crowdsourced SD worker | pip |
| OpenAI CLI (`openai`) | API image generation/editing | pip |
| llm + llm-gemini/llm-openai plugins | API image + text | pip |
| huggingface_hub (`hf`) | Download models/datasets | pip |
| civitai / civitai-downloader | Fetch Civitai models | pip |
| aria2 | Multi-protocol model downloader | apt / brew |
| transmission-cli / rtorrent | Torrent downloads for models | apt / brew |

## 🎬 Audio & video — `tools/media.yml`
| Tool | Purpose | Install |
|------|---------|---------|
| ffmpeg / ffprobe | Convert/stream/inspect media | apt / brew |
| mediainfo | Media file metadata | apt / brew |
| sox | Audio processing/effects | apt / brew |
| yt-dlp | Download video/audio | pip / brew |
| gallery-dl | Download image galleries | pip |
| you-get / lux | Media downloaders | pip / go |
| streamlink | Pipe streams to a player | pip |
| spotdl | Spotify downloader | pip |
| mpv | Media player | apt / brew |
| cmus / ncmpcpp+mpd / moc | Terminal music players | apt / brew |
| termusic | Rust music player + downloads | cargo |
| musikcube | Terminal music player/server | apt / brew |
| beets | Music library manager/tagger | pip |
| eyeD3 / id3v2 | Audio tag editors | pip / apt |
| audiowaveform | Audio waveform generator | apt / brew |
| HandBrakeCLI | Video transcoder | apt / brew |
| mkvtoolnix (`mkvmerge`) | Matroska tools | apt / brew |
| av1an / ab-av1 | AV1 encoding orchestration | cargo |
| SVT-AV1 | AV1 encoder | apt / brew |
| ffmpeg-normalize | Loudness normalization | pip |
| video2x | AI video upscaling | binary |

## 🗣️ Speech: transcription & synthesis — `tools/genai.yml`
| Tool | Purpose | Install |
|------|---------|---------|
| whisper.cpp | Fast local Whisper (C/C++) | build / brew |
| openai-whisper | Reference Whisper CLI | pip |
| faster-whisper | CTranslate2 Whisper | pip |
| whisper-ctranslate2 | Whisper CLI (CTranslate2) | pip |
| whisperx | Whisper + diarization | pip |
| insanely-fast-whisper | Batched GPU Whisper | pip |
| whisper-diarization | Speaker-labeled transcripts | pip |
| piper (`piper-tts`) | Fast local TTS | pip / binary |
| coqui-tts | Neural TTS | pip |
| bark | Text-to-audio (Suno) | pip |
| Tortoise-TTS | High-quality TTS | pip |
| edge-tts | Microsoft Edge TTS | pip |
| sherpa-onnx | On-device STT/TTS | pip |
| kokoro | Lightweight TTS | pip |
| espeak-ng / festival / flite | Offline TTS engines | apt / brew |
| vosk | Offline speech recognition | pip |

## 🤖 AI / LLM utilities (non-agent) — `tools/genai.yml`
| Tool | Purpose | Install |
|------|---------|---------|
| shell-gpt (`sgpt`) | Terminal ChatGPT | pip |
| chatblade | CLI ChatGPT w/ prompt chains | pip |
| gptme | Terminal AI assistant | pip |
| Open Interpreter | Code interpreter in terminal | pip |
| gpt-engineer | Spec → codebase | pip |
| Plandex | Terminal AI coding engine | go / script |
| tenere | TUI LLM client (Rust) | cargo |
| elia | TUI ChatGPT/LLM client | pip |
| gollama | Manage Ollama models (Go) | go |
| LocalAI | OpenAI-compatible local server | brew / docker |
| vLLM | High-throughput inference server | pip |
| llama.cpp server | Local OpenAI-compatible server | build (have `llama-cpp`) |
| bitnet.cpp | 1-bit LLM inference | build |
| llamafile | Single-file local LLM | binary |
| mlx-lm | Apple-silicon LLM runtime | pip |
| gpt4all | Local chat models | brew |
| repomix | Pack a repo for LLM input | npm |
| gitingest | Repo → LLM-friendly text | pip |
| files-to-prompt | Concatenate files for prompts | pip |
| code2prompt | Repo → prompt (Rust) | cargo |
| ttok / strip-tags | Token counting / HTML strip | pip |
| aichat / mods / fabric / tgpt | (already in `llm-local`) | — |

## 📝 Documents, PDF & OCR — `tools/docs.yml`
| Tool | Purpose | Install |
|------|---------|---------|
| pandoc | Universal document converter | apt / brew |
| typst | Modern typesetting | cargo / brew |
| tectonic | Self-contained LaTeX engine | cargo |
| mdbook | Book from Markdown | cargo |
| marp-cli | Markdown → slides | npm |
| slides | Terminal Markdown presentations | go |
| asciidoctor | AsciiDoc processor | apt / brew / gem |
| groff | Man/PS document formatting | apt / brew |
| tesseract | OCR engine | apt / brew |
| ocrmypdf | OCR layer for PDFs | pip |
| img2pdf | Images → PDF (lossless) | pip |
| pdfgrep | Grep inside PDFs | apt / brew |
| qpdf | PDF transform/inspect | apt / brew |
| pdftk | PDF toolkit | apt / brew |
| mupdf-tools (`mutool`) | PDF render/manipulate | apt / brew |
| poppler-utils | `pdftotext`/`pdftoppm`/`pdfinfo` | apt / brew |
| diff-pdf | Visual PDF diff | apt / brew |
| marker-pdf | PDF → Markdown (AI) | pip |
| docling | Document → structured (AI) | pip |
| nougat-ocr | Academic PDF OCR (AI) | pip |
| sioyek | PDF reader (GUI) | apt / brew |
| epr / epy | Terminal EPUB readers | pip |
| hygg | Terminal document reader | binary |
| gtree | Markdown → directory trees | go |
| doctoc | Generate Markdown TOCs | npm |
| grip / mdv | Markdown preview | pip |

## 📊 Data & structured text — `tools/docs.yml`
| Tool | Purpose | Install |
|------|---------|---------|
| Miller (`mlr`) | CSV/TSV/JSON toolkit | apt / brew |
| csvkit | CSV toolkit (Python) | pip |
| xsv | Fast CSV CLI (Rust) | cargo |
| visidata | Spreadsheet multitool TUI | pip |
| csvlens | CSV viewer TUI | cargo |
| tidy-viewer (`tv`) | Pretty-print CSV/tables | cargo |
| `q` | SQL on CSV/TSV | pip |
| dasel | JSON/YAML/TOML/XML selector | go |
| gron | Make JSON greppable | go |
| jless | JSON viewer TUI | cargo |
| fx | JSON viewer | npm |
| jc | CLI output → JSON | pip |
| jo | Build JSON from args | apt / brew |
| htmlq | Query HTML with CSS | cargo |
| pup | HTML parser CLI | go |
| xmlstarlet / xq | XML CLI | apt / brew |
| dyff | YAML diff | binary |
| sc-im | Vim-like spreadsheet | apt / brew |

## 📈 Diagrams & visualization — `tools/diagrams.yml`
| Tool | Purpose | Install |
|------|---------|---------|
| Graphviz (`dot`) | Graph/flowchart rendering | apt / brew |
| mermaid-cli (`mmdc`) | Mermaid diagrams → SVG/PNG | npm |
| D2 | Declarative diagram language | go / brew |
| PlantUML | UML from text | apt / brew |
| svgbob | ASCII → SVG | cargo |
| gnuplot | Scientific plotting | apt / brew |
| asciiflow / ditaa | ASCII → diagram | apt / brew |
| decktape | HTML slides → PDF | npm |

## 🐚 Shell, terminal & version managers — `tools/sysutils.yml`
| Tool | Purpose | Install |
|------|---------|---------|
| mcfly | Smart shell history search | cargo |
| choose | Human-friendly `cut`/`awk` | cargo |
| hexyl | Hex viewer | cargo |
| nushell (`nu`) | Structured-data shell | cargo / brew |
| fish | Friendly interactive shell | apt / brew |
| xonsh | Python-powered shell | pip |
| oils (`oils-for-unix`) | Modern shell + bash | apt / brew |
| elvish / murex | Alternative shells | apt / brew |
| byobu / screen | Terminal multiplexers | apt / brew |
| dtach / abduco / dvtm | Detach/reattach tools | apt / brew |
| oh-my-posh | Prompt theme engine | script / brew |
| powerlevel10k | Zsh prompt theme | git |
| carapace | Multi-shell completions | go |
| mise | Polyglot version manager | script |
| asdf | Polyglot version manager | git |
| proto | Polyglot toolchain manager | script |
| fnm / volta | Node version managers | cargo / script |
| pyenv | Python version manager | script |
| rbenv / goenv / jenv | Language version managers | git |
| tfenv / tfswitch | Terraform version managers | brew / go |
| task-spooler | Queue jobs for linear execution | apt |
| moreutils | `sponge`, `ts`, `vidir`, `vipe` | apt / brew |
| GNU parallel | Parallel command execution | apt / brew |
| pv | Pipe progress viewer | apt / brew |
| progress | Coreutils progress | apt / brew |

## 📋 Clipboard, notifications & desktop — `tools/sysutils.yml`
| Tool | Purpose | Install |
|------|---------|---------|
| xclip / xsel | X11 clipboard | apt |
| wl-clipboard | Wayland clipboard | apt |
| Clipboard | Cross-platform copy/paste | script |
| yank | Yank terminal output | apt / brew |
| greenclip | Clipboard history (X) | apt |
| clipcat | Clipboard manager | cargo |
| copyq | Clipboard manager (GUI) | apt / brew |
| ntfy | Send push notifications | apt / brew |
| terminal-notifier | macOS notifications | brew |
| libnotify (`notify-send`) | Linux notifications | apt |
| dunst / mako | Notification daemons | apt |
| wttr.in / wego | Terminal weather | go / pip |
| translate-shell (`trans`) | Terminal translation | apt / brew |
| howdoi / how2 | Instant coding answers | pip / npm |
| thefuck | Correct previous command | pip / brew |
| cheat | Interactive cheatsheets | go / brew |
| lolcat / figlet / toilet / cowsay | Terminal fun | apt / brew |

## 📸 Screenshot & recording — `tools/media.yml`
| Tool | Purpose | Install |
|------|---------|---------|
| asciinema | Terminal session recorder | apt / brew / pip |
| agg | Asciinema → GIF | cargo |
| terminalizer | Terminal GIF recorder | npm |
| termshot | Command output → image | go |
| scrot / maim / slop | X11 screenshots | apt |
| grim / slurp | Wayland screenshots | apt |
| wf-recorder | Wayland screen recording | apt |
| simplescreenrecorder | Screen recorder (GUI) | apt |
| ksnip / spectacle | Screenshot tools (GUI) | apt |
| flameshot | Screenshot + annotation (GUI) | apt |
| peek / kooha | Screen recorders (GUI) | flatpak |
| OBS Studio | Streaming/recording (GUI) | apt / flatpak |
| ffscreencast | ffmpeg screencast | npm |

## 🛠️ Dev tooling & linters — `tools/devtools.yml`
| Tool | Purpose | Install |
|------|---------|---------|
| cmake / ninja / meson | Build systems | apt / brew / pip |
| bazelisk | Bazel launcher | go |
| buck2 | Fast build system | brew |
| ccache / sccache | Compiler caches | apt / brew, cargo |
| mold / lld | Fast linkers | apt / brew |
| ast-grep | Structural search/rewrite | cargo |
| typos | Source typo checker | cargo |
| codespell | Spelling checker | pip |
| lychee | Link checker | cargo |
| vale | Prose linter | brew / go |
| markdownlint-cli2 | Markdown linter | npm |
| prettier / biome | Formatters | npm |
| ruff / black / mypy / pylint | Python tooling | pip |
| golangci-lint | Go linter aggregator | go |
| staticcheck / gofumpt / golines | Go tools | go |
| clang-format / clang-tidy / cppcheck | C/C++ tooling | apt / brew |
| editorconfig-checker | EditorConfig linter | go |
| difftastic | Structural diff | cargo |
| gitoxide (`gix`) | Git reimplementation | cargo |
| tig | Text-mode git browser | apt / brew |
| shellspec / bats-core | Shell test frameworks | apt / brew / git |
| hyperfine (already) | Benchmarking | cargo |

## 🧰 Misc & fun — `tools/misc.yml`
| Tool | Purpose | Install |
|------|---------|---------|
| qrcode / zbar | Generate / read QR codes | apt / brew |
| gpg / openssl | Crypto / TLS | apt / brew |
| aria2 | Download accelerator | apt / brew |
| s5cmd | Fast S3 operations | go |
| s3cmd | S3 client | pip |
| aws-vault | Credential helper for AWS | go / brew |
| localtunnel / tunnelmole | Public localhost tunnels | npm |
| gotty / upterm / tmate | Terminal sharing | go / apt |
| xxh | Bring your shell over SSH | pip |
| sshuttle | Poor-man's VPN over SSH | pip / apt |
| bandwhich / rustnet | Network monitors | cargo |
| goaccess | Web log analyzer | apt / brew |
| multitail | Multi-file log tail | apt / brew |
| tailspin | Log highlighter | cargo |
| newsboat | Terminal RSS reader | apt / brew |
| Taskwarrior / timewarrior | Tasks / time tracking | apt / brew |
| nb / dnote / taskbook | Notes & bookmarks | pip / npm |
| ledger / hledger | Plain-text accounting | apt / brew |
| calcurse / khal / vdirsyncer | Calendar & sync | apt / brew / pip |
| buku | Bookmark manager | pip / apt |
| gcalcli | Google Calendar CLI | pip |
| speedtest-cli / fast-cli | Speed tests | pip / npm |
| `s` / hget | Terminal web search / reader | go |
| mapscii | Terminal map viewer | npm |
| cmatrix / pipes.sh | Terminal screensavers | apt / brew |

---

## Suggested implementation order
1. `tools/sysutils.yml` — monitoring + file/archive/backup utilities (pure CLI, mostly non-root).
2. `tools/media.yml` — image conversion/optimization + audio/video + recording.
3. `tools/docs.yml` — documents/PDF/OCR + data & structured text.
4. `tools/genai.yml` — image generation + speech + AI utilities.
5. `tools/diagrams.yml` and `tools/devtools.yml` — smaller, high-signal bundles.

## Conventions to follow (per `AGENTS.md`)
- Every file starts with `# yaml-language-server: $schema=https://taskfile.dev/schema.json` + `version: '3'`.
- Prefer non-root installs (`cargo install`, `go install`, `pip3 install --user`, user-prefix `npm -g`, release binaries into `~/.local/bin`); use `sudo` only for genuine system packages.
- Any `cmds` entry carrying `platforms:`/`if:` uses the `- cmd:` map form.
- Every task has `desc:`, `preconditions:` with a helpful `msg:`, and `silent: true`; each file ends with an `install-all` aggregate.
- Register new files in the root `Taskfile.yml` `includes:`.
