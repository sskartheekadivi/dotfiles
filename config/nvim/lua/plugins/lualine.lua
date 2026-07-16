return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          theme = "kanagawa",
          component_separators = '|',
          section_separators = '',
          globalstatus = true, -- One status bar for all split windows
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {{
            'filename',
            path = 1, -- Shows relative path (e.g., drivers/dma/ti/k3-udma.c)
          }}, 
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
      })
    end
  }
}
