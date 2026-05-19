if not vim.pack then
  vim.notify("This config requires Neovim with vim.pack support", vim.log.levels.ERROR)
  return
end

-- Native vim.pack [Fuck Lazy]
vim.pack.add({
    -- Git
    { name = "gitsigns.nvim", src = "https://github.com/lewis6991/gitsigns.nvim" },

    -- Theme
    { name = "catppuccin", src = "https://github.com/catppuccin/nvim" },
    { name = "mini.icons", src = "https://github.com/echasnovski/mini.icons" },

    -- UI
    { name = "nui.nvim", src = "https://github.com/MunifTanjim/nui.nvim" },
    { name = "noice.nvim", src = "https://github.com/folke/noice.nvim" },
    { name = "nvim-notify", src = "https://github.com/rcarriga/nvim-notify" },
    { name = "alpha-nvim",  src = "https://github.com/goolord/alpha-nvim" },
    { name = "nvim-highlight-colors", src = "https://github.com/brenoprata10/nvim-highlight-colors" },

    -- Statusline
    { name = "lualine.nvim", src = "https://github.com/nvim-lualine/lualine.nvim" },

    -- Snippets
    { name = "LuaSnip", src = "https://github.com/L3MON4D3/LuaSnip" }
})

require("config.git").setup()
require("config.theme").setup()
require("config.icons").setup()
require("config.noice").setup()
require("config.notify").setup()
require("config.colors").setup()
require("config.snippets").setup()
require("config.dashboard").setup()
require("config.statusline").setup()
