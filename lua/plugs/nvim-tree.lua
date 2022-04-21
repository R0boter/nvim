vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_root_folder_modifier = ":~"
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_icon_padding = " "
vim.g.nvim_tree_symlink_arrow = " >> "
vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.nvim_tree_create_in_closed_folder = 0
vim.g.nvim_tree_special_files = {
  Makefile = 1,
  MAKEFILE = 1
}
vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 1
}
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
    deleted = "",
    ignored = "◌"
  },
  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = ""
  }
}

require("nvim-tree").setup(
  {
    auto_reload_on_write = true,
    disable_netrw = true,
    hide_root_folder = true,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    sort_bay = "name",
    update_cwd = true,
    view = {
      width = 30,
      height = 30,
      side = "left",
      preserve_window_proportions = false,
      number = false,
      relativenumber = false,
      signcolumn = "yes",
      auto_resize = false,
      mappings = {
        custom_only = false,
        list = {}
      }
    },
    renderer = {
      indent_markers = {
        enable = false,
        icons = {
          corner = "└ ",
          edge = "│ ",
          none = "  "
        }
      }
    },
    hijack_directories = {
      enable = true,
      auto_open = true
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {}
    },
    ignore_ft_on_setup = {},
    system_open = {
      cmd = nil,
      args = {}
    },
    diagnostics = {
      enable = true,
      show_on_dirs = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = ""
      }
    },
    filters = {
      dotfiles = false,
      custom = {},
      exclude = {}
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 500
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = true
      },
      open_file = {
        quit_on_open = true,
        resize_window = false,
        window_picker = {
          enable = true,
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = {
              "notify",
              "packer",
              "qf",
              "diff",
              "fugitive",
              "fugitiveblame"
            },
            buftype = {
              "nofile",
              "terminal",
              "help"
            }
          }
        }
      }
    },
    trash = {
      cmd = "trash",
      require_confirm = true
    },
    log = {
      enable = false,
      truncate = false,
      types = {
        all = false,
        config = false,
        copy_paste = false,
        git = false,
        profile = false
      }
    }
  }
)
