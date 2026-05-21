local M = {}

function M.setup()
  require("blink.cmp").setup({
    signature = {
      enabled = true
    },

    keymap = {
      preset = "super-tab"
    },

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200
      },

      menu = {
        auto_show = true
      }
    },

    sources = {
      default = {
        "lsp",
        "path",
        "buffer",
        "snippets"
      }
    },

    fuzzy = {
      implementation = "prefer_rust",

      sorts = {
        "exact",
        "score",
        "sort_text"
      }
    }
  })
end

return M
