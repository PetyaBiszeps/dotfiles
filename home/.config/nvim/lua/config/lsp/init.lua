-- LSP Configuration
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client then
      vim.lsp.completion.enable(true, client.id, args.buf, {
        autotrigger = true
      })
    end
  end
})

-- Imports
require("config.lsp.vue")
