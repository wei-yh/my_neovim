return {
  -- add  lsp servers to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        lua_ls = {
          mason = false,
        },
        pyright = {
          mason = false
        },
        clangd = {
          mason = false
        },
      },
    },
  },

  {
      'ThePrimeagen/harpoon',
    lazy= true,
    dependencies= { 'nvim-lua/plenary.nvim'},
    keys ={

    {"<leader>he", function()	end },
    {"<leader>ha", function() require('harpoon.mark').add_file() end},
    --	{"<C-e>", function() require('harpoon.ui').toggle_quick_menu() end},
    
    {"<leader>hm", function() require('harpoon.ui').toggle_quick_menu() end},
    },
    config = function ()require("harpoon").setup({

    menu = {
      width = vim.api.nvim_win_get_width(0)-4,
      }
    })
    end
  },


  {
    'akinsho/toggleterm.nvim', 
      version = "*",
      config = true
  },

  {
    'chentoast/marks.nvim',
    config = true
  },
}
