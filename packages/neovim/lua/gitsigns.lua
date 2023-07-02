local which_key = require("which-key")
local gitsigns = require("gitsigns")

gitsigns.setup {
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "-" },
		topdelete = { text = "-" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signcolumn = true,
	numhl = false,
	linehl = false,
	word_diff = false,
	current_line_blame = true,
	attach_to_untracked = true,

	-- Workaround autoformatting on save which makes Gitsigns process twice without delay.
	update_debounce = 10,

	on_attach = function(bufnr)
		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map('n', ']c', function()
			if vim.wo.diff then return ']c' end
			vim.schedule(function() gitsigns.next_hunk() end)
			return '<Ignore>'
		end, { expr = true })

		map('n', '[c', function()
			if vim.wo.diff then return '[c' end
			vim.schedule(function() gitsigns.prev_hunk() end)
			return '<Ignore>'
		end, { expr = true })

		which_key.register({
			h = {
				name = "Git Hunk",
				s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
				r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
				S = { "<cmd>Gitsigns stage_buffer<cr>", "Stage Buffer" },
				u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
				R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
				p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
				b = {
					function()
						gitsigns.blame_line { full = true }
					end,
					"Blame Line"
				},
				d = { "<cmd>Gitsigns diffthis<cr>", "Diff" },
				D = {
					function()
						gitsigns.diffthis("~")
					end,
					"Diff (~)"
				},
			},
			t = {
				name = "Toggle",
				b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle Current Line Blame" },
				d = { "<cmd>Gitsigns toggle_deleted<cr>", "Toggle Deleted" }
			}
		}, { mode = "n", prefix = "<leader>", buffer = bufnr })
	end,
}
