require("nvim-tree").setup(
  {
    auto_reload_on_write = false,
    disable_netrw = true,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = true,
    ignore_buffer_on_setup = true,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    update_cwd = true,
    create_in_closed_folder = false,
    respect_buf_cwd = true,
    view = {
      width = 30,
      -- height = 30,
      hide_root_folder = true,
      side = "left",
      preserve_window_proportions = false,
      number = false,
      relativenumber = false,
      signcolumn = "yes",
      mappings = {
        custom_only = false,
        list = {}
      }
    },
    renderer = {
      root_folder_modifier = ":~",
      highlight_opened_files = "all",
      group_empty = true,
    add_trailing = true,
      indent_markers = {
        enable = false,
        icons = {
          corner = "└ ",
          edge = "│ ",
          none = "  "
        }
      },
      highlight_git = true,
      special_files = {
        Makefile = 1,
        MAKEFILE = 1
      },
      icons = {
        show = {
          git = true,
          folder = true,
          file = true,
          folder_arrow = true
        },
        padding = " ",
        symlink_arrow = " >> ",
        glyphs = {
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
      }
    },
    hijack_directories = {
      enable = true,
      auto_open = true
    },
    update_focused_file = {
      enable = true,
      update_cwd = false,
      ignore_list = {}
    },
    ignore_ft_on_setup = {},
    system_open = {
      cmd = nil,
      args = {}
    },
    diagnostics = {
      enable = false,
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
      ignore = true,
      timeout = 500
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = true
      },
      open_file = {
        quit_on_open = false,
        resize_window = true,
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
