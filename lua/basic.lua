vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.bo.expandtab = true
vim.o.guicursor = "n-i-c-ci-cr:ver1,v-ve-o-r-sm:hor1"
vim.o.hlsearch= false
vim.o.scrolloff = 15
vim.api.nvim_command("autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE")
vim.o.backup = true
vim.o.swapfile = true
vim.o.undofile = true
vim.o.dir = vim.fn.stdpath("data") .. "/swp_temp/"
vim.o.undodir = vim.fn.stdpath("data") .. "/undo_temp/"
vim.o.backupdir = vim.fn.stdpath("data") .. "/backup_temp/"


require('plugins')
require('plugs')
require('keymaps')


