local M = {}

function M.setup()
  require("mini.icons").setup()

  local ok, devicons = pcall(require, "nvim-web-devicons")

  if ok then
    devicons.setup({
      default = true,
    })
  end
end

return M
