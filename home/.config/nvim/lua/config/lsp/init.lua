local M = {}

local function load_configs()
  local current_file = debug.getinfo(1, "S").source:sub(2)
  local current_dir = vim.fn.fnamemodify(current_file, ":p:h")
  local files = vim.fn.glob(current_dir .. "/*.lua", false, true)

  table.sort(files)

  for _, file in ipairs(files) do
    local name = vim.fn.fnamemodify(file, ":t:r")

    if name ~= "init" then
      local ok, module = pcall(require, "config.lsp." .. name)

      if ok and type(module.setup) == "function" then
        module.setup()
      elseif not ok then
        vim.notify("Failed to load LSP config: " .. name, vim.log.levels.ERROR)
      end
    end
  end
end

function M.setup()
  load_configs()
end

return M
