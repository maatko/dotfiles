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
    "mfussenegger/nvim-jdtls",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.keymap.set("n", "<leader>d", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<C-g>", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>g", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>cr", require("telescope.builtin").lsp_references, {})
      vim.keymap.set("n", "<leader>ci", require("telescope.builtin").lsp_implementations, {})
    end,
  },
}
