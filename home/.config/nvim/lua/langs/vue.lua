local M = {}

-- Table
M.table = {
  servers = {
    "vtsls",
    "vue_ls"
  },
  parsers = {
    "vue"
  },
  tools = {}
}

-- Helper
local function root_dir(bufnr, on_dir)
  local name = vim.api.nvim_buf_get_name(bufnr)
  local path = vim.fs.dirname(name)

  local root = vim.fs.find({
    "vite.config.js",
    "vite.config.ts",
    "nuxt.config.js",
    "nuxt.config.ts",
    "vite.config.mjs",
    "vite.config.mts"
  }, {
    upward = true,
    path = path
  })[1]

  if root then
    on_dir(vim.fs.dirname(root))
  end
end

-- Setup
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

  vim.lsp.config("vue_ls", {
    filetypes = {
      "vue"
    },
    root_dir = root_dir
  })

  vim.lsp.config("vtsls", {
    filetypes = {
      "vue",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact"
    },

    settings = {
      vtsls = {
        tsserver = {
          globalPlugins = {
            vue_plugin
          }
        }
      }
    },
    root_dir = root_dir
  })
end

return M
