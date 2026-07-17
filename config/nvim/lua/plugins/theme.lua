return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme kanagawa-dragon")
      -- Kanagawa Dragon bg is #181616; these are just barely lifted
      vim.api.nvim_set_hl(0, "CursorLine",   { bg = "#1e1c1c" })
      vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#1e1c1c" })
    end,
  }
}
