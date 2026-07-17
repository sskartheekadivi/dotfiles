return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      local lsp_status = ""
      vim.api.nvim_create_autocmd("LspProgress", {
        callback = function()
          lsp_status = vim.lsp.status():gsub("%%", "%%%%")
          require("lualine").refresh()
        end,
      })

      require("lualine").setup({
        options = {
          theme = "cyberdream",
          component_separators = '|',
          section_separators = '',
          globalstatus = true, -- One status bar for all split windows
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {
            { 'filename', path = 1 },
            { function() return lsp_status end },
          },
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
      })
    end
  }
}
