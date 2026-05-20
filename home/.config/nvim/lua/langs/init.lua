local M = {}

-- Table
M.table = {
  servers = {},
  parsers = {},
  tools = {}
}

-- Helpers
local function extend_unique(target, items)
  if type(items) ~= "table" then
    return
  end

  for _, item in ipairs(items) do
    if not vim.tbl_contains(target, item) then
      table.insert(target, item)
    end
  end
end

local function scan_langs()
  local dir = vim.fn.stdpath("config") .. "/lua/langs"
  local files = vim.fn.glob(dir .. "/*.lua", false, true)

  table.sort(files)

  for _, file in ipairs(files) do
    local name = vim.fn.fnamemodify(file, ":t:r")

    if name ~= "init" then
      local ok, conf = pcall(require, "langs." .. name)

      if ok and type(conf) == "table" then
        local tables = conf.table or {}

        extend_unique(M.table.servers, tables.servers)
        extend_unique(M.table.parsers, tables.parsers)
        extend_unique(M.table.tools, tables.tools)

        if type(conf.setup) == "function" then
          conf.setup()
        end
      elseif not ok then
        vim.notify("Failed to load lang config: " .. name, vim.log.levels.ERROR)
      end
    end
  end
end

scan_langs()

return M
