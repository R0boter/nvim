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
keybind('n', '<Leader>fw', ':Telescope grep_string<CR>', opts)
keybind('n', '<Leader>ff', ':Telescope find_files<CR>', opts)
keybind('n', '<Leader>fp', ':Telescope projects<CR>', opts)

-- Terminal
keybind('t','<ESC>', '<C-\\><C-n><CR>', opts)
keybind('n','<Leader>t', ':ToggleTermToggleAll<CR>', opts)
keybind('n','<Leader>1', ':1ToggleTerm<CR>', opts)
keybind('n','<Leader>2', ':2ToggleTerm<CR>', opts)
keybind('n','<Leader>3', ':3ToggleTerm<CR>', opts)
keybind('n','<Leader>4', ':4ToggleTerm<CR>', opts)
keybind('n','<Leader>5', ':5ToggleTerm<CR>', opts)
-- Lspsaga
--keybind('n', '<A-d>', ':Lspsaga open_floaterm<CR>', opts)
--keybind('t', '<A-d>', '<C-\\><C-n>:Lspsaga close_floaterm<CR>', opts)

-- dashboard
