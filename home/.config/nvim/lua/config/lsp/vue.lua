local M = {}

function M.setup()
  local vue_language_server_path = vim.fn.stdpath("data")
    .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

  local vue_plugin = {
    name = "@vue/typescript-plugin",
    location = vue_language_server_path,
    languages = {
      "vue"
    },
    configNamespace = "typescript"
  }

  local vue_root_markers = {
    "vite.config.ts",
    "vite.config.js",
    "nuxt.config.ts",
    "nuxt.config.js",
  }

  vim.lsp.config("vue_ls", {
    filetypes = { "vue" },

    root_dir = function(bufnr, on_dir)
      local name = vim.api.nvim_buf_get_name(bufnr)
      local path = vim.fs.dirname(name)

      local root = vim.fs.find(vue_root_markers, {
        upward = true,
        path = path,
      })[1]

      if root then
        on_dir(vim.fs.dirname(root))
      end
    end,
  })

  vim.lsp.config("vtsls", {
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
    },

    settings = {
      vtsls = {
        tsserver = {
          globalPlugins = {
            vue_plugin,
          },
        },
      },
    },

    root_dir = function(bufnr, on_dir)
      local name = vim.api.nvim_buf_get_name(bufnr)
      local path = vim.fs.dirname(name)

      local root = vim.fs.find(vue_root_markers, {
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
