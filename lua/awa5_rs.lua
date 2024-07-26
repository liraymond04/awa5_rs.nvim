local M = {}

function M.setup(config)
  if not config then
    config = {}
  end

  local plugin_dir = debug.getinfo(1).source:sub(2):match("(.*/)")

  -- Register the parser with the extension
  vim.cmd [[
    augroup _awa5_rs
      autocmd!
      autocmd BufRead,BufNewFile *.awasm set filetype=awasm
    augroup end
    augroup _awatalk
      autocmd!
      autocmd BufRead,BufNewFile *.awa set filetype=awa
    augroup end
  ]]

  local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
  ---@diagnostic disable-next-line: inject-field
  parser_config.awa5_rs = {
    install_info = {
      url = plugin_dir .. "../tree-sitter-awa5_rs",
      files = { "src/parser.c" },
      -- optional entries:
      branch = "main",                        -- default branch in case of git repo if different from master
      generate_requires_npm = false,          -- if stand-alone parser without npm dependencies
      requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
    },
    filetype = "awasm",                       -- if filetype does not match the parser name
  }
  ---@diagnostic disable-next-line: inject-field
  parser_config.awatalk = {
    install_info = {
      url = plugin_dir .. "../tree-sitter-awatalk",
      files = { "src/parser.c" },
      -- optional entries:
      branch = "main",                        -- default branch in case of git repo if different from master
      generate_requires_npm = false,          -- if stand-alone parser without npm dependencies
      requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
    },
    filetype = "awa",                         -- if filetype does not match the parser name
  }

  vim.treesitter.language.register('awa5_rs', 'awasm')
  vim.treesitter.language.register('awatalk', 'awa')
end

return M
