-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"c", "cc", "cpp", "h", "hh", "py"},
  callback = function ()
    vim.opt.tabstop = 4
    vim.opt.expandtab = true
    vim.opt.softabstop = 4
    vim.opt.shiftwidth = 4
  end
})
