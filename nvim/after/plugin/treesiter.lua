require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "python", "lua", "javascript", "html", "css", "rust", "go", "java", "bash" },
  highlight = {
    enable = true,               
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },   
}
