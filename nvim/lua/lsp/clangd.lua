local lspconfig = require('lspconfig')

lspconfig.clangd.setup({
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = function(client, bufnr)
    require('lsp_signature').on_attach({
      bind = true,
      handler_opts = { border = 'rounded' },
    }, bufnr)
  end,
})
