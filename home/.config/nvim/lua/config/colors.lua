local M = {}

function M.setup()
  require("nvim-highlight-colors").setup({
    render = "background",
    enable_tailwind = true
  })
end

return M
