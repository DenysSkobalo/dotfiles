-- luacheck: globals vim
vim.cmd.colorscheme('gruber-darker')
vim.api.nvim_set_hl(0, 'Normal',     { fg = '#f4f4ff', bg = '#181818', bold = false })
vim.api.nvim_set_hl(0, 'Comment',    { fg = '#999999', italic = true, bold = false})
vim.api.nvim_set_hl(0, 'String',     { fg = '#86f442', bold = false})
vim.api.nvim_set_hl(0, 'Keyword',    { fg = '#ffdd33', bold = false })
vim.api.nvim_set_hl(0, 'Function',   { fg = '#96cbfe', bold = false })
vim.api.nvim_set_hl(0, 'Identifier', { fg = '#ffb964', bold = false })
vim.api.nvim_set_hl(0, 'Type',       { fg = '#c6c5fe', bold = false})
vim.api.nvim_set_hl(0, 'Constant',   { fg = '#ff73fd', bold = false})
vim.api.nvim_set_hl(0, 'Error',      { fg = '#ff0000', bold = false})

-- local M = {}
--
-- function M.setup()
--   vim.cmd('highlight clear')
--   vim.cmd('syntax reset')
--   vim.o.termguicolors = true
--   vim.o.background   = 'dark'
--
--   local c = {
--     bg         = '#1e1e1e',  -- фон
--     fg         = '#d4d4d4',  -- основний текст
--     comment    = '#CE9178',  -- помаранчевий для // TODO
--     keyword    = '#cccc3b',  -- pub/unsafe/if/while
--     preproc    = '#ABB2BF',  -- директиви
--     string     = '#98C379',  -- рядки
--     func       = '#ABB2BF',  -- імена функцій
--     ident      = '#ABB2BF',  -- змінні та типи
--     number     = '#ABB2BF',  -- числові літерали
--     operator   = '#ffffff',  -- оператори
--     delim      = '#ffffff',  -- дужки, коми
--     cursorbg   = 'NONE',     -- без фону під курсором
--     linenr     = '#5c6370',  -- номери рядків
--     cursorlnr  = '#ffff2d',  -- активний номер рядка
--   }
--
--   -- UI
--   vim.api.nvim_set_hl(0, 'Normal',       { bg = c.bg,  fg = c.fg })
--   vim.api.nvim_set_hl(0, 'NormalFloat',  { bg = c.bg })
--   vim.wo.cursorline = true
--   vim.api.nvim_set_hl(0, 'CursorLine',   { bg = c.cursorbg })
--   vim.api.nvim_set_hl(0, 'LineNr',       { fg = c.linenr })
--   vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = c.cursorlnr })
--
--   -- Синтаксичні групи Vim
--   vim.api.nvim_set_hl(0, 'Comment',      { fg = c.comment,    italic = true })
--   vim.api.nvim_set_hl(0, 'Keyword',      { fg = c.keyword         })
--   vim.api.nvim_set_hl(0, 'PreProc',      { fg = c.preproc         })
--   vim.api.nvim_set_hl(0, 'String',       { fg = c.string          })
--   vim.api.nvim_set_hl(0, 'Function',     { fg = c.func            })
--   vim.api.nvim_set_hl(0, 'Identifier',   { fg = c.ident           })
--   vim.api.nvim_set_hl(0, 'Number',       { fg = c.number          })
--   vim.api.nvim_set_hl(0, 'Operator',     { fg = c.operator        })
--   vim.api.nvim_set_hl(0, 'Delimiter',    { fg = c.delim           })
--   vim.api.nvim_set_hl(0, 'Special',      { fg = c.operator        })
--   vim.api.nvim_set_hl(0, 'Character',    { fg = c.string }) 
--   vim.api.nvim_set_hl(0, '@character',   { link = 'String' })
--
--   -- Підсвічування типів і споріднених ключових слів
--   vim.api.nvim_set_hl(0, 'Type',         { fg = c.ident           })
--   vim.api.nvim_set_hl(0, 'Typedef',      { fg = c.ident           })
--   vim.api.nvim_set_hl(0, 'StorageClass', { fg = c.ident           })
--   vim.api.nvim_set_hl(0, 'Structure',    { fg = c.ident           })
--
--   -- Treesitter-зв’язки
--   vim.api.nvim_set_hl(0, '@comment',               { link = 'Comment' })
--   vim.api.nvim_set_hl(0, '@keyword',               { link = 'Keyword' })
--   vim.api.nvim_set_hl(0, '@keyword.function',      { link = 'Keyword' })
--   vim.api.nvim_set_hl(0, '@preproc',               { link = 'PreProc' })
--   vim.api.nvim_set_hl(0, '@string',                { link = 'String' })
--   vim.api.nvim_set_hl(0, '@function',              { link = 'Function' })
--   vim.api.nvim_set_hl(0, '@method',                { link = 'Function' })
--   vim.api.nvim_set_hl(0, '@type.builtin',          { link = 'Type' })
--   vim.api.nvim_set_hl(0, '@type.definition',       { link = 'Typedef' })
--   vim.api.nvim_set_hl(0, '@storageclass',          { link = 'StorageClass' })
--   vim.api.nvim_set_hl(0, '@keyword.qualifier',     { link = 'StorageClass' })
--   vim.api.nvim_set_hl(0, '@type',                  { link = 'Structure' })
--   vim.api.nvim_set_hl(0, '@variable',              { link = 'Identifier' })
--   vim.api.nvim_set_hl(0, '@parameter',             { link = 'Identifier' })
--   vim.api.nvim_set_hl(0, '@number',                { link = 'Number' })
--   vim.api.nvim_set_hl(0, '@operator',              { link = 'Operator' })
--   vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })
-- end
--
-- return M
