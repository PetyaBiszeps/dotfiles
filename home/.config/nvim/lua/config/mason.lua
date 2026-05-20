local langs = require("langs")

local M = {}

function M.setup()
  require("mason").setup({
    ui = {
      border = "rounded"
    }
  })

  require("mason-lspconfig").setup({
    ensure_installed = langs.table.servers,
    automatic_enable = true
  })

  require("mason-tool-installer").setup({
    ensure_installed = langs.table.tools
  })
end

return M
