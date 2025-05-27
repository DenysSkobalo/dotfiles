require('mason').setup({})

require('mason-lspconfig').setup({
  ensure_installed = {
    "clangd",        -- C/C++
    "pyright",       -- Python
    "rust_analyzer", -- Rust
    "gopls",         -- Go
  },
})
