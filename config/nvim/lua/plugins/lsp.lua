return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- Silence the ghost errors in the UI
      vim.diagnostic.config({
        virtual_text = false,
        signs = false,
        underline = false,
        update_in_insert = false,
      })

      -- Neovim 0.11+ Native LSP Setup
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy=false",
          "--query-driver=**/*gcc*",
          "--header-insertion=never",
          "--completion-style=detailed",
        },
      })
      vim.lsp.enable("clangd")

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<CR>", opts)
          vim.keymap.set("n", "gs", "<cmd>FzfLua lsp_live_workspace_symbols<CR>", opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        end,
      })
    end,
  }
}
