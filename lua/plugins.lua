local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap =
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

local packer = require("packer")

--config
packer.init(
  {
    git = {
      default_url_format = "https://github.com/%s"
    }
    --	display = {
    --		open_fn = function ()
    --			return require('packer.until').float({border = 'single'})
    --		end
    --	}
  }
)

packer.startup(
  function(use)
    -- My plugins here
    -- use 'foo1/bar1.nvim'
    -- use 'foo2/bar2.nvim'
    --
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- File manager and project manager
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons"
      }
    }

    --  use "ahmedkhalf/project.nvim"

    -- LSP
    use {
      "neovim/nvim-lspconfig",
      requires = {
        "williamboman/nvim-lsp-installer"
      }
    }
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline"
      }
    }
    use {
      "L3MON4D3/LuaSnip",
      requires = {
        "saadparwaiz1/cmp_luasnip"
      }
    }

    -- UI
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    --  use 'tami5/lspsaga.nvim'
    use {
      "akinsho/bufferline.nvim",
      requires = {
        "kyazdani42/nvim-web-devicons"
      }
    }
    use {
      "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    use "lukas-reineke/indent-blankline.nvim"
    use "p00f/nvim-ts-rainbow"
    use "norcalli/nvim-colorizer.lua"
    use "shaunsingh/nord.nvim"
    use {"luisiacc/gruvbox-baby", branch = "main"}
    use {"Avimitin/neovim-deus"}

    -- Edit
    use "ggandor/lightspeed.nvim"
    use "steelsojka/pears.nvim"
    use "b3nj5m1n/kommentary"
    use "mhartington/formatter.nvim"
    use "mg979/vim-visual-multi"

    -- Telescope (require ripgrep)
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/plenary.nvim"}}
    }
    use {
      "nvim-telescope/telescope-media-files.nvim",
      requires = {{"nvim-lua/popup.nvim"}}
    }

    -- Terminal
    -- use "akinsho/toggleterm.nvim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if Packer_bootstrap then
      require("packer").sync()
    end
  end
)
