return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.astyle,
        null_ls.builtins.formatting.clang_format,  -- clang-format for C++
        --null_ls.builtins.formatting.prettier,--java script
        --null_ls.builtins.formatting.eslint_d,-- java script
        --null_ls.builtins.completion.spell,
        --require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
