-- luacheck: globals vim

vim.keymap.set("i", "<C-c>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-c>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-c>", "<Nop>", { noremap = true, silent = true })

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("v", "fd", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("x", "fd", "<Esc>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = "Toggle File Tree" })
vim.keymap.set('n', '<leader>r', '<cmd>NvimTreeRefresh<CR>', { desc = "Refresh File Tree" })

vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
-- vim.keymap.set('n', '<leader>m', ':make<CR>')
vim.keymap.set('n', '<leader>m', ':Make<CR>')

vim.keymap.set('n', '<leader>c', '<Cmd>BufferClose<CR>')
vim.keymap.set({'n','v'}, 'L', '<Cmd>BufferNext<CR>')
vim.keymap.set({'n','v'}, 'H', '<Cmd>BufferPrevious<CR>')
for i = 1, 5 do
  vim.keymap.set('n', '<leader>'..i, string.format('<Cmd>BufferGoto %d<CR>', i))
end

vim.keymap.set('v', '<D-c>', '"+y')
vim.keymap.set('n', '<D-c>', '"+yy')
vim.keymap.set('i', '<D-c>', '<Esc>"+yyi')

