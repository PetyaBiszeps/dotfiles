local M = {}

function M.setup()
  require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },

      javascript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      vue = { "prettierd", "prettier", stop_after_first = true },
      svelte = { "prettierd", "prettier", stop_after_first = true },

      python = { "ruff_format", "ruff_fix" },

      html = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd", "prettier", stop_after_first = true },
      scss = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "prettierd", "prettier", stop_after_first = true },
      yaml = { "prettierd", "prettier", stop_after_first = true },

      sh = { "shfmt" },
      bash = { "shfmt" },

      go = { "gofmt" },
      typst = { "typstyle" }
    },

    format_on_save = {
      timeout_ms = 1000,
      lsp_format = "fallback"
    }
  })
end

return M
