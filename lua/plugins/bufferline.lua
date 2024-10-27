return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({
			options = {
				mode = "buffers",
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "neo-tree",
						separator = true,
						text_align = "left",
					},
				},
			},
		})
	end,
}
