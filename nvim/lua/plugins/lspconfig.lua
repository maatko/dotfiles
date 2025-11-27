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
				"vue_ls",
				"ts_ls",
				"cssls",
				"vimls",
				"gopls",
				"templ",
				"html",
			},
		},
		dependencies = {
			{
				"neovim/nvim-lspconfig",
				config = function()
					local telescope = require("telescope.builtin")

					-- vue
					vim.lsp.config.ts_ls = {
						init_options = {
							plugins = {
								{
									name = "@vue/typescript-plugin",
									location = vim.fn.expand(
										vim.fn.stdpath("data")
											.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
									),
									languages = { "vue" },
									configNamespace = "typescript",
								},
							},
						},
						filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
					}

					-- lsp
					vim.keymap.set({ "n", "v" }, "<leader>g", vim.lsp.buf.code_action, {})
					vim.keymap.set("n", "<leader>d", vim.lsp.buf.hover, {})
					vim.keymap.set("n", "<C-g>", vim.lsp.buf.definition, {})
					vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})

					-- telescope
					vim.keymap.set("n", "<leader>r", telescope.lsp_references, {})
					vim.keymap.set("n", "<leader>i", telescope.lsp_implementations, {})

					-- razor
					vim.filetype.add({
						extension = {
							cshtml = "razor",
							razor = "razor",
						},
						pattern = {
							[".*%.cshtml"] = "razor",
							[".*%.razor"] = "razor",
						},
					})
				end,
			},
			{
				"mason-org/mason.nvim",
				opts = {},
			},
		},
	},
}
