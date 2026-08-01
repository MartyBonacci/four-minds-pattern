#!/usr/bin/env bash
# dispatch.sh — mentor→builder headless dispatch (Four Minds Pattern, v2)
#
# The mentor session invokes this to send a prompt to a headless builder
# (claude --print) running in the builder repo, capturing everything for audit.
#
# ── Configuration ────────────────────────────────────────────────────────────
# Set these two (env vars override the defaults):
#   BUILDER_DIR    — path to the builder's git repo (the "my-app/" tree)
#   DISPATCH_MODEL — model to pin for headless runs (see PINNED note below)
#
# Usage:
#   dispatch.sh <name> [--resume <session_id>] [--timeout <secs>] [--accept-edits] [--dir <tree>] < prompt.md
#
# --dir <tree>  run the builder in an alternate git worktree instead of the
#   default tree. Enables parallel lanes: one builder per tree, enforced
#   mechanically by the per-tree lockfile below.
#
# Per-tree lockfile: locks/<basename>-<pathhash>.lock, held via flock for the
#   whole run. A second dispatch into the SAME tree fails fast (exit 3) naming
#   the holder — the one-builder-per-tree standing rule, made structural.
#
# Output dir: runs/<ts>-<name>/ {prompt.md, output.json, result.md, stderr.log}
# Prints: session_id, turns, cost, exit code, run dir.
set -euo pipefail

BUILDER_DIR="${BUILDER_DIR:-$HOME/projects/my-app-mentor/my-app}"
DISPATCH_ROOT="${DISPATCH_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"

NAME="${1:?usage: dispatch.sh <name> [--resume id] [--timeout secs] [--accept-edits] [--dir tree] < prompt}"
shift
RESUME=""
TIMEOUT=3600
# Builders need full repo access headlessly (git commit/branch, package manager,
# db). --accept-edits only covers file writes and still gates git — insufficient
# for an unattended run. Understand the risk before you adopt this default:
# README → "Honest Tradeoffs".
PERM_MODE="bypassPermissions"
# PINNED so the headless builder never inherits the interactive session's
# roaming /model default — some session models are not accessible headless and
# fail in confusing ways. Override per-run with --model.
MODEL="${DISPATCH_MODEL:-opus}"
while [[ $# -gt 0 ]]; do
  case "$1" in
    --resume) RESUME="$2"; shift 2 ;;
    --timeout) TIMEOUT="$2"; shift 2 ;;
    --accept-edits) PERM_MODE="acceptEdits"; shift ;;
    --perm) PERM_MODE="$2"; shift 2 ;;
    --model) MODEL="$2"; shift 2 ;;
    --dir) BUILDER_DIR="$2"; shift 2 ;;
    *) echo "unknown arg: $1" >&2; exit 2 ;;
  esac
done

# --dir sanity: must be an existing git tree (plain repo or worktree — .git may
# be a dir or a file).
if [[ ! -d "$BUILDER_DIR" ]] || [[ ! -e "$BUILDER_DIR/.git" ]]; then
  echo "ERROR: builder dir '$BUILDER_DIR' is not an existing git tree" >&2
  exit 2
fi
BUILDER_DIR="$(readlink -f "$BUILDER_DIR")"

# ── Per-tree lock (one builder per tree, mechanically enforced) ──────────────
LOCK_DIR="$DISPATCH_ROOT/locks"
mkdir -p "$LOCK_DIR"
LOCK_FILE="$LOCK_DIR/$(basename "$BUILDER_DIR")-$(printf '%s' "$BUILDER_DIR" | md5sum | cut -c1-8).lock"
exec 9>>"$LOCK_FILE"
if ! flock -n 9; then
  echo "ERROR: tree busy — another dispatch holds $LOCK_FILE:" >&2
  cat "$LOCK_FILE" >&2 || true
  exit 3
fi
# We own the lock: record the holder (truncate via a fresh write, fd 9 stays the lock).
printf 'tree=%s name=%s pid=%s started=%s\n' "$BUILDER_DIR" "$NAME" "$$" "$(date -Is)" > "$LOCK_FILE"

