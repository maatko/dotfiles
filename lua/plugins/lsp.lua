return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
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
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- all the LSPs
      lspconfig.lua_ls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.jdtls.setup({})
      lspconfig.gopls.setup({})

      vim.keymap.set('n', "<leader>d", vim.lsp.buf.hover, {})
      vim.keymap.set('n', "<C-g>", vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, "<leader>g", vim.lsp.buf.code_action, {})
    end
  }
}
