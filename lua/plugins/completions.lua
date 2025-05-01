return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	opts = {
		keymap = {
			preset = "none",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation", "fallback" },
			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
			["<Esc>"] = { "cancel", "fallback" },
			["<CR>"] = { "select_and_accept", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
		},
		appearance = { nerd_font_variant = "mono" },
		fuzzy = { implementation = "prefer_rust_with_warning" },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
}
