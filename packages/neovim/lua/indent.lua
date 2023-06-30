local indent = require("indent_blankline")

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

vim.g.indent_blankline_use_treesitter = true

vim.g.indent_blankline_buftype_exclude = {
	"terminal",
	"nofile",
}

vim.g.indent_blankline_filetype_exclude = {
	"help",
	"dashboard",
	"NvimTree",
	"Trouble",
}

indent.setup {
	show_end_of_line = true,
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
}
