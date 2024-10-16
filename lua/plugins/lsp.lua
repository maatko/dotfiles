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
			local registry = require("mason-registry")

			-- paths
			local jdtls_path = registry.get_package("jdtls"):get_install_path()

			-- configuration
			local configuration = jdtls_path .. "/config_"
			if vim.fn.has("unix") then
				configuration = configuration .. "linux"
			elseif vim.fn.has("mac") then
				configuration = configuration .. "mac"
			elseif vim.fn.has("win32") or vim.fn.has("win64") then
				configuration = configuration .. "win"
			end

			-- all the language servers
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.gopls.setup({ capabilities = capabilities })

			lspconfig.jdtls.setup({
				cmd = {
					"java",
					"-Declipse.application=org.eclipse.jdt.ls.core.id1",
					"-Dosgi.bundles.defaultStartLevel=4",
					"-Declipse.product=org.eclipse.jdt.ls.core.product",
					"-Dlog.protocol=true",
					"-Dlog.level=ALL",
					"-Xmx1g",
					"--add-modules=ALL-SYSTEM",
					"--add-opens",
					"java.base/java.util=ALL-UNNAMED",
					"--add-opens",
					"java.base/java.lang=ALL-UNNAMED",
					"-javaagent:" .. jdtls_path .. "/lombok.jar",
					"-jar",
					vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
					"-configuration",
					configuration,
					"-data",
					jdtls_path .. "/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
				},
				root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "build.gradle", "pom.xml" }),
				capabilities = capabilities,
				settings = {
					java = {
						eclipse = {
							downloadSources = true,
						},
						configuration = {
							updateBuildConfiguration = "interactive",
						},
						maven = {
							downloadSources = true,
						},
						implementationsCodeLens = {
							enabled = true,
						},
						referencesCodeLens = {
							enabled = true,
						},
						references = {
							includeDecompiledSources = true,
						},
					},
				},
			})

			vim.keymap.set("n", "<leader>d", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<C-g>", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>g", vim.lsp.buf.code_action, {})
		end,
	},
}
