return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" }, -- Load only when a file opens
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    config = function()
      local status_ok, configs = pcall(require, "nvim-treesitter.configs")
      if not status_ok then
        return
      end

      configs.setup({
        ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "bash", "make", "python", "devicetree", "rust" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = false },
      })
    end,
  }
}
