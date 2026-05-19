local M = {}

local servers = {
  "nixd",
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
  vim.lsp.config("nixd", {
    settings = {
      nixd = {
        autoArchive = true
      }
    }
  })

  vim.lsp.enable(servers)
end

return M
