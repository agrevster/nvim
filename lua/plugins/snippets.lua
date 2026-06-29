vim.pack.add({ { src = "https://github.com/rafamadriz/friendly-snippets.git" } })
vim.pack.add({ { src = "https://github.com/L3MON4D3/LuaSnip.git", version = vim.version.range("2.*") } })

require("luasnip").setup()
require("luasnip.loaders.from_vscode").load({
	paths = { "./snippets/" },
})
require("luasnip.loaders.from_vscode").lazy_load()
