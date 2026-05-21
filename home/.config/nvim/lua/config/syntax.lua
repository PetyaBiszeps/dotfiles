local langs = require("langs")

local M = {}

function M.setup()
  local treesitter = require("nvim-treesitter")

  treesitter.install(langs.table.parsers)

  vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
      local ok = pcall(vim.treesitter.start, args.buf)

      if not ok then
        return
      end
    end
  })
end

return M
