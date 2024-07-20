return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
				save_on_ui_close = true,
			},
		})

		--set keymaps
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "[H]arpoon [A]dd" })
		vim.keymap.set("n", "<leader>he", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "[H]arpoon List" })
		vim.keymap.set("n", "<leader>hh", function()
			harpoon:list():select(1)
		end, { desc = "[H]arpoon Select 1" })
		vim.keymap.set("n", "<leader>hj", function()
			harpoon:list():select(2)
		end, { desc = "[H]arpoon Select 2" })
		vim.keymap.set("n", "<leader>hk", function()
			harpoon:list():select(3)
		end, { desc = "[H]arpoon Select 3" })
		vim.keymap.set("n", "<leader>hl", function()
			harpoon:list():select(4)
		end, { desc = "[H]arpoon Select 4" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():prev()
		end, { desc = "[H]arpoon Previous" })
		vim.keymap.set("n", "<leader>hm", function()
			harpoon:list():next()
		end, { desc = "[H]arpoon Next" })
	end,
}
