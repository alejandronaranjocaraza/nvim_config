return{
  {
    "williamboman/mason.nvim",
    config=function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config=function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls","pylsp","ltex","clangd"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config=function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()--capabilities.lua
      local lspconfig = require('lspconfig')

      lspconfig.lua_ls.setup {capabilities=capabilities}--capabilities.lua
      lspconfig.pylsp.setup {capabilities=capabilities}--capabilities.lua
      lspconfig.ltex.setup{capabilities=capabilities}--capabilities.lua

      lspconfig.ltex.setup({
        capabilities = capabilities,
        settings = {
          ltex = {
            language = "es", -- Idioma principal (puedes dejarlo como "auto" también)
            enabled = { "es", "en-US" }, -- Idiomas activos
            dictionary = {
              ["es"] = { "tecnofinanzas", "númeroscuánticos" }, -- Palabras permitidas en español
              ["en-US"] = { "fintech", "quantlib" }, -- Palabras permitidas en inglés
            },
          },
        },
      })

      -- Muestra la documentación flotante del símbolo bajo el cursor (hover)
      vim.keymap.set("n","K",vim.lsp.buf.hover,{})
      -- Va a la definición del símbolo bajo el cursor
      vim.keymap.set("n","gd",vim.lsp.buf.definition,{})
      -- Muestra un menú con acciones disponibles (por ejemplo, refactorizar, importar, etc.)
      vim.keymap.set({"n"},"<leader>ca",vim.lsp.buf.code_action,{})
    end
  },
}
