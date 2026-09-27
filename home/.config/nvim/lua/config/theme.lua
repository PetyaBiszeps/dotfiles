require("jb").setup()

vim.o.background = "dark"
vim.cmd.colorscheme("jb")

vim.api.nvim_set_hl(0, "@lsp.type.function.vue", {
  link = "@function.call.typescript"
})
