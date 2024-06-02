-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set('n', '<leader><BS>', ':Explore<CR>')

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

-- Enable scrolling with Ctrl + Arrow Up/Down
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-y>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-e>', { noremap = true })

-- Allows me to move the highlighted text and autoindents
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- When paging up or down -- keep cursor in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- When searching -- keep cursor in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Allows pasting without loosing what is in the register
vim.keymap.set("x", "<leader>p", "\"_dp")

-- Shortcut for copying into the clipboard register
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Shortcut to avoid deleting text into the register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Opens up a new session in tmux and runs fzf to work on a diff project
-- tmux shortcut:	<C-b>L	-- Go back to preivous session
-- tmux shortcut:	<C-b>w  -- List all tmux windows
-- tmux shortcut:	<C-b>s	-- List all tmux sessions
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<Cr>")

-- Opens up a small command that allows you to replace all the instances
-- of the word you are in 
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Commands used for refactoring
vim.api.nvim_set_keymap("v", "<leader>rf", "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>rv", "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>", {noremap = true, silent = true})

-- Re-highlight previous text that was highlighted
vim.api.nvim_set_keymap('n', '<leader>r', '`[v`]', {noremap = true, silent = true})
