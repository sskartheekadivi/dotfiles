<div align="center">

# tmux Cheatsheet

![tmux](https://img.shields.io/badge/tmux-3.2a-1BB91F?style=flat-square&logo=tmux&logoColor=white)
![theme](https://img.shields.io/badge/theme-Catppuccin_Mocha-CBA6F7?style=flat-square)
![TPM](https://img.shields.io/badge/TPM-v3.0.0-89B4FA?style=flat-square)

</div>

---

## Legend

| Notation | Meaning |
|----------|---------|
| <kbd>C-a</kbd> | **Prefix** — hold Ctrl, press a |
| <kbd>M-x</kbd> | **Meta** — hold Alt, press x &nbsp;·&nbsp; *no prefix needed* |
| <kbd>prefix</kbd> <kbd>x</kbd> | Press prefix first, release, then press x |

> [!TIP]
> Most day-to-day bindings use **Alt** (no prefix needed), keeping your hands on the home row.

---

## 🖥️ Sessions

| Key | Action |
|-----|--------|
| <kbd>M-↑</kbd> | Previous session |
| <kbd>M-↓</kbd> | Next session |
| <kbd>prefix</kbd> <kbd>$</kbd> | Rename session |
| <kbd>prefix</kbd> <kbd>s</kbd> | Interactive session list |
| <kbd>prefix</kbd> <kbd>d</kbd> | Detach |

---

## 🪟 Windows

| Key | Action |
|-----|--------|
| <kbd>M-←</kbd> | Previous window |
| <kbd>M-→</kbd> | Next window |
| <kbd>M-c</kbd> | New window *(inherits current path)* |
| <kbd>prefix</kbd> <kbd>,</kbd> | Rename window |
| <kbd>prefix</kbd> <kbd>w</kbd> | Interactive window list |

---

## 🔲 Panes

### Navigate

| Key | Action |
|-----|--------|
| <kbd>M-h</kbd> | Focus left |
| <kbd>M-j</kbd> | Focus down |
| <kbd>M-k</kbd> | Focus up |
| <kbd>M-l</kbd> | Focus right |

### Resize

| Key | Action |
|-----|--------|
| <kbd>M-H</kbd> | Resize left 5 |
| <kbd>M-J</kbd> | Resize down 5 |
| <kbd>M-K</kbd> | Resize up 5 |
| <kbd>M-L</kbd> | Resize right 5 |

### Create & Destroy

| Key | Action |
|-----|--------|
| <kbd>M-v</kbd> | Split vertically — side by side *(inherits current path)* |
| <kbd>M-s</kbd> | Split horizontally — top/bottom *(inherits current path)* |
| <kbd>M-z</kbd> | Toggle zoom (fullscreen) |
| <kbd>M-x</kbd> | Kill pane *(prompts for confirmation)* |

### Join & Break

| Key | Action |
|-----|--------|
| <kbd>M--</kbd> | Pull a pane **into** current window — horizontal split |
| <kbd>M-=</kbd> | Pull a pane **into** current window — vertical split |
| <kbd>M-b</kbd> | **Break** pane out to a new window *(restores its original name)* |
| <kbd>M-B</kbd> | **Break** pane out to a chosen session *(pick from tree)* |

> [!NOTE]
> Join and break open an interactive tree picker. Use arrow keys to select the target pane/session.

---

## 📋 Copy Mode

> [!NOTE]
> Copy mode uses **vi** keys. Yanked text is sent to the system clipboard via `xclip` / `wl-copy`.

| Key | Action |
|-----|--------|
| <kbd>[</kbd> | Enter copy mode |
| <kbd>v</kbd> | Begin selection |
| <kbd>C-v</kbd> | Toggle rectangle (block) selection |
| <kbd>y</kbd> | Yank selection → system clipboard & exit |
| <kbd>Escape</kbd> | Cancel / exit copy mode |

---

## ⚙️ Prefix Commands

| Key | Action |
|-----|--------|
| <kbd>prefix</kbd> <kbd>C-a</kbd> | Send literal `Ctrl+a` to the terminal |
| <kbd>prefix</kbd> <kbd>r</kbd> | Reload config |
| <kbd>prefix</kbd> <kbd>:</kbd> | tmux command prompt |
| <kbd>prefix</kbd> <kbd>?</kbd> | List all key bindings |

---

## 🔌 Plugin Manager (TPM)

| Key | Action |
|-----|--------|
| <kbd>prefix</kbd> <kbd>I</kbd> | Install plugins |
| <kbd>prefix</kbd> <kbd>U</kbd> | Update plugins |
| <kbd>prefix</kbd> <kbd>M-u</kbd> | Remove unused plugins |

---

## 🖱️ Mouse

Mouse is **enabled** — click to focus a pane or select a window, drag to scroll.

> [!TIP]
> Hold <kbd>Shift</kbd> while clicking/dragging to bypass tmux and use your terminal's native selection (useful for copying with the mouse without entering copy mode).

---

<details>
<summary>📁 Config & File Locations</summary>

<br>

| Purpose | Path |
|---------|------|
| Main config | `~/dotfiles/dots/tmux.conf` |
| Scripts | `~/dotfiles/config/tmux/scripts/` |
| Symlink — config dir | `~/.config/tmux` → `~/dotfiles/config/tmux` |
| Symlink — config file | `~/.tmux.conf` → `~/dotfiles/dots/tmux.conf` |
| TPM plugins | `~/.tmux/plugins/` *(managed by TPM, not tracked in dotfiles)* |

</details>
