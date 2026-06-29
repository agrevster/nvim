vim.pack.add({{src="https://github.com/nvim-mini/mini.comment.git"}})

require("mini.comment").setup(
	{
  mappings = {
    -- Toggle comment (like `gcip` - comment inner paragraph) for both
    -- Normal and Visual modes
    comment = '<C-\\>',

    -- Toggle comment on current line
    comment_line = '<C-\\>',

    -- Toggle comment on visual selection
    comment_visual = '<C-\\>',

    -- Define 'comment' textobject (like `dgc` - delete whole comment block)
    -- Works also in Visual mode if mapping differs from `comment_visual`
    textobject = '<C-\\>',
  }
}
)

return {
	"numToStr/Comment.nvim",
	opts = {},
	config = function()
		vim.keymap.set("n", "<C-\\>", function()
			require("Comment.api").toggle.linewise.current()
		end)

		vim.keymap.set("v", "<C-\\>", function()
			local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
			vim.api.nvim_feedkeys(esc, "nx", false)
			require("Comment.api").toggle.linewise(vim.fn.visualmode())
		end)
	end,
}
