local M = {}

-- Table
M.table = {
  servers = {
    "yamlls"
  },
  parsers = {
    "yaml"
  },
  tools = {}
}

-- Setup
function M.setup()
  vim.filetype.add({
    filename = {
      ["docker-compose.yml"] = "yaml.docker-compose",
      ["docker-compose.yaml"] = "yaml.docker-compose",
      ["compose.yml"] = "yaml.docker-compose",
      ["compose.yaml"] = "yaml.docker-compose",

      [".gitlab-ci.yml"] = "yaml.gitlab",
      [".gitlab-ci.yaml"] = "yaml.gitlab"
    },
    pattern = {
      [".*/values%.ya?ml"] = "yaml.helm-values"
    }
  })

  vim.lsp.config("yamlls", {
    filetypes = {
      "yaml",
      "yaml.docker-compose",
      "yaml.gitlab",
      "yaml.helm-values"
    },

    settings = {
      yaml = {
        validate = true,
        completion = true,
        hover = true,
        format = {
          enable = false
        },
        schemaStore = {
          enable = true
        }
      }
    }
  })
end

return M
