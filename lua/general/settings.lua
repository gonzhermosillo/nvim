-- [[ Settings ]]
-- `:help vim.o'

-- Set MapLeader to spacebar
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set Numbers on the left
vim.wo.number = true
vim.wo.relativenumber = true

-- Set signcolumn on
vim.wo.signcolumn = 'yes'

-- -- Some more visuals
vim.o.colorcolumn = "80"

-- Highlighting settings
vim.o.hlsearch = false
vim.o.incsearch = true

-- Turn off Mouse
vim.o.mouse = ""

-- Turn on the pretty colors
vim.opt.termguicolors = true

vim.opt.completeopt = 'menuone,noselect'

vim.wo.wrap = false
-- vim.cmd [[autocmd FileType text setlocal wrap linebreak columns=80]]

vim.o.undofile = true
vim.o.breakindent = true

vim.o.ignorecase = true
vim.o.smartcase = true

-- Indenting rules, golden tab space is 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Keep cursor block even after entering insert mode
vim.opt.guicursor = ""

-- Scroll off
vim.opt.scrolloff = 8

-- White characters
vim.opt.list = false
vim.opt.listchars = {
    lead = "·",
    trail = "·",
    eol = "↲",
    space = "␣"

}

-- Set Background to None for when you want some transparency
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  highlight Whitespace ctermbg=none guifg=white
]]

vim.cmd("highlight NormalNC guibg=NONE ctermbg=NONE")

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
