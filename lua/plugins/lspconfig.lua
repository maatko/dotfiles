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
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({})

			vim.keymap.set("n", "<leader>d", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<C-g>", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>g", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>r", require("telescope.builtin").lsp_references, {})
			vim.keymap.set("n", "<leader>i", require("telescope.builtin").lsp_implementations, {})
		end,
	},
}
