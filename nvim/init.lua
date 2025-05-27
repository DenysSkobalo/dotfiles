vim.cmd([[
  filetype plugin indent on
  syntax on
]])

vim.o.termguicolors = true
vim.o.background   = 'dark'

-- Plugins
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({
    'git','clone','--depth','1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    config = function() require('mason').setup() end,
  }
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  }

  use 'onsails/lspkind-nvim'
  use 'nvim-lua/plenary.nvim'
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup{} end,
  }
  use {
    'nvim-tree/nvim-web-devicons',
    config = function() require('nvim-web-devicons').setup{} end,
  }
  use {
    'romgrk/barbar.nvim',
    requires = {'nvim-tree/nvim-web-devicons'},
    config = function()
      require('barbar').setup{
        animation  = true,
        auto_hide  = false,
        clickable  = true,
        exclude_ft = {'alpha'},
        icons      = { filetype = { enabled = true } },
      }
    end
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('ibl').setup{
        indent = { char = '⋅', tab_char = '⋅' },
        scope  = { enabled = true, show_start = false },
        exclude= {
          filetypes = {'help','packer','dashboard','NvimTree','terminal'},
          buftypes  = {'terminal','nofile'},
        },
      }
    end
  }
  use {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup{
        bind = true,            -- автоматичне прив’язування до LSP
        doc_lines = 0,          -- скільки рядків документації показувати
        floating_window = true, -- показувати у floating window
        fix_pos = true,         -- фіксована позиція вікна
        hint_enable = true,     -- показувати сигнатуру в рядку
        hint_prefix = " ",     -- префікс перед hint
        handler_opts = {
          border = "rounded"    -- рамка для вікна
        },
      }
    end
  }
  use {
  'nvim-tree/nvim-tree.lua',
  requires = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('nvim-tree').setup {
      on_attach = function(bufnr)
        local api = require('nvim-tree.api')
        local opts = function(desc) return { desc = 'nvim-tree: ' .. desc, buffer = bufnr } end
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
      end,
    }
  end,
}
    use {
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',     -- джерело з LSP
    'hrsh7th/cmp-buffer',       -- джерело зі слів у буфері
    'hrsh7th/cmp-path',         -- джерело файлових шляхів
    'L3MON4D3/LuaSnip',         -- снаппети
    'saadparwaiz1/cmp_luasnip', -- інтеграція з LuaSnip
  },
}
use {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup {
      mappings = {
        basic    = false,
        extra    = false,
        extended = false,
      },
    }
  end,
    }
end)

vim.o.number      = true
vim.wo.cursorline = true

vim.o.expandtab   = true
vim.o.tabstop     = 4
vim.o.shiftwidth  = 4
vim.o.softtabstop = 4

vim.g.mapleader   = ' '
vim.o.clipboard   = 'unnamedplus'

-- Keymaps
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { silent = true, desc = "Toggle File Explorer" })vim.keymap.set('n', 'gn',    '<Cmd>Buffernext<CR>')
vim.keymap.set('n', '<leader>c',   '<Cmd>BufferClose<CR>')
vim.keymap.set({'n','v'}, 'L', '<Cmd>BufferNext<CR>')
vim.keymap.set({'n','v'}, 'H', '<Cmd>BufferPrevious<CR>')
vim.keymap.set('v', '<D-c>', '"+y')
vim.keymap.set('n', '<D-c>', '"+yy')
vim.keymap.set('i', '<D-c>', '<Esc>"+yyi')
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>m', ':make<CR>')
for i = 1, 5 do
  vim.keymap.set('n', '<leader>'..i, string.format('<Cmd>BufferGoto %d<CR>', i))
end

-- vim.keymap.set('n', '<leader>/', require('Comment.api').toggle.linewise.current, { desc = 'Toggle comment line', silent = true })

vim.cmd('highlight clear')
vim.cmd('syntax reset')

local autosave = vim.loop.new_timer()
autosave:start(2000, 2000, vim.schedule_wrap(function()
  if vim.bo.modifiable and vim.bo.modified and vim.fn.bufname() ~= "" then
    vim.cmd('silent! write')
  end
end))

require('theme.colorschem').setup()

-- ──────────────────────────────────────────────────────────────────────────────
-- LSP & Diagnostic
-- ──────────────────────────────────────────────────────────────────────────────
require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = { 'clangd' },
  handlers = {
    function(server_name) end,
    ['clangd'] = function()
      require('lspconfig').clangd.setup {
        flags = { debounce_text_changes = 150 },
        on_attach = function(client, bufnr)
          require('lsp_signature').on_attach({
            bind = true,
            handler_opts = { border = 'rounded' },
          }, bufnr)
        end,
      }
    end,
  },
}

vim.diagnostic.config {
  virtual_text     = { prefix = '', spacing = 1 },
  signs            = true,
  underline        = true,
  update_in_insert = true,
  severity_sort    = true,
}
vim.wo.signcolumn = 'yes'
vim.api.nvim_set_hl(0,'DiagnosticError', { fg = '#ff0000' })
vim.api.nvim_set_hl(0,'DiagnosticWarn',  { fg = '#ffaa00' })
vim.api.nvim_set_hl(0,'DiagnosticInfo',  { fg = '#00afff' })
vim.api.nvim_set_hl(0,'DiagnosticHint',  { fg = '#00ff00' })

local cmp = require('cmp')
local luasnip = require('luasnip')
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),      
    ['<CR>']      = cmp.mapping.confirm({ select = true }),
    ['<Tab>']     = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
      else fallback() end
    end, {'i','s'}),
    ['<S-Tab>']   = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then luasnip.jump(-1)
      else fallback() end
    end, {'i','s'}),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip'    },
  },{
    { name = 'buffer'     },
    { name = 'path'       },
  }),
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').clangd.setup{
  capabilities = capabilities,
  flags = { debounce_text_changes = 150 },
  on_attach = function(client, bufnr)
    require('lsp_signature').on_attach({ bind = true, handler_opts = { border = 'rounded' } }, bufnr)
  end,
}
