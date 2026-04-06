#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
DOCKER_DIR="$SCRIPT_DIR/docker"

BASE_COMPOSE="$DOCKER_DIR/docker-compose.yml"

USE_CLAUDE=0
USE_CODEX=0
USE_CURSOR=0
USE_KIRO=0
USE_OPENCODE=0

print_usage() {
  cat <<'EOF'
Usage: ./in-docker.sh [options] [-- docker-compose-args...]

Options:
  --claude      Mount ~/.claude
  --codex       Mount ~/.codex
  --cursor      Mount ~/.cursor
  --kiro        Mount ~/Library/Application Support/kiro-cli/data.sqlite3
  --opencode    Mount ~/.local/share/opencode/opencode.db
  --all         Enable all supported mounts
  -h, --help    Show this help

Examples:
  ./in-docker.sh --claude --codex
  ./in-docker.sh --all -- up --build
  ./in-docker.sh --cursor -- up -d

If no docker-compose args are provided, the script runs:
  docker compose ... up --build
EOF
}

require_path() {
  label=$1
  path_value=$2
  if [ ! -e "$path_value" ]; then
    printf '%s\n' "Missing $label path: $path_value" >&2
    exit 1
  fi
}

while [ $# -gt 0 ]; do
  case "$1" in
    --claude)
      USE_CLAUDE=1
      shift
      ;;
    --codex)
      USE_CODEX=1
      shift
      ;;
    --cursor)
      USE_CURSOR=1
      shift
      ;;
    --kiro)
      USE_KIRO=1
      shift
      ;;
    --opencode)
      USE_OPENCODE=1
      shift
      ;;
    --all)
      USE_CLAUDE=1
      USE_CODEX=1
      USE_CURSOR=1
      USE_KIRO=1
      USE_OPENCODE=1
      shift
      ;;
    -h|--help)
      print_usage
      exit 0
      ;;
    --)
      shift
      break
      ;;
    *)
      break
      ;;
  esac
done

compose_files=(-f "$BASE_COMPOSE")
compose_args=("$@")

if [ "${#compose_args[@]}" -eq 0 ]; then
  compose_args=(up --build)
fi

if [ "$USE_CLAUDE" -eq 1 ]; then
  HOST_CLAUDE_DIR="${HOST_CLAUDE_DIR:-$HOME/.claude}"
  require_path "Claude" "$HOST_CLAUDE_DIR"
  export HOST_CLAUDE_DIR
  compose_files+=(-f "$DOCKER_DIR/docker-compose.claude.yml")
fi

if [ "$USE_CODEX" -eq 1 ]; then
  HOST_CODEX_DIR="${HOST_CODEX_DIR:-$HOME/.codex}"
  require_path "Codex" "$HOST_CODEX_DIR"
  export HOST_CODEX_DIR
  compose_files+=(-f "$DOCKER_DIR/docker-compose.codex.yml")
fi

if [ "$USE_CURSOR" -eq 1 ]; then
  HOST_CURSOR_DIR="${HOST_CURSOR_DIR:-$HOME/.cursor}"
  require_path "Cursor" "$HOST_CURSOR_DIR"
  export HOST_CURSOR_DIR
  compose_files+=(-f "$DOCKER_DIR/docker-compose.cursor.yml")
fi

if [ "$USE_KIRO" -eq 1 ]; then
  HOST_KIRO_DB="${HOST_KIRO_DB:-$HOME/Library/Application Support/kiro-cli/data.sqlite3}"
  require_path "Kiro" "$HOST_KIRO_DB"
  export HOST_KIRO_DB
  compose_files+=(-f "$DOCKER_DIR/docker-compose.kiro.yml")
fi

if [ "$USE_OPENCODE" -eq 1 ]; then
  HOST_OPENCODE_DB="${HOST_OPENCODE_DB:-$HOME/.local/share/opencode/opencode.db}"
  require_path "OpenCode" "$HOST_OPENCODE_DB"
  export HOST_OPENCODE_DB
  compose_files+=(-f "$DOCKER_DIR/docker-compose.opencode.yml")
fi

exec docker compose "${compose_files[@]}" "${compose_args[@]}"
