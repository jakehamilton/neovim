local which_key = require("which-key")
local treesitter_configs = require("nvim-treesitter.configs")

treesitter_configs.setup {
	indent = {
		enable = true,
	},
}

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

vim.o.foldenable = false
vim.o.foldlevel = 99

which_key.register({
	g = {
		name = "Go",
		H = {
			"<cmd>TSHighlightCapturesUnderCursor<cr>", "Show Tree-sitter Captures"
		},
	},
	t = {
		name = "Toggle",
		p = { "<cmd>TSPlaygroundToggle<cr>", "Toggle Tree-sitter Playground" }
	}
}, { mode = "n", noremap = true, silent = true })
