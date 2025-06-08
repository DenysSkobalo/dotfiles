require('mason').setup({})

require('mason-lspconfig').setup({
  ensure_installed = {
    "clangd",        -- C/C++
    "pyright",       -- Python
    "rust_analyzer", -- Rust
    "gopls",         -- Go
    "lua_ls",        -- Lua
  },
  automatic_enable = true,
  automatic_installation = true,
})

local lspconfig = require('lspconfig')
require('lsp.clangd')
require('lsp.lua_ls')()
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = { 'clangd', 'lua_ls', 'pyright' }
for _, server in ipairs(servers) do
  lspconfig[server].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      require('lsp_signature').on_attach({
        bind = true,
        handler_opts = { border = 'rounded' }
      }, bufnr)
    end,
  }
end
