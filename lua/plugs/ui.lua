vim.o.termguicolors = true
vim.o.cursorline = true
-- vim.o.cursorcolumn = true -- 超级卡顿
vim.o.hidden = true

vim.diagnostic.config({virtual_text = false})
vim.api.nvim_command("sign define DiagnosticSignError text=>> texthl=DiagnosticSignError linehl= numhl=")
vim.api.nvim_command("sign define DiagnosticSignWarn text=>> texthl=DiagnosticSignWarn linehl= numhl=")
vim.api.nvim_command("sign define DiagnosticSignInfo text=>> texthl=DiagnosticSignInfo linehl= numhl=")
vim.api.nvim_command("sign define DiagnosticSignHint text=>> texthl=DiagnosticSignHint linehl= numhl=")

-- colorscheme

vim.cmd [[colors deus]]

--vim.g.gruvbox_baby_function_style = "NONE"
--vim.g.gruvbox_baby_keyword_style = "italic"
--vim.cmd [[colorscheme gruvbox-baby]]
--vim.cmd [[highlight NvimTreeNormal guibg=NONE]]
--vim.cmd [[highlight NvimTreeNormalNC guibg=NONE]]

--vim.g.nord_contrast = true
--vim.g.nord_borders = true
--vim.g.nord_disable_background = true
--vim.g.nord_enable_sidebar_background = false
--vim.g.nord_cursorline_transparent = true
--vim.g.nord_italic = false
--require("nord").set()

-- indent blankline
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
require("indent_blankline").setup {
  space_char_blankline = " ",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6"
  },
  filetype_exclude = {"help", "NvimTree", "packer", "toggleterm"}
}

-- colorizer
require "colorizer".setup {
  "*", -- Highlight all files, but customize some others.
  css = {rgb_fn = true}, -- Enable parsing rgb(...) functions in css.
  html = {names = false} -- Disable parsing "names" like Blue or Gray
}

-- lualine
local colors = {
  bg = "none",
  fg = "none",
  --[[ bg = "#202328",
  fg = "#008080", ]]
  yellow = "#ECBE7B",
  cyan = "#bbc2cf",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67"
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand "%:p:h"
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
}

require "lualine".setup {
  options = {
    icons_enabled = true,
    theme = {
      normal = {
        a = {fg = colors.fg, bg = colors.bg},
        b = {fg = colors.fg, bg = colors.bg},
        c = {fg = colors.fg, bg = colors.bg},
        x = {fg = colors.fg, bg = colors.bg},
        y = {fg = colors.fg, bg = colors.bg},
        z = {fg = colors.fg, bg = colors.bg}
      },
      inactive = {
        a = {fg = colors.fg, bg = colors.bg},
        b = {fg = colors.fg, bg = colors.bg},
        c = {fg = colors.fg, bg = colors.bg},
        x = {fg = colors.fg, bg = colors.bg},
        y = {fg = colors.fg, bg = colors.bg},
        z = {fg = colors.fg, bg = colors.bg}
      }
    },
    component_separators = "",
    section_separators = {left = "", right = ""},
    disabled_filetypes = {},
    always_divide_middle = true
  },
  sections = {
    lualine_a = {
      {
        "mode",
        --[[ fmt = function(str)
          return str:sub(1, 1)
        end, ]]
        separator = {left = ""},
        right_padding = 2,
        color = {fg = colors.orange}
      }
    },
    lualine_b = {
      {
        "filetype",
        separator = "",
        colored = true,
        icon_only = true
      },
      {
        "filename",
        file_status = true,
        path = 1,
        shorting_target = 40,
        symbols = {
          modified = " פֿ", -- Text to show when the file is modified.
          readonly = " ", -- Text to show when the file is non-modifiable or readonly.
          unnamed = "" -- Text to show for unnamed buffers.
        },
        color = {fg = colors.red}
      },
      {
        "filesize",
        cond = conditions.buffer_not_empty,
        color = {fg = colors.cyan}
      },
      {
        "location",
        padding = 1,
        color = {fg = colors.blue}
      },
      {
        "progress",
        color = {fg = colors.green}
      }
    },
    lualine_c = {
      {
        function()
          return "%="
        end
      },
      {
        function()
          local msg = "No Active Lsp"
          local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = " LSP:",
        color = {fg = colors.magenta, gui = "bold"}
      },
      {
        "diagnostics",
        sources = {"nvim_diagnostic"},
        colored = true,
        symbols = {error = " ", warn = " ", info = " "},
        sections = {"error", "warn", "info"},
        diagnostics_color = {
          error = {fg = colors.red},
          warn = {fg = colors.yellow},
          info = {fg = colors.cyan}
        }
      }
    },
    lualine_x = {},
    lualine_y = {
      {
        "encoding",
        color = {fg = colors.yellow}
      },
      {
        "fileformat",
        color = {fg = colors.yellow}
      },
      {
        "branch",
        separator = "",
        padding = {left = 1, right = -2},
        color = {fg = colors.violet}
      },
      {
        "diff",
        colored = true,
        diff_color = {
          added = {fg = colors.green},
          modified = {fg = colors.orange},
          removed = {fg = colors.red}
        },
        symbols = {added = " ", modified = " ", removed = " "},
        separator = {right = ""}
      }
    },
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        "filename",
        color = {fg = colors.magenta, gui = "bold"}
      }
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {"nvim-tree", "quickfix", "toggleterm"}
}

