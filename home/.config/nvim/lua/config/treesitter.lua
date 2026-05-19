local M = {}

local parsers = {
  "bash",
  "css",
  "go",
  "html",
  "javascript",
  "json",
  "latex",
  "lua",
  "markdown",
  "markdown_inline",
  "nix",
  "python",
  "regex",
  "scss",
  "svelte",
  "tsx",
  "typescript",
  "typst",
  "vue"
}

function M.setup()
  local treesitter = require("nvim-treesitter")

  treesitter.install(parsers)

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
