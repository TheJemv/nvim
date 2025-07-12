return {
   {
      "williamboman/mason.nvim",
      version = ">=2.0.0", -- ensure Mason v2+
      lazy = false,
      config = function()
         require("mason").setup()
      end,
   },
   {
      "williamboman/mason-lspconfig.nvim",
      config = function()
         require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "ts_ls", "emmet_ls" },
         })
      end,
   },
   {
      "neovim/nvim-lspconfig",
      config = function()
         local capabilities = require("cmp_nvim_lsp").default_capabilities()

         local lspconfig = require("lspconfig")
         lspconfig.ts_ls.setup({
            capabilities = capabilities,
         })

         lspconfig.lua_ls.setup({
            capabilities = capabilities,
         })

         lspconfig.html.setup({
            capabilities = capabilities,
         })

         lspconfig.emmet_ls.setup({
            filetypes = { "html", "css", "javascriptreact", "typescriptreact", "vue", "svelte" },
         })

         -- Keymaps
         vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
         vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
         vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
      end,
   },
}
