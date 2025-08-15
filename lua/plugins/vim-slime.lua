return {
	"jpalardy/vim-slime",
	config = function()
		-- Set target to tmux
		vim.g.slime_target = "tmux"
		-- Set tmux pane (using active pane by default)
		vim.g.slime_pane = "#P"

		-- Key mappings for vim-slime

		-- Send current selection or line to tmux (normal mode)
		vim.api.nvim_set_keymap("n", "<leader>s", ":SlimeSend<CR>", { noremap = true, silent = true })
		-- Send selected block of text (visual mode)
		vim.api.nvim_set_keymap("v", "<leader>s", ":SlimeSend<CR>", { noremap = true, silent = true })
	end,
}
