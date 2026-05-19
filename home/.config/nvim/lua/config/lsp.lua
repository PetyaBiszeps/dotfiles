local M = {}

local servers = {
  "html",
  "cssls",
  "tsgo",
  "gopls",
  "pyright",
  "bashls",
  "vue_ls",
  "texlab",
  "tinymist",
  "svelte"
}

function M.setup()
  vim.lsp.enable(servers)
end

return M
