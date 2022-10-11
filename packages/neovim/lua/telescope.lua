local which_key = require("which-key")
local telescope = require("telescope")

-- Import manix so that Telescope can load it properly.
---@diagnostic disable-next-line: unused-local
local manix = require("telescope-manix")

telescope.setup {
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key"
			},
		},
	},
}

telescope.load_extension("manix")

which_key.register({
	f = {
		name = "File",
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
		g = { "<cmd>Telescope live_grep<cr>", "Grep" },
		b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
		n = { "<cmd>Telescope manix<cr>", "Nix Documentation" },
	},
}, { mode = "n", prefix = "<leader>", silent = true })
