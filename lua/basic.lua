local fn = vim.fn
local api = vim.api

local utils = require('utils')

-- Inspect something
function _G.inspect(item)
  vim.print(item)
end
------------------------------------------------------------------------
--                          custom variables                          --
------------------------------------------------------------------------
vim.g.is_win = (utils.has("win32") or utils.has("win64")) and true or false
vim.g.is_linux = (utils.has("unix") and (not utils.has("macunix"))) and true or false
vim.g.is_mac  = utils.has("macunix") and true or false

vim.g.logging_level = "info"

------------------------------------------------------------------------
--                         builtin variables                          --
------------------------------------------------------------------------
vim.g.loaded_perl_provider = 0  -- Disable perl provider
vim.g.loaded_ruby_provider = 0  -- Disable ruby provider
vim.g.loaded_node_provider = 0  -- Disable node provider
vim.g.did_install_default_menus = 1  -- do not load menu

if utils.executable('python3') then
  if vim.g.is_win then
    vim.g.python3_host_prog = fn.substitute(fn.exepath("python3"), ".exe$", '', 'g')
  else
    vim.g.python3_host_prog = fn.exepath("python3")
  end
else
  api.nvim_err_writeln("Python3 executable not found! You must install Python3 and set its PATH correctly!")
  return
end

-- Custom mapping <leader> (see `:h mapleader` for more info)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Enable highlighting for lua HERE doc inside vim script
-- vim.g.vimsyn_embed = 'l'

-- Use English as main language
vim.cmd [[language en_US.UTF-8]]

-- system clipboard
vim.opt.clipboard = "unnamedplus"
-- Disable loading certain plugins

-- Whether to load netrw by default, see https://github.com/bling/dotvim/issues/4
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
vim.g.netrw_liststyle = 3
if vim.g.is_win then
  vim.g.netrw_http_cmd = "curl --ssl-no-revoke -Lo"
end

-- Do not load tohtml.vim
vim.g.loaded_2html_plugin = 1

-- Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim (all these plugins are
-- related to checking files inside compressed files)
vim.g.loaded_zipPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1

-- Do not load the tutor plugin
vim.g.loaded_tutor_mode_plugin = 1

-- Do not use builtin matchit.vim and matchparen.vim since we use vim-matchup
-- vim.g.loaded_matchit = 1
-- vim.g.loaded_matchparen = 1

-- Disable sql omni completion, it is broken.
vim.g.loaded_sql_completion = 1

vim.g.encoding = "UTF-8"
vim.g.fileencoding = "UTF-8"

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.wo.number = true
vim.wo.relativenumber = false

vim.wo.cursorline = true

vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

vim.o.incsearch = true

vim.o.showmode = false

-- vim.cmdheight = 2

vim.o.autoread = true
vim.bo.autoread = true

vim.o.hidden = true
vim.o.mouse = "a"
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

vim.o.updatetime = 300
vim.timeoutlen = 100


vim.o.splitbelow = true
vim.o.splitright = true

vim.g.completopt = "menu,menuone,noselect,noinsert"

vim.o.termguicolors = true
vim.opt.termguicolors = true

vim.opt.list = true

