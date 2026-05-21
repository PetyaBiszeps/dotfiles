local M = {}

function M.setup()
  require("noice").setup({
    presets = {
      bottom_search = true,
      lsp_doc_border = true,
      command_palette = true,
      long_message_to_split = true
    },

    lsp = {
      signature = {
        enabled = true,
      },

      override = {
        ["cmp.entry.get_documentation"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true
      }
    }
  })
end

return M
