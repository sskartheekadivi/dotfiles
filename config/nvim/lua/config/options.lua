vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.termguicolors = true

-- Linux Kernel Tab Rules
opt.tabstop = 8
opt.shiftwidth = 8
opt.softtabstop = 8
opt.expandtab = false
opt.smartindent = true

-- Visual Limits
vim.opt.cursorline = true   -- Highlights the current row
vim.opt.cursorcolumn = true -- Highlights the current column
opt.colorcolumn = "80,100"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
