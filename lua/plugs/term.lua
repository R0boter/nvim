-- Terminal
vim.o.hidden = true

--if vim.fn.has('wim32') then
--    vim.o.shell='powershell'
--    vim.o.shellcmdflag='-command'
--    vim.o.shellquote='\"'
--    vim.o.shellxquote=''
--end

require("toggleterm").setup {
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  --open_mapping = [[<c-\>]],
  -- on_open = fun(t: Terminal), -- function to run when the terminal opens
  -- on_close = fun(t: Terminal), -- function to run when the terminal closes
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = false,
  shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = "horizontal",
   -- | 'vertical' | 'window' | 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = "single", -- | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    width = 10,
    height = 20,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal"
    }
  }
}
-- Projects
require("project_nvim").setup {
  -- Manual mode doesn't automatically change your root directory, so you have
  -- the option to manually do so using `:ProjectRoot` command.
  manual_mode = false,
  -- Methods of detecting the root directory. **"lsp"** uses the native neovim
  -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
  -- order matters: if one is not detected, the other is used as fallback. You
  -- can also delete or rearangne the detection methods.
  detection_methods = {"lsp", "pattern"},
  -- All the patterns used to detect root dir, when **"pattern"** is in
  -- detection_methods
  patterns = {".env", ".git", "Makefile", "package.json", "README.md"},
  -- Table of lsp clients to ignore by name
  -- eg: { "efm", ... }
  ignore_lsp = {},
  -- Don't calculate root dir on specific directories
  -- Ex: { "~/.cargo/*", ... }
  exclude_dirs = {},
  -- Show hidden files in telescope
  show_hidden = false,
  -- When set to false, you will get a message when project.nvim changes your
  -- directory.
  silent_chdir = true,
  -- Path where project.nvim will store the project history for use in
  -- telescope
  datapath = vim.fn.stdpath("data")
}
require("telescope").load_extension("projects")
