vim.pack.add({ { src = "https://github.com/nvim-lualine/lualine.nvim.git" } })
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "catppuccin-nvim",
		component_separators = "|",
		section_separators = "",
	},
})
