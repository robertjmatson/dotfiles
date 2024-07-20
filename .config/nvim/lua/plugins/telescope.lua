return {
	'nvim-telescope/telescope.nvim', 
	tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
		--"debugloop/telescope-undo.nvim",
	},
    	config = function()
        	require("telescope").setup({
      			-- the rest of your telescope config goes here
      			extensions = {
        			--undo = {},
        			-- other extensions:
        			-- file_browser = { ... }
      			},
    		})
		--require("telescope").load_extension("undo")
    		--vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
        	-- set keymaps
        	local keymap = vim.keymap
		local builtin = require('telescope.builtin')
		keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "[S]earch Recent Files (. for repeat)" })
		keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })


	end,
}
