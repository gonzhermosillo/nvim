-- Set <leader>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Bootstrap lazypath
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins (directory location /nvim/lua/plugins
require("lazy").setup("plugins")

-- Custom Files
require "general.settings"
require "general.keymaps"

-- Plugin Configurations
require "plugconfigs.nvim-cmp"
require "plugconfigs.treesitter"
require "plugconfigs.LSP"
require "plugconfigs.telescope"
require "plugconfigs.harpoon"
