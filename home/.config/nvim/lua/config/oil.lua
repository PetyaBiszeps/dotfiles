local M = {}

function M.setup()
  require("oil").setup({
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    watch_for_changes = true,

    columns = {
      "icon"
    },

    view_options = {
      show_hidden = true,
      natural_order = "fast",
      sort = {
        { "type", "asc" },
        { "name", "asc" }
      }
    },

    float = {
      border = "rounded",
      padding = 2,
      max_width = 0.9,
      max_height = 0.9
    }
  })
end

return M
