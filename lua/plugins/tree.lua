vim.pack.add({{src="https://github.com/nvim-tree/nvim-tree.lua.git"}})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
require("nvim-tree").setup({
filters = { custom = { "^.git$" } },
})
vim.keymap.set("n", "<C-o>", "<cmd>:NvimTreeFocus<cr>")
