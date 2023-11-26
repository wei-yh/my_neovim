-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local api = vim.api
local uv = vim.loop

-- Insert mode
-- Go to the beginning and end of current line in insert mode quickly
keymap.set("i", "<C-A>", "<HOME>")
keymap.set("i", "<C-E>", "<END>")
keymap.set("i", "<C-N>", "<DOWN>")
keymap.set("i", "<C-P>", "<UP>")
keymap.set("i", "<C-F>", "<RIGHT>")
keymap.set("i", "<C-B>", "<LEFT>")


-- command line
keymap.set("c", "<C-F>", "<RIGHT>")
keymap.set("c", "<C-B>", "<LEFT>")
--
