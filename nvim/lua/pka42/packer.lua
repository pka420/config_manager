
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.5',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use { "norcalli/nvim-colorizer.lua",
        config = function()
            require('colorizer').setup()
        end
    }
    use('folke/tokyonight.nvim');
    use('rebelot/kanagawa.nvim');

    use{ "folke/trouble.nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
    }

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use('lukas-reineke/indent-blankline.nvim')

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('nvim-lua/plenary.nvim')
    use{'thePrimeagen/harpoon', branch='master'}
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use("nvim-treesitter/nvim-treesitter-context");
    use("folke/zen-mode.nvim") 
    use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'rafamadriz/friendly-snippets'},
    }
    }
    use ('laytan/cloak.nvim')

    use({'junegunn/fzf'})

end)
