---@diagnostic disable: inject-field
local M = {}

function M.setup()
  local plugin_dir = debug.getinfo(1).source:sub(2):match("(.*/)")

  vim.filetype.add({
    extension = {
      awasm = "awasm",
      awa = "awa",
    },
  })

  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

  parser_config.awa5_rs = {
    install_info = {
      url = plugin_dir .. "../tree-sitter-awa5_rs",
      files = { "src/parser.c" },
    },
  }

  parser_config.awatalk = {
    install_info = {
      url = plugin_dir .. "../tree-sitter-awatalk",
      files = { "src/parser.c" },
    },
  }

  vim.treesitter.language.register("awa5_rs", "awasm")
  vim.treesitter.language.register("awatalk", "awa")
end

return M
