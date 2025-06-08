require('lsp_signature').setup({
  bind = true,                    
  doc_lines = 0,                 
  floating_window = true,       
  fix_pos = true,             
  hint_enable = true,        
  hint_prefix = " ",       
  handler_opts = {
    border = "rounded" 
  },
  max_height = 12,
  max_width = 80,
  transparency = 10, 
})
