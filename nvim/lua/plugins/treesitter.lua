require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "python", "lua", "javascript", "html", "css", "rust", "go", "bash", "json", "yaml", "markdown" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,               
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },   
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection    = "gnn",
      node_incremental  = "grn",
      scope_incremental = "grc",
      node_decremental  = "grm",
    },
  },
}
