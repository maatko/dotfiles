return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",
  opts = {
    keymap = {
      preset = "default",
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "cancel", "hide" },
      ["<CR>"] = { "select_and_accept" },
      ["<Up>"] = { "select_prev" },
      ["<Down>"] = { "select_next" },
      ["<Tab>"] = { "snippet_forward" },
      ["<S-Tab>"] = { "snippet_backward" },
    },
    appearance = { nerd_font_variant = "mono" },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
  opts_extend = { "sources.default" },
}
