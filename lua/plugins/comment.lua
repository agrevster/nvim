return {
	'numToStr/Comment.nvim',
	opts = {},
	config = function()
		vim.keymap.set('n', '<C-\\>', function()
			require('Comment.api').toggle.linewise.current()
		end)

		vim.keymap.set('v', '<C-\\>', function()
			local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
			vim.api.nvim_feedkeys(esc, 'nx', false)
			require('Comment.api').toggle.linewise(vim.fn.visualmode())
		end)
	end,
}
