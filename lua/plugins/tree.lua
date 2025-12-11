return {
	'nvim-tree/nvim-tree.lua',
	requires = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.opt.termguicolors = true
		require('nvim-tree').setup {
			filters = { custom = { '^.git$' } },
		}
		vim.keymap.set('n', '<C-o>', '<cmd>:NvimTreeFocus<cr>')
	end,
}
