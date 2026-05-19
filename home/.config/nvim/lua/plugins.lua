if not vim.pack then
  vim.notify("This config requires Neovim with vim.pack support", vim.log.levels.ERROR)
  return
end

-- Native vim.pack [Fuck Lazy]
vim.pack.add({
    { name = "catppuccin", src = "https://github.com/catppuccin/nvim" },
    { name = "mini.icons", src = "https://github.com/echasnovski/mini.icons" }
})

require("config.theme").setup()
require("config.icons").setup()
