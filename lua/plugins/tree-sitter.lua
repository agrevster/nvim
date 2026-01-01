return {
	'nvim-treesitter/nvim-treesitter',
	branch = "master",
	build = ':TSUpdate',
	opts = {
		auto_install = true,
		highlight = {
			enable = true,     -- false will disable the whole extension
			disable = { "help" }, -- list of language that will be disabled
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
