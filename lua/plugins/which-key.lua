return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		spec = {
			{ '<leader>t', group = '[T]oggle' },
			{ '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
		},
	},
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>f", function() require('conform').format { async = true, lsp_format = 'fallback' } end, desc = "[F]ormat buffer", icon = "󰃢" },
			{ "<leader>y", "<cmd>%yank<cr>", desc = "[Y]ank buffer", icon = "󰆏" },
			{ "<leader>o", "<cmd>Telescope find_files<cr>", desc = "[O]pen File", icon = "" },
			{ "<leader>s", "<cmd>Telescope live_grep<cr>", desc = "[S]earch files", icon = "" },
			{ "<leader>q", "<cmd>Telescope diagnostics<cr>", desc = "Diagnosis and [Quickfixes]", icon = "" },
			{ "<leader>d", "<cmd>Telescope lsp_document_symbols<cr>", desc = "[D]document symbols", icon = "" },
			{ "<leader>t", desc = "[T]oggle" },
			{ '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
		})
	end

}
