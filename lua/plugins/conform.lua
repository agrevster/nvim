return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = function(bufnr)
			local ft = vim.bo[bufnr].filetype
			if ft == "java" then
				return false -- disable for Java
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			luau = { "stylua" },
			python = { "black" },
			rust = { "rustfmt", lsp_format = "fallback" },
			java = {},
		},
	},
}
