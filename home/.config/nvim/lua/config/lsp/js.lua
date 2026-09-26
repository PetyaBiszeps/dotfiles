vim.lsp.config("vtsls", {
  settings = {
    javascript = {
      inlayHints = {
        parameterNames = {
          enabled = "literals"
        }
      }
    },

    typescript = {
      inlayHints = {
        parameterNames = {
          enabled = "literals"
        }
      }
    }
  }
})
