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
  use 'blazkowolf/gruber-darker.nvim'

  use { 'williamboman/mason.nvim', config = function() require('plugins.mason') end }
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'hrsh7th/nvim-cmp', config = function() require('plugins.cmp') end }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use { 'ray-x/lsp_signature.nvim', config = function() require('plugins.signature') end }
  use { 'windwp/nvim-autopairs', config = function() require('plugins.autopairs') end }
  use { 'nvim-tree/nvim-tree.lua', config = function() require('plugins.nvim-tree') end }
  use { 'romgrk/barbar.nvim', config = function() require('plugins.barbar') end }
  use { 'lukas-reineke/indent-blankline.nvim', config = function() require('plugins.indentline') end }
  use { 'numToStr/Comment.nvim', config = function() require('plugins.comment') end }
  use { 'nvim-tree/nvim-web-devicons', config = function() require('plugins.devicons') end }
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim', branch = 'master', requires = { 'nvim-lua/plenary.nvim' }, config = function() require('plugins.telescope') end }
end)
