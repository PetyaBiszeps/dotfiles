local M = {}

function M.setup()
  local luasnip = require("luasnip")

  luasnip.config.setup({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    delete_check_events = "TextChanged"
  })
end

return M
