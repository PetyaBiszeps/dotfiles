if not vim.pack then
  vim.notify("This config requires Neovim with vim.pack support", vim.log.levels.ERROR)
  return
end

-- Native vim.pack [Fuck Lazy]
vim.pack.add({
    -- Theme
    { name = "catppuccin", src = "https://github.com/catppuccin/nvim" },
    { name = "mini.icons", src = "https://github.com/echasnovski/mini.icons" },

    -- UI
    { name = "nui.nvim", src = "https://github.com/MunifTanjim/nui.nvim" },
    { name = "noice.nvim", src = "https://github.com/folke/noice.nvim" },
    { name = "nvim-notify", src = "https://github.com/rcarriga/nvim-notify" }
})

require("config.theme").setup()
require("config.icons").setup()
require("config.noice").setup()
require("config.notify").setup()
