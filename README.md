<div align="center">

# dotfiles

![Platform](https://img.shields.io/badge/platform-Linux-FCC624?style=flat-square&logo=linux&logoColor=black)
![Shell](https://img.shields.io/badge/shell-zsh-89B4FA?style=flat-square)
![Neovim](https://img.shields.io/badge/Neovim-0.9+-57A143?style=flat-square&logo=neovim&logoColor=white)
![tmux](https://img.shields.io/badge/tmux-3.2a-1BB91F?style=flat-square)
![Theme](https://img.shields.io/badge/theme-Kanagawa_·_Catppuccin-CBA6F7?style=flat-square)

Personal development environment — Neovim, tmux, and clangd configured for systems / Linux kernel work.

</div>

---

## 📖 Cheatsheets

| Tool | Description |
|------|-------------|
| [Neovim](cheatsheets/nvim.html) | Keybindings, LSP, plugins, editor settings |
| [tmux](cheatsheets/tmux.html) | Prefix, pane/window/session bindings, copy mode |

---

## 📁 Structure

```
dotfiles/
├── config/             # Symlinked to ~/.config/<name>
│   ├── nvim/           # Neovim — lazy.nvim, LSP, Treesitter, Harpoon, fzf-lua
│   ├── tmux/           # tmux scripts (join, break, clipboard)
│   └── clangd/         # clangd LSP configuration
│
├── dots/               # Symlinked to ~/.<name>
│   └── tmux.conf       # tmux config → ~/.tmux.conf
│
├── cheatsheets/        # Reference docs (not symlinked)
│   ├── nvim.md
│   └── tmux.md
│
└── setup.sh            # One-shot setup — creates all symlinks, installs TPM
```

---

## ⚡ Setup

Clone and run the setup script — it handles everything:

```sh
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
bash setup.sh
```

The script will:
- Symlink `config/*` → `~/.config/`
- Symlink `dots/*` → `~/`
- Clone TPM and install all tmux plugins headlessly

---

## 🛠 What's Configured

### Neovim
- **Theme** — [Kanagawa](https://github.com/rebelot/kanagawa.nvim) Dragon variant
- **LSP** — [clangd](https://clangd.llvm.org/) for C / C++
- **Syntax** — [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) — C, C++, Lua, Rust, Python, Bash, Make, DeviceTree
- **Fuzzy find** — [fzf-lua](https://github.com/ibhagwan/fzf-lua) — files, grep, buffers
- **File marks** — [Harpoon](https://github.com/ThePrimeagen/harpoon/tree/harpoon2) — instant jump to bookmarked files
- **Git** — [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) — hunk navigation and blame
- **Editing** — [mini.nvim](https://github.com/echasnovski/mini.nvim) — auto-pairs, surround, trailing whitespace
- **Statusline** — [lualine](https://github.com/nvim-lualine/lualine.nvim)
- **Indent style** — hard tabs, width 8 (Linux kernel style)

### tmux
- **Theme** — [Catppuccin](https://github.com/catppuccin/tmux) Mocha
- **Plugins** — [TPM](https://github.com/tmux-plugins/tpm), [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)
- **Prefix** — `C-a`
- **Navigation** — Alt + vim keys, no prefix required
- **Clipboard** — `xclip` / `wl-copy` with vi-style copy mode
- **Pane tools** — join/break panes across windows and sessions

### clangd
- Custom `config.yaml` for C / C++ language server behaviour
