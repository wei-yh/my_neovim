return {
  -- colorscheme
  {
    { "rebelot/kanagawa.nvim" },
  },
  -- Configure LazyVim
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "kanagawa",
    },
  },

  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
