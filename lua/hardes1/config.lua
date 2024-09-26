

local o = vim.o
local bo = vim.bo

o.number = true
o.relativenumber = true
vim.opt.shiftwidth = 2  -- Number of spaces to use for each step of (auto)indent
vim.opt.tabstop = 2     -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 2 -- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.g.NERDTreeShowHidden=1

vim.api.nvim_set_option("clipboard", "unnamed")

vim.cmd("colorscheme catppuccin")
