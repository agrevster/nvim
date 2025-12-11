return {
	'nvim-treesitter/nvim-treesitter',
	branch = "main",
	build = ':TSUpdate',
	opts = {
		ensure_installed = { "python", "cpp", "lua", "vim", "json", "toml" },
		ignore_install = {}, -- List of parsers to ignore installing
		auto_install = true,
		highlight = {
			enable = true,     -- false will disable the whole extension
			disable = { "help" }, -- list of language that will be disabled
		},
	},
}
