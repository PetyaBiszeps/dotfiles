local M = {}

function M.setup()
  require("mason").setup({
    ui = {
      border = "rounded",
    },
  })

  require("mason-lspconfig").setup({
    ensure_installed = {
      "bashls",
      "gopls",
      "pyright",
      "ts_ls",
      "vue_ls",
      "texlab",
      "tinymist",
    },
    automatic_enable = false,
  })

  require("mason-tool-installer").setup({
    ensure_installed = {
      "stylua",
      "prettierd",
      "prettier",
      "ruff",
      "shfmt",
      "typstyle",
    }
  })
end

return M