TS=$(date +%Y%m%d-%H%M%S)
RUN_DIR="$DISPATCH_ROOT/runs/$TS-$NAME"
mkdir -p "$RUN_DIR"
cat > "$RUN_DIR/prompt.md"   # prompt arrives on stdin
printf 'builder_dir: %s\n' "$BUILDER_DIR" > "$RUN_DIR/tree.txt"

ARGS=(--print --output-format json --model "$MODEL")
if [[ -n "$RESUME" ]]; then ARGS+=(--resume "$RESUME"); fi
if [[ -n "$PERM_MODE" ]]; then ARGS+=(--permission-mode "$PERM_MODE"); fi

cd "$BUILDER_DIR"
set +e
# Run the builder as its own PROCESS-GROUP leader (set -m) so a timeout can
# reap the WHOLE tree. Why: `timeout --signal=TERM claude` only signals the
# claude process itself; in a real incident its node children survived the
# timeout and kept mutating the repo for ~20 more minutes, racing the next
# dispatch on the same tree. Group-kill closes that hole.
set -m
claude "${ARGS[@]}" \
  < "$RUN_DIR/prompt.md" > "$RUN_DIR/output.json" 2> "$RUN_DIR/stderr.log" &
BUILDER_PID=$!
set +m
WAITED=0
while kill -0 "$BUILDER_PID" 2>/dev/null && (( WAITED < TIMEOUT )); do
  sleep 5
  WAITED=$((WAITED + 5))
done
if kill -0 "$BUILDER_PID" 2>/dev/null; then
  echo "timeout after ${TIMEOUT}s — TERM then KILL to process group $BUILDER_PID" >> "$RUN_DIR/stderr.log"
  kill -TERM -- "-$BUILDER_PID" 2>/dev/null
  sleep 20
  kill -KILL -- "-$BUILDER_PID" 2>/dev/null
  EXIT=124
else
  wait "$BUILDER_PID"
  EXIT=$?
fi
# Survivor sweep: warn about any process still running with CWD inside THIS
# builder tree (claude children that escaped the group by making their own
# session — never auto-kill; a broad pkill would match the mentor session too).
# Exclude this script's own ancestor chain (the invoking shell quotes claude/
# dispatch paths in its cmdline and would false-positive). Escaped zombies are
# never our ancestors.
ANCESTORS=" $$ "
_p=$$
while (( _p > 1 )); do
  _p=$(awk '{print $4}' "/proc/$_p/stat" 2>/dev/null) || break
  [[ -n "$_p" ]] || break
  ANCESTORS+="$_p "
done
SURVIVORS=$(for p in /proc/[0-9]*; do
  pid="${p#/proc/}"
  [[ "$ANCESTORS" == *" $pid "* ]] && continue
  [[ "$(readlink -f "$p/cwd" 2>/dev/null)" == "$BUILDER_DIR"* ]] || continue
  # Only builder-shaped processes (headless claude + its node/test-runner
  # children) — the mentor session's own shells also sit in this cwd and must
  # not trip the warning. Extend the pattern for your stack's toolchain.
  grep -qaE 'claude.*(--print|[^-]-p)|vitest|tsx|node' "$p/cmdline" 2>/dev/null && echo "$pid"
done)
if [[ -n "$SURVIVORS" ]]; then
  echo "WARNING: processes still alive with CWD in builder tree: $SURVIVORS" | tee -a "$RUN_DIR/stderr.log"
  ps -o pid,ppid,etime,cmd -p $SURVIVORS 2>/dev/null | tee -a "$RUN_DIR/stderr.log"
fi
set -e

python3 - "$RUN_DIR" <<'PYEOF'
import json, sys, os
run = sys.argv[1]
try:
    d = json.load(open(os.path.join(run, "output.json")))
    with open(os.path.join(run, "result.md"), "w") as f:
        f.write(d.get("result", "") or "")
    print("session_id:", d.get("session_id"))
    print("turns:", d.get("num_turns"), "| cost_usd:", round(d.get("total_cost_usd", 0) or 0, 4))
    print("is_error:", d.get("is_error"))
except Exception as e:
    print("parse-error:", e)
PYEOF

echo "exit: $EXIT"
echo "run_dir: $RUN_DIR"
