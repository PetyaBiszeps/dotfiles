local M = {}

M.current = {
  name = "catppuccin",
  style = "mocha"
}

M.themes = {
  catppuccin = {
    setup = function(style)
      require("catppuccin").setup({
        flavour = style or "mocha"
      })

      vim.cmd.colorscheme("catppuccin")
    end
  }
}

function M.setup()
  local theme = M.themes[M.current.name]

  if not theme then
    vim.notify("Theme not found: " .. M.current.name, vim.log.levels.ERROR)
    return
  end

  theme.setup(M.current.style)
end

return M
