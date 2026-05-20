local M = {}

local function load_configs()
  local current_file = debug.getinfo(1, "S").source:sub(2)
  local current_dir = vim.fn.fnamemodify(current_file, ":p:h")
  local files = vim.fn.glob(current_dir .. "/*.lua", false, true)

  for _, file in ipairs(files) do
    local name = vim.fn.fnamemodify(file, ":t:r")

    if name ~= "init" then
      require("config.lsp." .. name).setup()
    end
  end
end

function M.setup()
  load_configs()
end

return M
