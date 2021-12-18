local keybind = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Leader key
vim.g.mapleader = ' '

-- Explorer
keybind('n', '<Leader>e', ':NvimTreeToggle<CR>', opts)

-- Window movement
keybind('n', '<left>', '<C-w>h', opts)
keybind('n', '<right>', '<C-w>l', opts)
keybind('n', '<up>', '<C-w>k', opts)
keybind('n', '<down>', '<C-w>j', opts)

-- Indenting
keybind('v', '<S-Tab>', '<gv', opts)
keybind('v', '<Tab>', '>gv', opts)

-- Tab switch buffer
keybind('n', '<Tab>', ':bnext<CR>', opts)
keybind('n', '<S-Tab>', ':bprevious<CR>', opts)

-- Move selected line/block of text in visual line mode
keybind('x', 'K', ':move \'<-2<CR>gv-gv', opts)
keybind('x', 'J', ':move \'>+1<CR>gv-gv', opts)

-- Tab Complete
-- keybind('i', '<expr><Tab>', 'pumvisible() ? \"<C-n>\" : \"<Tab>\"', {noremap = true, silent = true})

-- ESC and nohlsearch
-- keybind('n', 'n', 'n:nohl<CR>', {noremap = true, silent = true})

-- Telescope
keybind('n', '<Leader>s', ':Telescope current_buffer_fuzzy_find<CR>', opts)

