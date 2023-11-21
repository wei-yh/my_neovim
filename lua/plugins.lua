local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- check if firenvim is active
local firenvim_not_active = function()
    return not vim.g.started_by_firenvim
end

local plugin_specs = {
    -- lsp zero engine
    require 'lsp-zero-config',

    "nvim-lua/plenary.nvim",
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-telescope/telescope-symbols.nvim",
        },
        config = function()
            require("config.telescope")
        end
    },

    -- A list of colorscheme plugin you may want to try. Find what suits you.
    { "navarasu/onedark.nvim",       lazy = true },
    { "sainnhe/edge",                lazy = true },
    { "sainnhe/sonokai",             lazy = true },
    { "sainnhe/gruvbox-material",    lazy = true },
    { "shaunsingh/nord.nvim",        lazy = true },
    { "sainnhe/everforest",          lazy = true },
    { "EdenEast/nightfox.nvim",      lazy = true },
    { "rebelot/kanagawa.nvim",       lazy = true },
    { "catppuccin/nvim",             name = "catppuccin", lazy = true },
    { "olimorris/onedarkpro.nvim",   lazy = true },
    { "tanvirtin/monokai.nvim",      lazy = true },
    { "marko-cerovac/material.nvim", lazy = true },
    { 'rose-pine/neovim',            name = 'rose-pine' },

    { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },

    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        cond = firenvim_not_active,
        config = function()
            require("config.statusline")
        end,
    },

    {
        "akinsho/bufferline.nvim",
        event = { "BufEnter" },
        cond = firenvim_not_active,
        config = function()
            require("config.bufferline")
        end,
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require("config.autopairs")
        end
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },

    {
        "kevinhwang91/nvim-bqf",
        ft = "qf",
        config = function()
            require("config.bqf")
        end,
    },
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        config = function()
            require("config.zen-mode")
        end,
    },

    {
        "nvim-pack/nvim-spectre",
        config = function()
            require("config.spectre")
        end,
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        -- -@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("config.nvim-tree")
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = 'ibl',
        config = function()
            require("config.indent-blankline")
        end,
    },
    -- Show git change (change, delete, add) signs in vim sign column
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("config.gitsigns")
        end,
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim",        -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        config = true
    },

    {
        'nvim-treesitter/nvim-treesitter',
        --  download parser frome https://github.com/anasrar/nvim-treesitter-parser-bin
    },
    {
        "nvim-neorg/neorg",
        --    build = ":Neorg sync-parsers",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.dirman"] = { -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                        },
                    },
                },
            }
        end,
    },

}

-- configuration for lazy itself.
local lazy_opts = {
    ui = {
        border = "rounded",
        title = "Plugin Manager",
        title_pos = "center",
    },
    git =
    {
        url_format = "https://mirror.ghproxy.com/https://github.com/%s.git",
    }
}

require("lazy").setup(plugin_specs, lazy_opts)
