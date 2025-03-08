-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>fx", vim.cmd.Ex, { desc = "[P]roject [E]xplorer" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
