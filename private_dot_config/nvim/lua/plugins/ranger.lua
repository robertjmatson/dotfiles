return {
	{
		"kelly-lin/ranger.nvim",
		config = function()
			require("ranger-nvim").setup({ replace_netrw = false })
			vim.api.nvim_set_keymap("n", "<leader>pr", "", {
				noremap = false,
				callback = function()
					require("ranger-nvim").open(true)
				end,
			})
		end,
	},
}
