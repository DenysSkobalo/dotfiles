-- luacheck: globals vim
local autosave = vim.loop.new_timer()
autosave:start(2000, 2000, vim.schedule_wrap(function()
  if vim.bo.modifiable and vim.bo.modified and vim.fn.bufname() ~= "" then
    vim.cmd('silent! write')
  end
end))

vim.diagnostic.config({
  virtual_text = {
    prefix = '●', 
    spacing = 2,
  },
  signs = true,  
  underline = true,
  update_in_insert = true,
  severity_sort = true, 
})

vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#ff0000' })
vim.api.nvim_set_hl(0, 'DiagnosticWarn',  { fg = '#ffaa00' })
vim.api.nvim_set_hl(0, 'DiagnosticInfo',  { fg = '#00afff' })
vim.api.nvim_set_hl(0, 'DiagnosticHint',  { fg = '#00ff00' })

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 2,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✘",
      [vim.diagnostic.severity.WARN]  = "▲",
      [vim.diagnostic.severity.INFO]  = "",
      [vim.diagnostic.severity.HINT]  = "⚑",
    },
  },
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})
