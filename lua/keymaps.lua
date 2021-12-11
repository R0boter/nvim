local keybind = vim.api.nvim_set_keymap

-- Leader key
vim.g.mapleader = ' '
    
-- Explorer
keybind('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- Window movement
keybind('n', '<left>', '<C-w>h', {noremap = true, silent = true})
keybind('n', '<right>', '<C-w>l', {noremap = true, silent = true})
keybind('n', '<up>', '<C-w>k', {noremap = true, silent = true})
keybind('n', '<down>', '<C-w>j', {noremap = true, silent = true})

-- Indenting
keybind('v', '<S-Tab>', '<gv', {noremap = true, silent = true})
keybind('v', '<Tab>', '>gv', {noremap = true, silent = true})

-- Tab switch buffer
keybind('n', '<Tab>', ':bnext<CR>', {noremap = true, silent = true})
keybind('n', '<S-Tab>', ':bprevious<CR>', {noremap = true, silent = true})

-- Move selected line/block of text in visual line mode
keybind('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
keybind('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Tab Complete
-- keybind('i', '<expr><Tab>', 'pumvisible() ? \"<C-n>\" : \"<Tab>\"', {noremap = true, silent = true})

-- ESC and nohlsearch
keybind('n', 'n', 'n:nohl<CR>', {noremap = true, silent = true})

