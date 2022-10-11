local which_key = require("which-key")

local signs = { error = " ", warning = " ", hint = " ", info = " " }

local severities = {
	"error",
	"warning"
}

local tab_visible = {
	bg = "#2e3440",
}

local tab_selected = {
	bg = "#3b4252",
}

local separator_visible = {
	fg = tab_visible.bg,
	bg = tab_visible.bg,
}

local separator_selected = {
	fg = tab_visible.bg,
	bg = tab_selected.bg,
}

require("bufferline").setup {
	options = {
		mode = "buffers",
		show_close_icon = false,
		show_buffer_close_icons = false,
		persist_buffer_sort = true,
		diagnostics = "nvim_lsp",
		always_show_bufferline = true,
		separator_style = "slant",
		diagnostics_indicator = function(_, _, diagnostic)
			local strs = {}
			for _, severity in ipairs(severities) do
				if diagnostic[severity] then
					table.insert(strs, signs[severity] .. diagnostic[severity])
				end
			end

			return table.concat(strs, " ")
		end,
		offsets = {
			{ filetype = "NvimTree", text = "NvimTree", highlight = "Directory", text_align = "left" }
		},
	},
	highlights = {
		separator = separator_visible,
		separator_visible = separator_visible,
		separator_selected = separator_selected,
		tab = tab_visible,
		tab_selected = tab_selected,
		buffer = tab_visible,
		buffer_visible = tab_visible,
		buffer_selected = tab_selected,

		background = tab_visible,
	},
}

which_key.register({
	g = {
		name = "Go",
		b = { "<cmd>:BufferLinePick<CR>", "Go to buffer" }
	}
}, { mode = "n", noremap = true, silent = true })
