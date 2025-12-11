return {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets', 'L3MON4D3/LuaSnip', 'folke/lazydev.nvim' },
	version = '1.*',
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = { preset = 'enter' },


		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = 'mono'
		},
		snippets = { preset = 'luasnip' },
		signature = { enabled = true },
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
			providers = {
				lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
			},
		},
		completion = {

			-- By default, you may press `<c-space>` to show the documentation.
			-- Optionally, set `auto_show = true` to show the documentation after a delay.
			documentation = { auto_show = true, auto_show_delay_ms = 200 },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = { "sources.default" }
}
