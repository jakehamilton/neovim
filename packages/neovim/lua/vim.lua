vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.timeoutlen = 250
-- vim.opt.ttimeoutlen = 0

vim.opt.autoindent = true
vim.opt.cursorline = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = true
vim.opt.linebreak = true

-- Stop the sign column from flashing in/out with gitsigns.
vim.opt.signcolumn = "yes"

-- We're professionals here.
vim.opt.mouse = ""

-- Enable spell checking.
vim.api.nvim_create_autocmd(
	{ "BufRead", "BufNewFile" },
	{
		pattern = { "*.txt", "*.md", "*.tex" },
		command = "setlocal spell",
	}
)
