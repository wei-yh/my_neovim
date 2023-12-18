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
          mason = false,
        },
        clangd = {
          mason = false,
        },
      },
    },
  },

  {
    "ThePrimeagen/harpoon",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {

      { "<leader>he", function() end },
      {
        "<leader>ha",
        function()
          require("harpoon.mark").add_file()
        end,
      },
      --	{"<C-e>", function() require('harpoon.ui').toggle_quick_menu() end},

      {
        "<leader>hm",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
      },
    },
    config = function()
      require("harpoon").setup({

        menu = {
          width = vim.api.nvim_win_get_width(0) - 4,
        },
      })
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
  },

  {
    "chentoast/marks.nvim",
    config = true,
  },

  {
    "ojroques/nvim-osc52",
    config = true,
  },
  {
    "roobert/search-replace.nvim",
    config = function()
      require("search-replace").setup({
        -- optionally override defaults
        default_replace_single_buffer_options = "gcI",
        default_replace_multi_buffer_options = "egcI",
      })
    end,
  },

  {
    "mangelozzi/nvim-rgflow.lua",
    config = function()
      require("rgflow").setup({
        -- Set the default rip grep flags and options for when running a search via
        -- RgFlow. Once changed via the UI, the previous search flags are used for
        -- each subsequent search (until Neovim restarts).
        cmd_flags = "--smart-case --fixed-strings --ignore --max-columns 200",

        -- Mappings to trigger RgFlow functions
        default_trigger_mappings = true,
        -- These mappings are only active when the RgFlow UI (panel) is open
        default_ui_mappings = true,
        -- QuickFix window only mapping
        default_quickfix_mappings = true,
      })
    end,
  },

  {
    "kevinhwang91/nvim-bqf",
    config = true,
  },

  {
    "gbprod/yanky.nvim",
    dependencies = {
      { "kkharji/sqlite.lua" },
    },
    opts = {
      -- ring = { storage = "sqlite" },
    },
    keys = {
      {
        "<leader>yp",
        function()
          require("telescope").extensions.yank_history.yank_history({})
        end,
        desc = "Open Yank History",
      },
      { "<leader>yy", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
      { "<leader>yp", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
      { "<leader>yP", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
      { "<leader>ygp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
      { "<leader>ygP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
      { "<leader>y<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Select previous entry through yank history" },
      { "<leader>y<c-n>", "<Plug>(YankyNextEntry)", desc = "Select next entry through yank history" },
      { "<leader>y]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "<leader>y[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { "<leader>y]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "<leader>y[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { "<leader>y>p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
      { "<leader>y<p", "<Plug>(YankyPutIndkentAfterShiftLeft)", desc = "Put and indent left" },
      { "<leader>y>P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
      { "<leader>y<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
      { "<leader>y=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
      { "<leader>y=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
    },
  },

  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = true,
  },

  {
    "cljoly/telescope-repo.nvim",
    config = function()
      require("telescope").load_extension("repo")
    end,
  },

  {
    "chipsenkbeil/distant.nvim",
    branch = "v0.3",
    config = function()
      require("distant"):setup()
    end,
  },

  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      lang = "c",
      -- configuration goes here
    },
  },
}
