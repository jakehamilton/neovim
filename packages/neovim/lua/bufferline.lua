local which_key = require("which-key")
local colors = require("nord.named_colors")

local signs = { error = " ", warning = " ", hint = " ", info = " " }

local severities = {
	"error",
	"warning"
}

local fill = {
	bg = colors.black,
}

local tab_visible = {
	bg = fill.bg,
	italic = false,
}

local tab_selected = {
	bg = colors.dark_gray,
	italic = false,
}

local separator_visible = {
	fg = fill.bg,
	bg = fill.bg,
	italic = false,
}

local separator_selected = {
	fg = fill.bg,
	bg = tab_selected.bg,
	italic = false,
}

local duplicate_visible = tab_visible
local duplicate_selected = tab_selected

local numbers_visible = {
	bg = tab_visible.bg,
}
local numbers_selected = {
	bg = tab_selected.bg,
}

local diagnostic_visible = {
	bg = tab_visible.bg,
}
local diagnostic_selected = {
	bg = tab_selected.bg,
}

local modified_visible = {
	bg = tab_visible.bg,
}
local modified_selected = {
	bg = tab_selected.bg,
}

local pick_visible = {
	bg = tab_visible.bg,
}
local pick_selected = {
	bg = tab_selected.bg,
}

local error_visible = {
	bg = tab_visible.bg,
	fg = colors.red,
}
local error_selected = {
	bg = tab_selected.bg,
	fg = colors.red,
}

local warning_visible = {
	bg = tab_visible.bg,
}
local warning_selected = {
	bg = tab_selected.bg,
}

local info_visible = {
	bg = tab_visible.bg,
}
local info_selected = {
	bg = tab_selected.bg,
}

local hint_visible = {
	bg = tab_visible.bg,
}
local hint_selected = {
	bg = tab_selected.bg,
}


local tab_separator = {
	fg = tab_visible.bg,
	bg = tab_visible.bg,
}

local tab_separator_selected = {
	fg = tab_selected.bg,
	bg = tab_visible.fg,
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
		fill = fill,
		background = tab_visible,
		separator = separator_visible,
		separator_visible = separator_visible,
		separator_selected = separator_selected,
		tab = tab_visible,
		tab_selected = tab_selected,
		tab_separator = tab_separator,
		tab_separator_selected = tab_separator_selected,
		buffer = tab_visible,
		buffer_visible = tab_visible,
		buffer_selected = tab_selected,
		numbers = numbers_visible,
		numbers_visible = numbers_visible,
		numbers_selected = numbers_selected,
		duplicate = duplicate_visible,
		duplicate_visible = duplicate_visible,
		duplicate_selected = duplicate_selected,
		diagnostic = diagnostic_visible,
		diagnostic_visible = diagnostic_visible,
		diagnostic_selected = diagnostic_selected,
		modified = modified_visible,
		modified_visible = modified_visible,
		modified_selected = modified_selected,
		pick = pick_visible,
		pick_visible = pick_visible,
		pick_selected = pick_selected,
		error = error_visible,
		error_visible = error_visible,
		error_selected = error_selected,
		error_diagnostic = error_visible,
		error_diagnostic_visible = error_visible,
		error_diagnostic_selected = error_selected,
		warning = warning_visible,
		warning_visible = warning_visible,
		warning_selected = warning_selected,
		warning_diagnostic = warning_visible,
		warning_diagnostic_visible = warning_visible,
		warning_diagnostic_selected = warning_selected,
		info = info_visible,
		info_visible = info_visible,
		info_selected = info_selected,
		info_diagnostic = info_visible,
		info_diagnostic_visible = info_visible,
		info_diagnostic_selected = info_selected,
		hint = hint_visible,
		hint_visible = hint_visible,
		hint_selected = hint_selected,
		hint_diagnostic = hint_visible,
		hint_diagnostic_visible = hint_visible,
		hint_diagnostic_selected = hint_selected,
	},
}

which_key.register({
	g = {
		name = "Go",
		b = { "<cmd>:BufferLinePick<CR>", "Go to buffer" }
	}
}, { mode = "n", noremap = true, silent = true })
