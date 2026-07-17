#!/usr/bin/env bash
TARGET_SESSION="$1"

# Read the stamped window name from the current pane
WNAME=$(tmux display-message -p '#{@wname}')

# Clean the target string: strip the session-name portion only.
# choose-tree -s can return formats like 'session:window.pane'; keep only the session name.
if [ -n "$TARGET_SESSION" ]; then
    TARGET_SESSION="${TARGET_SESSION%%:*}"
fi

if [ -n "$WNAME" ]; then
    if [ -n "$TARGET_SESSION" ]; then
        tmux break-pane -n "$WNAME" -t "${TARGET_SESSION}:"
    else
        tmux break-pane -n "$WNAME"
    fi
    # Clear the stamped name so it doesn't persist if this pane is broken again later
    tmux set-option -p -u @wname
else
    if [ -n "$TARGET_SESSION" ]; then
        tmux break-pane -t "${TARGET_SESSION}:"
    else
        tmux break-pane
    fi
fi
