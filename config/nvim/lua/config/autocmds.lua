local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("TextYankPost", {
  group = augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

autocmd("FileType", {
  group = augroup("kernel_mail_settings", { clear = true }),
  pattern = { "mail", "gitcommit", "text" },
  callback = function()
    vim.opt_local.colorcolumn = "75"
    vim.opt_local.textwidth = 75
    vim.opt_local.spell = true
  end,
})
