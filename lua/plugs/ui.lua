vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.cursorcolumn = true

-- colorscheme
vim.g.nord_contrast = true -- Make sidebars and popup menus like nvim-tree and telescope have a different background
vim.g.nord_borders = true -- Enable the border between verticaly split windows visable
vim.g.nord_disable_background = true -- Disable the setting of background color so that NeoVim can use your terminal background
vim.g.nord_enable_sidebar_background = false -- Re-enables the backgrond of the sidebar if you disabled the background of everything
vim.g.nord_cursorline_transparent = true
vim.g.nord_italic = false -- enables/disables italics
require('nord').set()

--require('onedark').setup()

-- lualine
local colors = {
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand '%:t') ~= 1
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand '%:p:h'
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = '|',
    section_separators = { left = ' ', right = ' ' },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      {'mode',
      padding = 1,
      }
    },
    lualine_b = {
	  {
		'branch',
        separator = '',
        padding = {left = 1, right = -2},
	  },
      {
        'diff',
        colored = true,
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.orange },
          removed = { fg = colors.red },
        },
        symbols = { added =' ', modified = ' ', removed = ' '},
      },
      {
        'filetype',
        separator = '',
        padding = {left = 1, right = -1},
        colored = true,
        icon_only = true,
      },
      {
		'filename',
        separator = {right = ''},
	  }
    },
    lualine_c = {
      {function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
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
      icon = ' LSP:',
      color = { fg = colors.magenta, gui = 'bold' },
      },
    },
    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ' },
        diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
        },
      },

    },
    lualine_y = {
      {
        'progress',
        separator = { left = ""},
        padding = {right = -1}
      },
      {
        'filesize',
        cond = conditions.buffer_not_empty,
      },
      'encoding', 'fileformat'},
    lualine_z = {
      { 'location', padding = 1}
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {
      {
        'buffers',
        separator = {left = '|'},
        mode = 2,
        show_modified_status = true,
        filetype_names = {
        TelescopePrompt = 'Telescope',
        NvimTree = 'FileExplorer',
        dashboard = 'Dashboard',
        packer = 'Packer',
        fzf = 'FZF',
        alpha = 'Alpha'
        },
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {'nvim-tree', 'quickfix'}
}

-- bufferline
--require('bufferline').setup {
--  options = {
--    --numbers = "buffer_id",
--    close_command = "bdelete! %d",
--    right_mouse_command = nil,
--    left_mouse_command = nil,
--    middle_mouse_command = nil,
--    indicator_icon = '▎',
--    buffer_close_icon = '',
--    modified_icon = '●',
--    close_icon = '',
--    left_trunc_marker = '',
--    right_trunc_marker = '',
--    name_formatter = function(buf)
--      if buf.name:match('%.md') then
--        return vim.fn.fnamemodify(buf.name, ':t:r')
--      end
--    end,
--    max_name_length = 18,
--    max_prefix_length = 15,
--    tab_size = 16,
--    diagnostics = "nvim_lsp",
--    diagnostics_update_in_insert = false,
--    diagnostics_indicator = function(count, level, diagnostics_dict, context)
--      return "("..count..")"
--    end,
--    --custom_filter = function(buf_number)
--    --  if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
--    --    return true
--    --  end
--    --  if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
--    --    return true
--    --  end
--    --  if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
--    --    return true
--    --  end
--    --end,
--    offsets = {{filetype = "NvimTree"}},
--    show_buffer_icons = true,
--    show_buffer_close_icons = false,
--    show_close_icon = false,
--    show_tab_indicators = true,
--    persist_buffer_sort = true,
--    separator_style = "thick",
--    enforce_regular_tabs = true,
--    always_show_bufferline = true,
--    sort_by = 'id',
--  },
--}

