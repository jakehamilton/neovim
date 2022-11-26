local which_key = require("which-key")

local function enable_wrap()
	vim.o.wrap = true
	vim.o.linebreak = true
end

local function disable_wrap()
	vim.o.wrap = false
	vim.o.linebreak = false
end

local function toggle_wrap()
	if vim.o.wrap then
		disable_wrap()
	else
		enable_wrap()
	end
end

which_key.register({
	t = {
		name = "Toggle",
		w = {
			toggle_wrap,
			"Line Wrap"
		},
	},
}, { mode = "n", prefix = "<leader>", silent = true, noremap = true })
