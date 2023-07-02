local home = os.getenv("HOME")
local dashboard = require("dashboard")
local dbsession = require("dbsession")

local fortune_handle = io.popen("fortune -s");
local fortune_output = nil

if fortune_handle ~= nil then
	fortune_output = fortune_handle:read("*a")
	fortune_handle:close()
else
	fortune_output = "fortune_handle was nil"
end

local footer = {
	"",
	""
}

if fortune_output ~= nil then
	for line in string.gmatch(fortune_output, "(.-)\n") do
		table.insert(footer, line)
	end
else
	table.insert(footer, "Go even further beyond ✨")
end

dashboard.setup {
	theme = "hyper",
	disable_move = true,
	change_to_vcs_root = true,
	hide = {
		statusline = true,
		tabline = true,
		winbar = true,
	},
	config = {
		header = {
			"",
			"",
			"┏━┓╻  ╻ ╻┏━┓╻ ╻╻  ╺┳╸┏━┓┏━┓",
			"┣━┛┃  ┃ ┃┗━┓┃ ┃┃   ┃ ┣┳┛┣━┫",
			"╹  ┗━╸┗━┛┗━┛┗━┛┗━╸ ╹ ╹┗╸╹ ╹",
			"",
		},
		footer = footer,
		week_header = {
			enable = false,
		},
		packages = {
			-- I manage packages with Nix :)
			enable = false,
		},
		project = {
			enable = true,
			icon = "󰉋 ",
			label = "Projects",
			limit = 8,
			action = "e ",
		},
		mru = {
			label = "Recent Files",
			limit = 10,
			action = "e ",
		},
		shortcut = {
			{
				icon = " ",
				desc = "Open File",
				key = "f",
				group = "Label",
				action = "Telescope find_files",
			},
			{
				icon = " ",
				desc = "Open Recent",
				key = "r",
				group = "Label",
				action = "Telescope oldfiles",
			},
			{
				icon = " ",
				desc = "Open Config",
				key = "c",
				group = "DiagnosticHint",
				action = "e " .. home .. "/work/config",
			},
		},
	},
}

dbsession.setup {
	dir = home .. "/.config/dashboard-nvim",
	auto_save_on_exit = true,
}
