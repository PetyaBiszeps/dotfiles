require("conform").setup({
  format_on_save = {
    timeout_ms = 1000,
    lsp_format = "never"
  },
  notify_on_error = true,
  notify_no_formatters = false
})
