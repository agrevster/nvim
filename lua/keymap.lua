local keymap = vim.keymap

-- Change text without putting it into the vim register,
-- see https://stackoverflow.com/q/54255/6064933
keymap.set("n", "c", '"_c')
keymap.set("n", "C", '"_C')
keymap.set("n", "cc", '"_cc')
keymap.set("x", "c", '"_c')
keymap.set("x", "p", '"_c<Esc>p')

-- Switch wi*ow
keymap.set('n', '<C-l>', ':tabnext<CR>', { noremap = true, silent = true })
keymap.set('n', '<C-h>', ':tabprevious<CR>', { noremap = true, silent = true })
keymap.set('n', '<C-n>', ':tabnew<CR>', { noremap = true, silent = true })
keymap.set('n', '<C-Enter>', ':tabnew | term<CR>', { noremap = true, silent = true })


-- insert semicolon in the end
keymap.set("i", "<A-;>", "<Esc>miA;<Esc>`ii")
