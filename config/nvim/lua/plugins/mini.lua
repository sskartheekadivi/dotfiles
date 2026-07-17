return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.trailspace").setup()
      require("mini.pairs").setup()
      require("mini.surround").setup()
      
      vim.keymap.set("n", "<Leader>cw", function()
        require("mini.trailspace").trim()
      end, { desc = "Clean Trailing Whitespace" })
    end,
  }
}
