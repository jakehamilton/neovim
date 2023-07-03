local telescope = require("telescope")
local which_key = require("which-key")

telescope.load_extension("vim_bookmarks")

which_key.register({
	B = {
		name = "Bookmarks",
		a = { "<cmd>BookmarkAnnotate<CR>", "Annotate" },
		F = { "<cmd>Telescope vim_bookmarks all<CR>", "Find (All)" },
		f = { "<cmd>Telescope vim_bookmarks current_file<CR>", "Find (Current File)" },
		c = { "<cmd>BookmarkClear<CR>", "Clear" },
		C = { "<cmd>BookmarkClearAll<CR>", "Clear All" },
		u = { "<cmd>BookmarkMoveDown<CR>", "Move Down" },
		d = { "<cmd>BookmarkMoveUp<CR>", "Move Up" },
		n = { "<cmd>BookmarkNext<CR>", "Next" },
		p = { "<cmd>BookmarkPrev<CR>", "Previous" },
		t = { "<cmd>BookmarkToggle<CR>", "Toggle" },
	},
}, { mode = "n", prefix = "<leader>", noremap = true, silent = true })
