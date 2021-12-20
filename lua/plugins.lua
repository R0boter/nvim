local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

 if fn.empty(fn.glob(install_path)) > 0 then
   Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://hub.fastgit.org/wbthomason/packer.nvim', install_path})
 end

local packer = require('packer')

packer.init({
    git = {
        default_url_format = 'https://hub.fastgit.org/%s'
    }
})

packer.startup(function(use)
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  --
  -- A File Explorer For Neovim Written In Lua
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
    	'kyazdani42/nvim-web-devicons',
    }
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'windwp/nvim-autopairs'
  use 'mattn/emmet-vim'

  -- UI

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'glepnir/lspsaga.nvim'
  use {
    'akinsho/bufferline.nvim',
    requires = {
    	'kyazdani42/nvim-web-devicons',
    }
  }
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
  use 'shaunsingh/nord.nvim'
  use 'ful1e5/onedark.nvim'

  -- Telescope (require ripgrep)
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}},
  }
  use {
	  'nvim-telescope/telescope-media-files.nvim',
	  requires = {{'nvim-lua/popup.nvim'}},
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if Packer_bootstrap then
    require('packer').sync()
  end
end)

