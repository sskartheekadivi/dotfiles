return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({})
      vim.cmd("colorscheme cyberdream")

      -- Absolute black background (cyberdream default is #16181a)
      vim.api.nvim_set_hl(0, "Normal",      { bg = "#000000" })
      vim.api.nvim_set_hl(0, "NormalNC",    { bg = "#000000" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })

      -- Subtle cursor row/col: slightly lifted gray
      vim.api.nvim_set_hl(0, "CursorLine",   { bg = "#141414" })
      vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#141414" })

      -- Subtle col 80/100 markers: slightly dimmer gray
      vim.api.nvim_set_hl(0, "ColorColumn",  { bg = "#0f0f0f" })
    end,
  }
}
