# CodeDash

Dashboard + CLI for Claude Code, Codex, and OpenCode sessions. View, search, resume, convert, and hand off between AI coding agents.

[Russian / Русский](docs/README_RU.md) | [Chinese / 中文](docs/README_ZH.md)

https://github.com/user-attachments/assets/15c45659-365b-49f8-86a3-9005fa155ca6

![npm](https://img.shields.io/npm/v/codedash-app?style=flat-square) ![Node](https://img.shields.io/badge/node-%3E%3D18-green?style=flat-square) ![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square) ![Zero deps](https://img.shields.io/badge/dependencies-0-blue?style=flat-square)

## Quick Start

```bash
npm i -g codedash-app
codedash run
```

Opens `http://localhost:3847` in your browser.

## Supported Agents

| Agent | Sessions | Preview | Search | Convert | Handoff |
|-------|----------|---------|--------|---------|---------|
| Claude Code | JSONL | Yes | Yes | Yes | Yes |
| Codex CLI | JSONL | Yes | Yes | Yes | Yes |
| OpenCode | SQLite | Yes | Yes | - | Yes |

## Features

**Browser Dashboard**
- Grid and List view with project grouping
- Trigram fuzzy search + full-text deep search across all messages
- Filter by tool (Claude/Codex/OpenCode), tags, date range
- Star/pin sessions, tag with labels (bug, feature, research, infra, deploy, review)
- Activity heatmap (GitHub-style)
- Session Replay with timeline slider and play/pause
- Hover preview (first 6 messages) + expandable cards (10 messages inline)
- Themes: Dark, Light, System

**Live Monitoring**
- Running sessions view with CPU, Memory, PID, Uptime
- LIVE/WAITING badges with animated border on active cards
- Focus Terminal button to switch to active session
- Polling every 5 seconds

**Cost Analytics**
- Real cost from actual token usage (input, output, cache read/write)
- Per-model pricing: Opus, Sonnet, Haiku, Codex, GPT-5
- Daily cost chart, cost by project, most expensive sessions

**Cross-Agent**
- Convert sessions between Claude Code and Codex (native format)
- Handoff: generate context document to continue in any agent
- Verbosity levels: minimal (3 msgs), standard (10), verbose (20), full (50)

**CLI**
```bash
codedash run [port] [--no-browser]    # start dashboard
codedash search <query>               # full-text search all sessions
codedash show <session-id>            # session details + cost + messages
codedash handoff <id> [target]        # generate handoff document
codedash handoff claude codex         # quick: latest Claude to Codex
codedash convert <id> claude|codex    # convert session format
codedash list [limit]                 # list sessions
codedash stats                        # statistics
codedash export [file.tar.gz]         # backup all sessions
codedash import <file.tar.gz>         # restore on new machine
codedash update                       # update to latest version
codedash restart                      # restart server
codedash stop                         # stop server
```

**Keyboard Shortcuts**: `/` search, `j/k` navigate, `Enter` open, `x` star, `d` delete, `s` select mode, `g` toggle groups, `r` refresh, `Esc` close

## How It Works

Reads session data from:
- `~/.claude/` — history, projects, session files, PID tracking
- `~/.codex/` — history, session files
- `~/.local/share/opencode/opencode.db` — SQLite (via sqlite3 CLI)

Zero dependencies. Everything runs on `localhost`.

## Install Agents

```bash
# Claude Code
curl -fsSL https://claude.ai/install.sh | bash

# Codex CLI
npm i -g @openai/codex

# OpenCode
curl -fsSL https://opencode.ai/install | bash

# Kiro CLI
curl -fsSL https://cli.kiro.dev/install | bash
```

## Requirements

- Node.js >= 18
- At least one AI coding agent installed
- macOS / Linux / Windows

## License

MIT
