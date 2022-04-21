local keybind = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
local snippet_dir = ""
if vim.fn.has("win32") == 1 then
  snippet_dir = os.getenv("HOME") .. "/AppData/Local/nvim/snippets"
else
  snippet_dir = os.getenv("HOME") .. "/.config/nvim/snippets"
end
function _G.reloadSnip()
  require("luasnip").cleanup()
  require("luasnip.loaders.from_vscode").load({paths = snippet_dir})
end

-- Leader key
vim.g.mapleader = " "

-- Explorer
keybind("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)
keybind("n", "<Leader>re", ":NvimTreeRefresh<CR>", opts)

-- Window movement
keybind("n", "<left>", "<C-w>h", opts)
keybind("n", "<right>", "<C-w>l", opts)
keybind("n", "<up>", "<C-w>k", opts)
keybind("n", "<down>", "<C-w>j", opts)
keybind("n", "<S-left>", "<C-w>2<", opts)
keybind("n", "<S-right>", "<C-w>2>", opts)
keybind("n", "<S-up>", "<C-w>2+", opts)
keybind("n", "<S-down>", "<C-w>2-", opts)
keybind("n", "j", "gjzz", opts)
keybind("n", "k", "gkzz", opts)
keybind("n", "n", "nzz", opts)
keybind("n", "<S-n>", "<S-n>zz", opts)
keybind("n", "*", "*zz", opts)
keybind("n", "#", "#zz", opts)

-- Buffer
keybind("n", "<Leader>dc", ":bdelete<CR>", opts)
keybind("n", "<Leader>de", ":%bd | e#<CR>", opts)
keybind("n", "<Leader>da", ":bufdo bd<CR>", opts)

-- Indenting
keybind("v", "<S-Tab>", "<gv", opts)
keybind("v", "<Tab>", ">gv", opts)

-- Tab switch buffer
keybind("n", "<Tab>", ":bnext<CR>", opts)
keybind("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Move selected line/block of text in visual line mode
keybind("x", "K", ":move '<-2<CR>gv-gv", opts)
keybind("x", "J", ":move '>+1<CR>gv-gv", opts)

require("kommentary.config").use_extended_mappings()
-- Tab Complete
-- keybind('i', '<expr><Tab>', 'pumvisible() ? \"<C-n>\" : \"<Tab>\"', {noremap = true, silent = true})

-- ESC and nohlsearch
-- keybind('n', 'n', 'n:nohl<CR>', {noremap = true, silent = true})

-- Telescope
keybind("n", "<Leader>fs", ":Telescope live_grep<CR>", opts)
keybind("n", "<Leader>ff", ":Telescope find_files<CR>", opts)
keybind("n", "<Leader>fm", ":Telescope media_files<CR>", opts)
keybind("n", "<Leader>fp", ":Telescope project<CR>", opts)

-- reload luasnip
vim.api.nvim_set_keymap("n", "<Leader>rs", ":lua reloadSnip()<CR>", opts)

-- Lspsaga
--keybind('n', '<A-d>', ':Lspsaga open_floaterm<CR>', opts)
--keybind('t', '<A-d>', '<C-\\><C-n>:Lspsaga close_floaterm<CR>', opts)

-- Translate
keybind("x", "<Leader>tf", ":Translate zh-CN -source=en -parse_after=window -output=floating<CR>", opts)
keybind("x", "<Leader>tfi", ":Translate zh-CN -source=en -output=insert<CR>", opts)
keybind("x", "<Leader>tfr", ":Translate zh-CN -source=en -output=replace<CR>", opts)
keybind("x", "<Leader>te", ":Translate en -source=zh-CN -parse_after=window -output=floating<CR>", opts)
keybind("x", "<Leader>tei", ":Translate en -source=zh-CN -output=insert<CR>", opts)
keybind("x", "<Leader>ter", ":Translate en -source=zh-CN -output=replace<CR>", opts)
