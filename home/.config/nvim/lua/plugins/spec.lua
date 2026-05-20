if not vim.pack then
  vim.notify("This config requires Neovim with vim.pack support", vim.log.levels.ERROR)
  return false
end

-- Native vim.pack [Fuck Lazy]
vim.pack.add({
  -- Core
  { name = "nvim-lspconfig", src = "https://github.com/neovim/nvim-lspconfig" },
  { name = "nvim-treesitter", src = "https://github.com/nvim-treesitter/nvim-treesitter" },

  -- Mason
  { name = "mason.nvim", src = "https://github.com/mason-org/mason.nvim" },
  { name = "mason-lspconfig.nvim", src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { name = "mason-tool-installer.nvim", src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },

  -- Completion
  { name = "blink.lib", src = "https://github.com/saghen/blink.lib" },
  { name = "blink.cmp", src = "https://github.com/Saghen/blink.cmp" },

  -- Formatting
  { name = "conform.nvim", src = "https://github.com/stevearc/conform.nvim" },

  -- Snippets
  { name = "LuaSnip", src = "https://github.com/L3MON4D3/LuaSnip" },
  { name = "friendly-snippets", src = "https://github.com/rafamadriz/friendly-snippets" },

  -- Telescope
  { name = "plenary.nvim", src = "https://github.com/nvim-lua/plenary.nvim" },
  { name = "telescope.nvim", src = "https://github.com/nvim-telescope/telescope.nvim" },

  -- Files
  { name = "oil.nvim", src = "https://github.com/stevearc/oil.nvim" },

  -- Git
  { name = "vim-fugitive", src = "https://github.com/tpope/vim-fugitive" },
  { name = "gitsigns.nvim", src = "https://github.com/lewis6991/gitsigns.nvim" },

  -- UI
  { name = "nui.nvim", src = "https://github.com/MunifTanjim/nui.nvim" },
  { name = "noice.nvim", src = "https://github.com/folke/noice.nvim" },
  { name = "alpha-nvim", src = "https://github.com/goolord/alpha-nvim" },
  { name = "nvim-notify", src = "https://github.com/rcarriga/nvim-notify" },
  { name = "nvim-highlight-colors", src = "https://github.com/brenoprata10/nvim-highlight-colors" },

  -- Styling
  { name = "catppuccin", src = "https://github.com/catppuccin/nvim" },
  { name = "mini.icons", src = "https://github.com/echasnovski/mini.icons" },
  { name = "nvim-web-devicons", src = "https://github.com/nvim-tree/nvim-web-devicons" },

  -- Statusline
  { name = "lualine.nvim", src = "https://github.com/nvim-lualine/lualine.nvim" },

  -- Keymaps
  { name = "which-key.nvim", src = "https://github.com/folke/which-key.nvim" }
})
