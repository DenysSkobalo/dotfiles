-- luacheck: globals vim
-- vim.api.nvim_create_user_command("Make", function(opts)
--   vim.cmd("cclose")
--
--   vim.cmd("make " .. opts.args)
--
--   vim.cmd("copen")
-- end, {
--   nargs = "*",
--   complete = "file",
--   desc = "Run make and open quickfix",
-- })
--
vim.api.nvim_create_user_command("Make", function(opts)
  local cmd = opts.args ~= "" and opts.args or "make"

  -- виконуємо команду shell і захоплюємо результат
  local output = vim.fn.systemlist(cmd)

  -- вставляємо результат у quickfix list
  vim.fn.setqflist({}, ' ', {
    title = 'Build Output: ' .. cmd,
    lines = output,
    efm = '%f:%l:%c: %m',
  })

  -- відкриваємо quickfix лише якщо є помилки
  if #output > 0 then
    vim.cmd("copen")
  end
end, {
  nargs = "*",
  complete = "shellcmd",
  desc = "Run shell build command and push to quickfix",
})
