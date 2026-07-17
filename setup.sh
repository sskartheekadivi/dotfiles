#!/usr/bin/env bash
# setup.sh — create all symlinks and print post-install steps
#
# Conventions:
#   config/<name>/  →  ~/.config/<name>   (whole directory)
#   dots/<name>     →  ~/.<name>          (individual file, dot is prepended)

set -uo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── colours ────────────────────────────────────────────────────────────────────
if [ -t 1 ]; then
    GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; BOLD='\033[1m'; NC='\033[0m'
else
    GREEN=''; YELLOW=''; RED=''; BOLD=''; NC=''
fi

ok()   { echo -e "${GREEN}  ✔${NC}  $*"; }
skip() { echo -e "${YELLOW}  –${NC}  $*"; }
err()  { echo -e "${RED}  ✘${NC}  $*"; }
hdr()  { echo -e "\n${BOLD}$*${NC}"; }

ERRORS=0

# ── link helper ────────────────────────────────────────────────────────────────
# link <src> <dst>
#   - dst is a correct symlink  → skip
#   - dst is a wrong symlink    → relink (safe: just pointer update)
#   - dst is a real file/dir    → error, leave untouched
#   - dst does not exist        → create symlink
link() {
    local src="$1" dst="$2"

    if [ -L "$dst" ]; then
        local current
        current="$(readlink "$dst")"
        if [ "$current" = "$src" ]; then
            skip "already linked:  $dst"
        else
            ln -sf "$src" "$dst"
            ok "relinked:        $dst  (was → $current)"
        fi
        return
    fi

    if [ -e "$dst" ]; then
        err "skipped:         $dst  (exists and is not a symlink — move it manually)"
        ERRORS=$((ERRORS + 1))
        return
    fi

    ln -s "$src" "$dst"
    ok "linked:          $dst  →  $src"
}

# ── config/ → ~/.config/<name> ────────────────────────────────────────────────
hdr "~/.config/ links  (config/<name> → ~/.config/<name>)"
mkdir -p "$HOME/.config"

for src in "$DOTFILES/config"/*/; do
    src="${src%/}"                       # strip trailing slash
    name="$(basename "$src")"
    link "$src" "$HOME/.config/$name"
done

# ── dots/ → ~/.<name> ─────────────────────────────────────────────────────────
hdr "~/ dotfile links  (dots/<name> → ~/.<name>)"

for src in "$DOTFILES/dots"/*; do
    [ -f "$src" ] || [ -d "$src" ] || continue   # skip unmatched globs / special files
    name="$(basename "$src")"
    link "$src" "$HOME/.$name"
done

# ── summary ───────────────────────────────────────────────────────────────────
echo ""
if [ "$ERRORS" -gt 0 ]; then
    echo -e "${RED}${BOLD}Completed with $ERRORS error(s). See above.${NC}"
else
    echo -e "${GREEN}${BOLD}All symlinks in place.${NC}"
fi

# ── post-install steps ────────────────────────────────────────────────────────
hdr "Post-install steps"

# tmux — TPM
echo -e "  ${BOLD}tmux plugins (TPM)${NC}"
TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ ! -d "$TPM_DIR" ]; then
    echo -e "  ${YELLOW}!${NC}  TPM not found — cloning..."
    if git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"; then
        ok "TPM cloned to $TPM_DIR"
    else
        err "Failed to clone TPM. Check your internet connection and retry."
        ERRORS=$((ERRORS + 1))
    fi
else
    skip "TPM already present at $TPM_DIR"
fi

if [ -d "$TPM_DIR" ]; then
    echo -e "  ${YELLOW}!${NC}  Installing tmux plugins headlessly..."
    if "$TPM_DIR/bin/install_plugins" 2>&1 | sed 's/^/       /'; then
        ok "tmux plugins installed"
    else
        err "Plugin install failed — open tmux and press C-a I to retry manually."
        ERRORS=$((ERRORS + 1))
    fi
fi
echo ""
