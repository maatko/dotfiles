local function configure_jdtls()
	-- get the registry from mason
	local registry = require("mason-registry")

	-- location of `jdtls` package
	local jdtls_path = registry.get_package("jdtls"):get_install_path()

	-- configuration
	local config = jdtls_path .. "/config_"
	if vim.fn.has("unix") then
		config = config .. "linux"
	elseif vim.fn.has("mac") then
		config = config .. "mac"
	elseif vim.fn.has("win32") or vim.fn.has("win64") then
		config = config .. "win"
	end

	return vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
		config,
		jdtls_path .. "/lombok.jar",
		jdtls_path .. "/workspace/"
end

local function get_jdtls_config(jdtls)
	-- used for accessing capabilities
	local lsp = require("cmp_nvim_lsp")

	-- get all the things needed for the configuration to work
	local launcher, configuration, lombok, workspace = configure_jdtls()

	-- fet the default extended client capablities of the JDTLS language server
	local extendedClientCapabilities = jdtls.extendedClientCapabilities
	extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

	return {
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
			"-javaagent:" .. lombok,
			"-jar",
			launcher,
			"-configuration",
			configuration,
			"-data",
			workspace .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
		},
		root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "build.gradle", "pom.xml" }),
		settings = {
			java = {
				format = {
					enabled = true,
					-- Use the Google Style guide for code formattingh
					settings = {
						url = vim.fn.stdpath("config") .. "/lang_servers/intellij-java-google-style.xml",
						profile = "GoogleStyle",
					},
				},
				eclipse = {
					downloadSource = true,
				},
				maven = {
					downloadSources = true,
				},
				signatureHelp = {
					enabled = true,
				},
				contentProvider = {
					preferred = "fernflower",
				},
				saveActions = {
					organizeImports = true,
				},
				sources = {
					organizeImports = {
						starThreshold = 9999,
						staticThreshold = 9999,
					},
				},
				configuration = {
					updateBuildConfiguration = "interactive",
				},
				referencesCodeLens = {
					enabled = true,
				},
				inlayHints = {
					parameterNames = {
						enabled = "all",
					},
				},
			},
		},
		capabilities = lsp.default_capabilities(),
		init_options = {
			extendedClientCapabilities = extendedClientCapabilities,
		},
		on_attach = function(_, _)
			-- enable jdtls commands to be used in neovim
			require("jdtls.setup").add_commands()

			-- custom keybinds
			vim.keymap.set("n", "<leader>jrl", ":JdtUpdateConfig<CR>", { desc = "Updates JDTLS project configuration" })
			vim.keymap.set(
				"n",
				"<leader>jbc",
				":JdtBytecode<CR>",
				{ desc = "Shows bytecode of the currently open buffer" }
			)

			-- code lens enables features such as code reference counts, implemenation counts, and more.
			vim.lsp.codelens.refresh()

			-- setup a function that automatically runs every time a java file is saved to refresh the code lens
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = { "*.java" },
				callback = function()
					local _, _ = pcall(vim.lsp.codelens.refresh)
				end,
			})
		end,
	}
end

return { get_jdtls_config = get_jdtls_config }
