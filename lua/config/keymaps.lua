-- assign the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- exit vim's terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

-- undo
vim.keymap.set("n", "<C-z>", ":undo<CR>", {})

-- quick save
vim.keymap.set("n", "<C-s>", ":wa<CR>", {})

-- terminal
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm size=10 name=term<CR>", { desc = "Toggles terminal window" })
