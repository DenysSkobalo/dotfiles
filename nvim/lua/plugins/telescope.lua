-- luacheck: globals vim
-- luacheck: globals require
local telescope = require('telescope')
local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    prompt_prefix = "> ",
    selection_caret = "➤ ",
    layout_config = {
      horizontal = { preview_width = 0.55 },
      vertical = { mirror = false },
    },
    sorting_strategy = "ascending",
    winblend = 5,
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      hidden = true,
    },
    live_grep = {
      theme = "dropdown",
    },
  },
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep,  { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers,    { desc = 'List Buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags,  { desc = 'Help Tags' })
vim.keymap.set('n', '<leader>fr', builtin.resume,     { desc = 'Resume Last Search' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics,{ desc = 'LSP Diagnostics' })

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["jk"] = require("telescope.actions").close,
        ["<Esc>"] = require("telescope.actions").close,
      },
      n = {
        ["q"] = require("telescope.actions").close,
      },
    },
  },
}
