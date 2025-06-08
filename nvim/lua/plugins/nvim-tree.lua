require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
    side = "left",
    preserve_window_proportions = true,
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
  filters = {
    dotfiles = false, 
    custom = { "^.git$" },
  },
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
    },
  },
  git = {
    enable = true,
    ignore = false,
  },
})

