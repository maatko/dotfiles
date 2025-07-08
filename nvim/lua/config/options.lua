-- left column and similar settings
vim.opt.number = true         -- display line numbers
vim.opt.relativenumber = true -- display relative line numbers
vim.opt.numberwidth = 2       -- set width of line number column
vim.opt.signcolumn = "yes"    -- always show sign column
vim.opt.wrap = false          -- display lines as single line
vim.opt.scrolloff = 10        -- number of lines to keep above/below cursor
vim.opt.sidescrolloff = 8     -- number of columns to keep to the left/right of cursor
vim.opt.splitbelow = true     -- make all new windows split below not up

-- tab spacing/behavior
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2   -- number of spaces inserted for each indentation level
vim.opt.tabstop = 2      -- number of spaces inserted for tab character
vim.opt.softtabstop = 2  -- number of spaces inserted for <Tab> key

-- general behaviors
vim.opt.backup = false            -- disable backup file creation
vim.opt.clipboard = "unnamedplus" -- enable system clipboard access
vim.opt.conceallevel = 0          -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"    -- set file encoding to UTF-8
vim.opt.mouse = "a"               -- enable mouse support
vim.opt.timeoutlen = 1000         -- set timeout for mapped sequences
vim.opt.undofile = true           -- enable persistent undo
vim.opt.updatetime = 100          -- set faster completion
vim.opt.writebackup = false       -- prevent editing of files being edited elsewhere
vim.opt.cursorline = true         -- highlight current line

-- searching behaviors
vim.opt.hlsearch = true   -- highlight all matches in search
vim.opt.ignorecase = true -- ignore case in search
vim.opt.smartcase = true  -- match case if explicitly stated
