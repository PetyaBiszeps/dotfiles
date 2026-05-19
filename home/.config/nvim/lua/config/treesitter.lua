local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "bash",
      "css",
      "go",
      "html",
      "javascript",
      "json",
      "latex",
      "lua",
      "markdown",
      "markdown_inline",
      "nix",
      "python",
      "regex",
      "scss",
      "svelte",
      "tsx",
      "typescript",
      "typst",
      "vue"
    },

    sync_install = false,
    auto_install = true,

    highlight = {
      enable = true
    },

    indent = {
      enable = true
    }
  })
end

return M
