return {
	"catppuccin/nvim",
	priority = 1000,
	config = function()
		require('catppuccin').setup {
			flavour = "latte"
		}
		vim.cmd.colorscheme 'catppuccin'
	end,
}
