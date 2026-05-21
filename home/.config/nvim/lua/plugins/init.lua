-- Download dependencies [vim.pack]
require("plugins.spec")

if package.loaded["plugins.spec"] == false then
  return
end

-- Import
require("config.styles.styles").setup()
require("config.styles.theme").setup()
require("config.styles.icons").setup()
require("config.styles.colors").setup()

require("config.ui.notifications").setup()
require("config.ui.messages").setup()
require("config.ui.dashboard").setup()
require("config.ui.statusline").setup()

require("config.git").setup()
require("config.snippets").setup()
require("config.completion").setup()

require("config.search").setup()
require("config.explorer").setup()

require("config.mason").setup()
require("config.syntax").setup()
require("config.keyhints").setup()
require("config.formatting").setup()
