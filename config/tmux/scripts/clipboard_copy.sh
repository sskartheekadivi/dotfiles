#!/usr/bin/env bash
if command -v xclip >/dev/null 2>&1; then
    xclip -in -selection clipboard
elif command -v wl-copy >/dev/null 2>&1; then
    wl-copy
else
    tmux display-message "clipboard: no tool found — install xclip or wl-clipboard"
fi
