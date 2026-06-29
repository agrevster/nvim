vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Plugins
require("plugins.lazydev")
require("plugins.theme")
require("plugins.gitsigns")
require("plugins.tree-sitter-mgr")
require("plugins.statusline")
require("plugins.icons")
require("plugins.snippets")
require("plugins.tree")
require("plugins.telescope")
require("plugins.todo")
require("plugins.which-key")
require("plugins.comment")
require("plugins.indent")
require("plugins.marker")
require("plugins.pairs")
require("plugins.jdtls")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.conform")
-- Other modules
require("keymap")
require("general")
