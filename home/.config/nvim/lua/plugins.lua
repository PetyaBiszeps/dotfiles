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
    { name = "nvim-notify", src = "https://github.com/rcarriga/nvim-notify" },
    { name = "alpha-nvim",  src = "https://github.com/goolord/alpha-nvim" },
    { name = "nvim-highlight-colors", src = "https://github.com/brenoprata10/nvim-highlight-colors" }
})

require("config.theme").setup()
require("config.icons").setup()
require("config.noice").setup()
require("config.notify").setup()
require("config.colors").setup()
require("config.dashboard").setup()
