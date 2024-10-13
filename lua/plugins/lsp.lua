return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "clangd",
          "jdtls",
          "gopls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- all the language servers
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({ capabilities = capabilities })
      lspconfig.jdtls.setup({ capabilities = capabilities })
      lspconfig.gopls.setup({ capabilities = capabilities })

      vim.keymap.set("n", "<leader>d", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<C-g>", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>g", vim.lsp.buf.code_action, {})
    end,
  },
}
