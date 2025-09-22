return {
	"mistweaverco/kulala.nvim",
	ft = { "http", "rest" },
	opts = {},
	config = function(_, opts)
		local kulala = require("kulala")
		kulala.setup(opts)

		vim.keymap.set("n", "<leader><CR>", function()
			kulala.run()
		end, { desc = "Send request", buffer = true })
		vim.keymap.set("n", "<leader>a<CR>", function()
			kulala.run_all()
		end, { desc = "Send all requests", buffer = true })
	end,
}
