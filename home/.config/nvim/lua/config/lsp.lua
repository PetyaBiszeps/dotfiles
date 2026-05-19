local M = {}

local servers = {
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
}

function M.setup()
  vim.lsp.enable(servers)
end

return M
