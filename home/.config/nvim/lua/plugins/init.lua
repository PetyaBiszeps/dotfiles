-- Download dependencies [vim.pack]
require("plugins.spec")

if package.loaded["plugins.spec"] == false then
  return
end

-- Import
require("config.ui.styles").setup()
require("config.ui.theme").setup()
require("config.ui.icons").setup()

require("config.notify").setup()
require("config.noice").setup()

require("config.ui.colors").setup()
require("config.git").setup()
require("config.dashboard").setup()
require("config.statusline").setup()

require("config.snippets").setup()
require("config.completion").setup()

require("config.telescope").setup()
require("config.oil").setup()

require("config.mason").setup()
require("config.treesitter").setup()
require("config.whichkey").setup()
require("config.formatting").setup()
