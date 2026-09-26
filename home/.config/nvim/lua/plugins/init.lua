if not vim.pack then
  error("This config requires Neovim with vim.pack support")
end

vim.pack.add({
  -- Syntax
  {
    name = "nvim-treesitter",
    src = "https://github.com/nvim-treesitter/nvim-treesitter"
  },

  -- LSP
  {
    name = "nvim-lspconfig",
    src = "https://github.com/neovim/nvim-lspconfig"
  },

  -- Mason
  {
    name = "mason.nvim",
    src = "https://github.com/mason-org/mason.nvim"
  }, {
    name = "mason-lspconfig.nvim",
    src = "https://github.com/mason-org/mason-lspconfig.nvim"
  },

  -- Completion
  {
    name = "blink.cmp",
    src = "https://github.com/Saghen/blink.cmp",
    version = vim.version.range("1.*")
  },

  -- Autopairs
  {
    name = "nvim-autopairs",
    src = "https://github.com/windwp/nvim-autopairs"
  }
})
