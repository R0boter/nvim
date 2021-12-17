vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.bo.expandtab = true
vim.o.guicursor = "n-i-c-ci-cr:ver1,v-ve-o-r-sm:hor1"
vim.o.hlsearch= false
vim.o.scrolloff = 10
vim.api.nvim_command("autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE")

require('plugins')
require('plugs')
require('keymaps')


