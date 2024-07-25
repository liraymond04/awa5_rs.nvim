# awa5_rs.nvim

Provides syntax highlighting and [Tree-sitter](https://github.com/tree-sitter/tree-sitter) support for [AWA5.RS](https://github.com/liraymond04/awa5_rs) in [Neovim](https://github.com/neovim/neovim) using the [tree-sitter-awa5_rs](https://github.com/liraymond04/tree-sitter-awa5_rs) custom Tree-sitter grammar

The [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) plugin needs to be installed and setup before the setup for this plugin can be run properly

Supported Neovim versions:

- 0.10.x (Recommended)

## Installation

The plugin can be installed with your favourite Neovim plugin manager such as [lazy.nvim](https://github.com/folke/lazy.nvim),

```lua
-- lazy.nvim
{
  "liraymond04/awa5_rs.nvim",
},
```
And setup in your configuration,

```lua
local treesitter_configs = require("nvim-treesitter.configs")
treesitter_configs.setup({
  -- add your other nvim-treesitter configs here
  highlight = {
    -- make sure this is enabled to see syntax highlighting
    enable = true,
  },
})

local awa5_rs = require("awa5_rs")
-- make sure this setup is run after nvim-treesitter is already setup
awa5_rs.setup({})
```

You will need to restart Neovim, and it will give you some errors about the `awa5_rs` parser not being yet installed

To fix this error, run:

```
:TSInstall awa5_rs
```

And restart Neovim again, and syntax highlighting should now be working for files with extension `.awasm`
