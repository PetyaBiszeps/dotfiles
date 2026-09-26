if not vim.pack then
  error("This config requires Neovim with vim.pack support")
end

vim.pack.add({
  -- Core
  {
    name = "nvim-treesitter",
    src = "https://github.com/nvim-treesitter/nvim-treesitter"
  }
})
