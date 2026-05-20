local M = {}

function M.setup()
  vim.lsp.config("ts_ls", {
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },

    root_dir = function(bufnr, on_dir)
      local name = vim.api.nvim_buf_get_name(bufnr)
      local path = vim.fs.dirname(name)

      local is_vue_project = vim.fs.find({
        "vite.config.ts",
        "vite.config.js",
        "nuxt.config.ts",
        "nuxt.config.js",
        "vite.config.mjs",
        "vite.config.mts",
      }, {
        upward = true,
        path = path,
      })[1]

      if is_vue_project then
        return
      end

      local root = vim.fs.find({
        "package.json",
        "tsconfig.json",
        "jsconfig.json",
      }, {
        upward = true,
        path = path,
      })[1]

      if root then
        on_dir(vim.fs.dirname(root))
      end
    end,
  })
end

return M
