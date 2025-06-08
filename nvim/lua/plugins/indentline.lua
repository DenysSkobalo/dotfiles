require("ibl").setup({
  indent = {
    char = "⋅",         
    tab_char = "⋅",  
  },
  scope = {
    enabled = true,
    show_start = false,
  },
  exclude = {
    filetypes = {
      "help", "dashboard", "packer", "NvimTree", "terminal", "alpha"
    },
    buftypes = {
      "terminal", "nofile"
    },
  },
})
