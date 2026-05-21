local M = {}

function M.setup()
  local notify = require("notify")

  notify.setup({
    render = "compact",
    stages = "fade_in_slide_out",
    timeout = 2000,
    top_down = true
  })

  vim.notify = notify
end

return M
