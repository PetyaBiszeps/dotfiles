local M = {}

function M.setup()
  vim.lsp.config("vue_ls", {
    settings = {
      vue = {}
    }
  })
end

return M
