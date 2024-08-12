return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			integrations = {
				cmp = true,
				gitsigns = true,
				neotree = true,
				treesitter = true,
				mason = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		})

		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
