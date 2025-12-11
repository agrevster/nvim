vim.cmd.colorscheme "catppuccin-macchiato"
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
-- Disable mouse
--
vim.o.mouse = ''
vim.o.mousescroll = 'ver:0,hor:0'
vim.o.showmode = false

vim.schedule(function()
	vim.o.clipboard = 'unnamedplus'
end)
-- Undo history
vim.o.undofile = true
-- Better serching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 150

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Show whitespace chars
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Enable spellcheck
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.opt.spelloptions = 'camel'

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})


-- Use tabs instead of spaces
vim.opt.expandtab = false

-- A tab character shows as 2 spaces
vim.opt.tabstop = 2

-- Indentation commands (>> and <<) shift by 2 spaces
vim.opt.shiftwidth = 2

-- Backspace/delete treats a tab as 2 spaces
vim.opt.softtabstop = 2
