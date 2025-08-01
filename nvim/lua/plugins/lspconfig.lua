return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "tailwindcss",
        "omnisharp",
        "emmet_ls",
        "pyright",
        "lua_ls",
        "clangd",
        "cssls",
        "vimls",
        "gopls",
        "templ",
        "html",
      }
    },
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        config = function()
          local telescope = require("telescope.builtin")

          -- lsp
          vim.keymap.set({ "n", "v" }, "<leader>g", vim.lsp.buf.code_action, {})
          vim.keymap.set("n", "<leader>d", vim.lsp.buf.hover, {})
          vim.keymap.set("n", "<C-g>", vim.lsp.buf.definition, {})
          vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})

          -- telescope
          vim.keymap.set("n", "<leader>r", telescope.lsp_references, {})
          vim.keymap.set("n", "<leader>i", telescope.lsp_implementations, {})
        end
      },
      {
        "mason-org/mason.nvim",
        opts = {}
      },
    },
  }
}
