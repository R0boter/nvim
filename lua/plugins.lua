local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap =
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

local packer = require("packer")

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

--config
packer.init(
  {
    git = {
      default_url_format = "https://github.com/%s"
    },
    display = {
      open_fn = function()
        return require("packer.util").float({border = "single"})
      end
    }
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
    use "simrat39/rust-tools.nvim"
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

    use {
      "dcampos/nvim-snippy",
      requires = {
        "dcampos/cmp-snippy"
      }
    }

    -- DeBuger
    use "Pocco81/DAPInstall.nvim"
    use "mfussenegger/nvim-dap"
    use "theHamsta/nvim-dap-virtual-text"
    use "rcarriga/nvim-dap-ui"
    use "nvim-telescope/telescope-dap.nvim"

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
    use {"Avimitin/neovim-deus"}

    use "navarasu/onedark.nvim"

    -- Edit
    use "ggandor/lightspeed.nvim"
    use "steelsojka/pears.nvim"
    use "b3nj5m1n/kommentary"
    use "mhartington/formatter.nvim"
    use "mg979/vim-visual-multi"
    use "uga-rosa/translate.nvim"
    use "ethanholz/nvim-lastplace"

    -- Telescope (require ripgrep)
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/plenary.nvim"}}
    }
    use {
      "nvim-telescope/telescope-media-files.nvim",
      requires = {{"nvim-lua/popup.nvim"}}
    }
    use "nvim-telescope/telescope-project.nvim"
    use {"nvim-telescope/telescope-ui-select.nvim"}

    -- Terminal
    -- use "akinsho/toggleterm.nvim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if Packer_bootstrap then
      require("packer").sync()
    end
  end
)
