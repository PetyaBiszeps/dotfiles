local M = {}

function M.setup()
  require("which-key").setup({
    preset = "modern",
    win = {
      border = "rounded"
    }
  })
end

return M
