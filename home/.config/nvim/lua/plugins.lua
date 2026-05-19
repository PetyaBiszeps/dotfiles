if not vim.pack then
  vim.notify("This config requires Neovim with vim.pack support", vim.log.levels.ERROR)
  return
end

-- Native vim.pack [Fuck Lazy]
vim.pack.add({
  -- Git
  { name = "vim-fugitive", src = "https://github.com/tpope/vim-fugitive" },
  { name = "gitsigns.nvim", src = "https://github.com/lewis6991/gitsigns.nvim" },

  -- Theme
  { name = "catppuccin", src = "https://github.com/catppuccin/nvim" },
  { name = "mini.icons", src = "https://github.com/echasnovski/mini.icons" },

  -- UI
  { name = "nui.nvim", src = "https://github.com/MunifTanjim/nui.nvim" },
  { name = "noice.nvim", src = "https://github.com/folke/noice.nvim" },
  { name = "alpha-nvim", src = "https://github.com/goolord/alpha-nvim" },
  { name = "nvim-notify", src = "https://github.com/rcarriga/nvim-notify" },
  { name = "nvim-highlight-colors", src = "https://github.com/brenoprata10/nvim-highlight-colors" },

  -- Files
  { name = "oil.nvim", src = "https://github.com/stevearc/oil.nvim" },

  -- Completion
  { name = "blink.lib", src = "https://github.com/saghen/blink.lib" },
  { name = "blink.cmp", src = "https://github.com/Saghen/blink.cmp" },

  -- Telescope
  { name = "plenary.nvim", src = "https://github.com/nvim-lua/plenary.nvim" },
  { name = "telescope.nvim", src = "https://github.com/nvim-telescope/telescope.nvim" },

  -- Statusline
  { name = "lualine.nvim", src = "https://github.com/nvim-lualine/lualine.nvim" },

  -- Snippets
  { name = "LuaSnip", src = "https://github.com/L3MON4D3/LuaSnip" },
  { name = "friendly-snippets", src = "https://github.com/rafamadriz/friendly-snippets" },

  -- Languages
  { name = "nvim-lspconfig", src = "https://github.com/neovim/nvim-lspconfig" },
  { name = "nvim-treesitter", src = "https://github.com/nvim-treesitter/nvim-treesitter" },

  -- Keymaps
  { name = "which-key.nvim", src = "https://github.com/folke/which-key.nvim" }
})

-- Import
require("config.styles").setup()

require("config.theme").setup()
require("config.icons").setup()

require("config.notify").setup()
require("config.noice").setup()

require("config.colors").setup()
require("config.git").setup()
require("config.dashboard").setup()
require("config.statusline").setup()

require("config.snippets").setup()
require("config.completion").setup()

require("config.telescope").setup()
require("config.oil").setup()

require("config.treesitter").setup()
require("config.lsp").setup()
require("config.whichkey").setup()
