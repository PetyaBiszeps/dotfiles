-- Download dependencies [vim.pack]
require("plugins.spec")

if package.loaded["plugins.spec"] == false then
  return
end

-- Import
require("config.git").setup()
require("config.mason").setup()

require("config.style.styles").setup()
require("config.style.theme").setup()
require("config.style.icons").setup()
require("config.style.colors").setup()

require("config.ui.notifications").setup()
require("config.ui.messages").setup()
require("config.ui.dashboard").setup()
require("config.ui.statusline").setup()

require("config.workflow.search").setup()
require("config.workflow.explorer").setup()
require("config.workflow.keyhints").setup()

require("config.coding.snippets").setup()
require("config.coding.completion").setup()
require("config.coding.syntax").setup()
require("config.coding.formatting").setup()
