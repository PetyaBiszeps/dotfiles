local langs = require("langs")
local treesitter = require("nvim-treesitter")

treesitter.install(langs.parsers)

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end
})
