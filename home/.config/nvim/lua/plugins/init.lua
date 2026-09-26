if not vim.pack then
  error("This config requires Neovim with vim.pack support")
end

local plugins = require("plugins.spec")

if #plugins > 0 then
  vim.pack.add(plugins)
end
