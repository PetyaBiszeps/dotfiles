local M = {}

function M.setup()
  require("mason").setup({
    ui = {
      border = "rounded"
    }
  })

  require("mason-lspconfig").setup({
    ensure_installed = {
      "bashls",
      "cssls",
      "gopls",
      "html",
      "pyright",
      "svelte",
      "texlab",
      "tinymist",
      "ts_ls",
      "vue_ls",
    },
    automatic_enable = true
  })

  require("mason-tool-installer").setup({
    ensure_installed = {
      "stylua",
      "prettierd",
      "prettier",
      "ruff",
      "shfmt",
      "typstyle"
    }
  })
end

return M
