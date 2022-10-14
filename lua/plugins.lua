vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use 'wbthonmason/packer.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'neovim/nvim-lspconfig'
    use 
    {
        'glepnir/lspsaga.nvim',
        branch = "main",
    }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'williamboman/mason.nvim'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'
    use 
    {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons', opt = true
        }
    }
    use 'wellle/targets.vim'
    use 'nvim-treesitter/nvim-treesitter'
    use {'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim'}
    use {
        'lewis6991/gitsigns.nvim',
    }
    use {'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('indent_blankline').setup{
                show_end_of_line = true,
            }
        end
    }
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
     use 'stevearc/aerial.nvim'
     use 'numToStr/Comment.nvim'
end)

