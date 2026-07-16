return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf = require("fzf-lua")
      fzf.setup({ profile = "default-title" })

      vim.keymap.set("n", "<Leader>ff", fzf.files, { desc = "Find Files" })
      vim.keymap.set("n", "<Leader>fg", fzf.live_grep, { desc = "Live Grep" })
      vim.keymap.set("n", "<Leader>fb", fzf.buffers, { desc = "Find Buffers" })
      vim.keymap.set("n", "<Leader>fh", fzf.help_tags, { desc = "Help Tags" })
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      vim.keymap.set("n", "<Leader>a", function() harpoon:list():add() end, { desc = "Harpoon Add" })
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Menu" })

      vim.keymap.set("n", "<Leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon 1" })
      vim.keymap.set("n", "<Leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon 2" })
      vim.keymap.set("n", "<Leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon 3" })
      vim.keymap.set("n", "<Leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon 4" })
    end,
  }
}
