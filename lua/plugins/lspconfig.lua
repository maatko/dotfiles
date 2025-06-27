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
          "pyright",
          "clangd",
          "jdtls",
          "gopls",
          "templ",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      local telescope = require("telescope.builtin")
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({ capabilities = capabilities })
      lspconfig.pyright.setup({ capabilities = capabilities })
      lspconfig.gopls.setup({ capabilities = capabilities })
      lspconfig.templ.setup({ capabilities = capabilities })

      vim.keymap.set({ "n", "v" }, "<leader>g", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>d", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<C-g>", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>r", telescope.lsp_references, {})
      vim.keymap.set("n", "<leader>i", telescope.lsp_implementations, {})
    end,
  },
}
