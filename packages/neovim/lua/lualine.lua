local colors = require("nord.named_colors")
local theme = require("lualine.themes.nord")
local navic = require("nvim-navic")

-- Use one single status bar for the whole editor.
vim.o.laststatus = 3

-- Color the mode of the status line.
theme.visual.a.bg = colors.purple
theme.visual.a.fg = colors.white

-- Color the info area of the status line.
theme.normal.b.bg = colors.dark_gray
theme.normal.b.fg = colors.white

-- Color the center area of the status line.
theme.normal.c.bg = colors.black
theme.inactive.c.bg = colors.black

navic.setup {
	icons = {
		File          = " ",
		Module        = " ",
		Namespace     = " ",
		Package       = " ",
		Class         = " ",
		Method        = " ",
		Property      = " ",
		Field         = " ",
		Constructor   = " ",
		Enum          = "練",
		Interface     = "練",
		Function      = " ",
		Variable      = " ",
		Constant      = " ",
		String        = " ",
		Number        = " ",
		Boolean       = "◩ ",
		Array         = " ",
		Object        = " ",
		Key           = " ",
		Null          = "ﳠ ",
		EnumMember    = " ",
		Struct        = " ",
		Event         = " ",
		Operator      = " ",
		TypeParameter = " ",
	},
	highlight = false,
	separator = "  ",
	depth_limit = 0,
	depth_limit_indicator = "..",
	safe_output = true
}

-- This is a workaround for coloring not working on the ends of
-- the status line. Without this, the background of the first and
-- last characters are not written correctly.
local empty = {
	function() return ' ' end,
	padding = 0,
	color = 'Normal',
}

local filename = {
	'filename',
	file_status = true,
	path = 1, -- Show relative path.
	shorting_target = 25, -- Leave 25 characters for other things in the status line.

	symbols = {
		modified = '[+]',
		readonly = '[-]',
		unnamed = '[No Name]',
		newfile = '[New]',
	},
}

require("lualine").setup {
	extensions = { "quickfix", "nvim-tree", "toggleterm", "fzf" },
	options = {
		theme = theme,
		icons_enabled = true,
		component_separators = "",
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			winbar = { "dashboard", "NvimTree" },
		},
	},
	sections = {
		lualine_a = {
			empty,
			{ "mode", separator = { left = "", right = "" }, right_padding = 2 },
		},
		lualine_b = { filename, "branch" },
		lualine_c = { "fileformat", "diagnostics", "lsp_progress" },
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{
				"location",
				separator = { left = "", right = "" },
				left_padding = 2,
				color = { fg = colors.white, bg = colors.off_blue }
			},
			empty,
		},
	},
	inactive_sections = {
		lualine_a = {
			empty,
			{ "mode", separator = { left = "", right = "" }, right_padding = 2 },
		},
		lualine_b = { filename, "branch" },
		lualine_c = { "fileformat", "diagnostics", "lsp_progress" },
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{
				"location",
				separator = { left = "", right = "" },
				left_padding = 2,
				color = { fg = colors.white, bg = colors.off_blue }
			},
			empty,
		},
	},
	tabline = {},
	winbar = {
		lualine_a = {},
		lualine_b = {
			empty,
			{ "diagnostics", separator = { left = "", right = "" }, },
		},
		lualine_c = {
			{ navic.get_location, cond = navic.is_available },
		},
		lualine_x = {},
		lualine_y = {
			{
				'filename',
				file_status = true,
				path = 1, -- Show relative path.
				shorting_target = 25, -- Leave 25 characters for other things in the status line.

				symbols = {
					modified = '[+]',
					readonly = '[-]',
					unnamed = '[No Name]',
					newfile = '[New]',
				},

				separator = { left = "", right = "" },
			},
			{
				"filetype",
				colored = true,
				icon_only = true,
				separator = { left = "", right = "" },
			},
			empty
		},
		lualine_z = {},
	},
	inactive_winbar = {
		lualine_a = {},
		lualine_b = {
			empty,
			-- {
			-- 	function() return ' ' end,
			-- 	padding = 0,
			-- 	color = 'Normal',
			-- 	separator = { left = "", right = "" },
			-- },
			{ "diagnostics", separator = { left = "", right = "" }, },
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
			{
				"filename",
				file_status = true,
				path = 1, -- Show relative path.
				shorting_target = 25, -- Leave 25 characters for other things in the status line.

				symbols = {
					modified = '[+]',
					readonly = '[-]',
					unnamed = '[No Name]',
					newfile = '[New]',
				},

				separator = { left = "", right = "" },
			},
			{
				"filetype",
				colored = true,
				icon_only = true,
				separator = { left = "", right = "" },
			},
			empty
		},
		lualine_z = {},
	},
}
