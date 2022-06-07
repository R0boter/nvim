vim.o.number = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.bo.expandtab = true
vim.o.guicursor = "n-i-c-ci-cr:ver1,v-ve-o-r-sm:hor1"
vim.o.hlsearch = false
vim.o.clipboard = "unnamedplus"
vim.o.autoread = true
vim.o.fdm = "indent"
vim.o.foldlevelstart = 99
-- vim.api.nvim_command("autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE")
vim.o.backup = true
vim.o.swapfile = true
vim.o.undofile = true
vim.o.dir = vim.fn.stdpath("data") .. "/swp_temp/"
vim.o.undodir = vim.fn.stdpath("data") .. "/undo_temp/"
vim.o.backupdir = vim.fn.stdpath("data") .. "/backup_temp/"

require("plugins")
require("plugs")
require("keymaps")

vim.w.scl = "no"

vim.api.nvim_command("autocmd InsertLeave * :silent !fcitx5-remote -c")
vim.api.nvim_command("autocmd BufCreate * :silent !fcitx5-remote -c")
vim.api.nvim_command("autocmd BufEnter * :silent !fcitx5-remote -c")
vim.api.nvim_command("autocmd BufLeave * :silent !fcitx5-remote -c")
