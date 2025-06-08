require('barbar').setup({
  animation = false, 
  auto_hide = false,
  tabpages = true, 
  clickable = true,

  icons = {
    buffer_index = false, 
    filetype = {
      enabled = true,
    },
    separator = { left = "▎", right = "" },
    modified = { button = "●" },
    pinned = { button = "車", filename = true },
  },

  exclude_ft = { "alpha" }, 
  exclude_name = {}, 
})