-- Lspsaga configure

--require('lspsaga').init_lsp_saga()
--local opts = { noremap=true, silent=true }
-- vim.api.nvim_buf_set_keymap('n', '<A-d>', ':Lspsaga open_floaterm<CR>', opts)
-- vim.api.nvim_buf_set_keymap('t', '<A-d>', '<C-\\><C-n>:Lspsaga close_floaterm<CR>', opts)

-- bufferline

require("bufferline").setup {
  options = {
    --numbers = "buffer_id",
    close_command = "bdelete! %d",
    right_mouse_command = nil,
    left_mouse_command = nil,
    middle_mouse_command = nil,
    indicator_icon = "",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    name_formatter = function(buf)
      if buf.name:match("%.md") then
        return vim.fn.fnamemodify(buf.name, ":t:r")
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 16,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count)
      return " " .. "(" .. count .. ")"
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = function()
          return vim.fn.getcwd()
        end,
        highlight = "Directory",
        text_align = "left"
      }
    },
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    persist_buffer_sort = true,
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = false,
    sort_by = "id"
  },
  highlights = {
    background = {
      guifg = colors.cyan,
      guibg = colors.bg
    },
    buffer_visible = {
      guifg = colors.cyan,
      guibg = colors.bg
    },
    buffer_selected = {
      guifg = colors.yellow,
      guibg = colors.bg,
      gui = "bold,italic"
    },
    modified = {
      guifg = colors.violet,
      guibg = colors.bg
    },
    modified_visible = {
      guifg = colors.violet,
      guibg = colors.bg
    },
    modified_selected = {
      guifg = colors.violet,
      guibg = colors.bg
    },
    separator_selected = {
      guifg = colors.magenta,
      guibg = colors.bg
    },
    separator_visible = {
      guifg = colors.magenta,
      guibg = colors.bg
    },
    separator = {
      guifg = colors.magenta,
      guibg = colors.bg
    },
    info = {
      guifg = colors.cyan,
      guibg = colors.bg
    },
    info_visible = {
      guifg = colors.cyan,
      guibg = colors.bg
    },
    info_selected = {
      guifg = colors.yellow,
      guibg = colors.bg,
      gui = "bold,italic"
    },
    info_diagnostic = {
      guifg = colors.cyan,
      guibg = colors.bg
    },
    info_diagnostic_visible = {
      guifg = colors.cyan,
      guibg = colors.bg
    },
    info_diagnostic_selected = {
      guifg = colors.cyan,
      guibg = colors.bg,
      gui = "bold,italic"
    },
    warning = {
      guifg = colors.orange,
      guibg = colors.bg
    },
    warning_visible = {
      guifg = colors.orange,
      guibg = colors.bg
    },
    warning_selected = {
      guifg = colors.yellow,
      guibg = colors.bg,
      gui = "bold,italic"
    },
    warning_diagnostic = {
      guifg = colors.orange,
      guibg = colors.bg
    },
    warning_diagnostic_visible = {
      guifg = colors.orange,
      guibg = colors.bg
    },
    warning_diagnostic_selected = {
      guifg = colors.orange,
      guibg = colors.bg,
      gui = "bold,italic"
    },
    error = {
      guifg = colors.red,
      guibg = colors.bg
    },
    error_visible = {
      guifg = colors.red,
      guibg = colors.bg
    },
    error_selected = {
      guifg = colors.yellow,
      guibg = colors.bg,
      gui = "bold,italic"
    },
    error_diagnostic = {
      guifg = colors.red,
      guibg = colors.bg
    },
    error_diagnostic_visible = {
      guifg = colors.red,
      guibg = colors.bg
    },
    error_diagnostic_selected = {
      guifg = colors.red,
      guibg = colors.bg,
      gui = "bold,italic"
    }
  }
}
