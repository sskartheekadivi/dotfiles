#!/usr/bin/env bash
TARGET="$1"
DIRECTION="$2" # -h or -v

# Validate inputs before doing anything
if [ -z "$TARGET" ] || [ -z "$DIRECTION" ]; then
    tmux display-message "join_pane: missing target or direction"
    exit 1
fi

# 1. Get the exact Pane ID and Window Name of the target we are about to pull in
PANE_ID=$(tmux display-message -p -t "$TARGET" '#{pane_id}' 2>/dev/null)
WINDOW_NAME=$(tmux display-message -p -t "$TARGET" '#W' 2>/dev/null)

if [ -z "$PANE_ID" ]; then
    tmux display-message "join_pane: could not resolve pane for target: $TARGET"
    exit 1
fi

# 2. Stamp the original name directly onto that specific pane BEFORE moving it
tmux set-option -p -t "$PANE_ID" @wname "$WINDOW_NAME"

# 3. Join the pane using its exact ID
tmux join-pane "$DIRECTION" -s "$PANE_ID"
