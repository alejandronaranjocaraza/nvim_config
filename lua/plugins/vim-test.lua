return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux"
  },
  config = function()
    -- Set the test runner for Python to 'pytest'
    vim.g["test#python#runner"] = "pytest"

    -- Key mappings for test commands
    vim.keymap.set("n", "<leader>t", ":TestNearest<CR>")   -- Run the nearest test
    vim.keymap.set("n", "<leader>T", ":TestFile<CR>")      -- Run the whole test file
    vim.keymap.set("n", "<leader>a", ":TestSuite<CR>")     -- Run the entire test suite
    vim.keymap.set("n", "<leader>l", ":TestLast<CR>")      -- Run the last test
    vim.keymap.set("n", "<leader>q", ":TestVisit<CR>")     -- Visit the test file

    -- Set the strategy for running tests. You can change 'vimux' to 'neovim', 'term', or 'basic'.
    vim.g["test#strategy"] = "basic"  -- Use 'vimux' if you want tmux integration

    -- Ensure that tmux activates the Conda environment when a new pane is opened
    vim.g["test#vimux#default_window_name"] = "test"

    -- Update tmux options to activate Conda environment in interactive shell
    vim.g["test#vimux#tmux_options"] = {
      ["send-keys"] = "conda activate vim_env; exec bash"
}
  end
}
