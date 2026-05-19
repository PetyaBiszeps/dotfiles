local M = {}

function M.setup()
  -- Global floating window border for Neovim
  pcall(function()
    vim.o.winborder = "rounded"
  end)

  -- Diagnostic floating windows
  vim.diagnostic.config({
    float = {
      border = "rounded",
      source = "if_many"
    }
  })
end

return M
