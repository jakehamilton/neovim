-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local lsp = require("lspconfig")
local null_ls = require("null-ls")
local illuminate = require("illuminate")
local navic = require("nvim-navic")

local which_key = require("which-key")

-- @NOTE(jakehamilton): The `neodev` module requires that it is run
-- before `lspconfig` setup.
require("neodev").setup {
	lspconfig = true,
	library = {
		enabled = true,
		plugins = true,
		runtime = true,
		types = true,
	},
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer.
local on_attach = function(client, buffer)
	-- Disable formatting from duplicate providers
	if client.name == "tsserver"
			or client.name == "html"
			or client.name == "cssls"
			or client.name == "jsonls"
	then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end

	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, buffer)
	end

	illuminate.on_attach(client)

	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(buffer, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	which_key.register({
		g = {
			name = "Go",
			d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
			D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to declaration" },
			h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
			i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to implementation" },
			n = { "<cmd>lua require('illuminate').next_reference{wrap=true}<cr>", "Go to next occurrence" },
			p = { "<cmd>lua require('illuminate').next_reference{reverse=true,wrap=true}<cr>", "Go to previous occurrence" },
			r = { "<cmd>lua vim.lsp.buf.references()<cr>", "Go to references" },
			-- t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Go to type definition" },
			["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help" }
		},
		["["] = {
			d = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
		},
		["]"] = {
			d = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous Diagnostic" },
		},
	}, { buffer = buffer, mode = "n", noremap = true, silent = true })

	which_key.register({
		w = {
			name = "Workspace",
			a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add workspace" },
			l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List workspaces" },
			r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove workspace" },
		},
		c = {
			name = "Code",
			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Action" },
			f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		}
	}, { buffer = buffer, mode = "n", prefix = "<leader>", noremap = true, silent = true })

	if client.name == "tsserver" then
		which_key.register({
			c = {
				name = "Code",
				a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Action" },
				f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
				r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
				i = {
					name = "Imports",
					o = { "<cmd>OrganizeImports<cr>", "Organize" },
				},
			}
		}, { buffer = buffer, mode = "n", prefix = "<leader>", noremap = true, silent = true })
	end
end

-- @TODO(jakehamilton): Add support for cssmodules. Requires
-- 	adding cssmodules-language-server.
-- lsp.cssmodules_ls.setup {}

-- @TODO(jakehamilton): Add support for vim. Requires
-- 	adding vim-language-server.
-- lsp.vim.setup {}

-- @TODO(jakehamilton): Add support for yaml. Requires
-- 	adding yaml-language-server.
-- lsp.yamlls.setup {}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Configure servers with common settings.
local servers = {
	'rnix',
	-- @TODO(jakehamilton): Replace this with sqlls when a package exists in NixPkgs.
	-- 'sqls',
	'gopls',
	'rust_analyzer',
}

for _, name in pairs(servers) do
	lsp[name].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

-- TypeScript
lsp.tsserver.setup {
	on_attach = on_attach,
	cmd = { "@typescriptLanguageServer@", "--stdio", "--tsserver-path", "@typescript@" },
	capabilities = capabilities,
	commands = {
		OrganizeImports = {
			function()
				vim.lsp.buf.execute_command {
					title = "",
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
				}
			end,
			description = "Organize Imports",
		},
	},
}

-- ESLint
-- lsp.eslint.setup {
-- 	on_attach = on_attach,
-- 	cmd = { "@eslintLanguageServer@", "--stdio" },
-- 	capabilities = capabilities,
-- 	settings = {
-- 		format = false,
-- 	},
-- }

-- JSON
lsp.jsonls.setup {
	on_attach = on_attach,
	cmd = { "@jsonLanguageServer@", "--stdio" },
	capabilities = capabilities,
}

-- HTML
lsp.html.setup {
	on_attach = on_attach,
	cmd = { "@htmlLanguageServer@", "--stdio" },
	capabilities = capabilities,
}

-- CSS
lsp.cssls.setup {
	on_attach = on_attach,
	cmd = { "@cssLanguageServer@", "--stdio" },
	capabilities = capabilities,
}

-- Docker
lsp.dockerls.setup {
	on_attach = on_attach,
	cmd = { "@dockerLanguageServer@", "--stdio" },
	capabilities = capabilities,
}

-- Prisma
lsp.prismals.setup {
	on_attach = on_attach,
	cmd = { "@prismaLanguageServer@", "--stdio" },
	capabilities = capabilities,
	settings = {
		prisma = {
			prismaFmtBinPath = "@prismaFormat@",
		}
	},
}

-- Tailwind
lsp.tailwindcss.setup {
	on_attach = on_attach,
	cmd = { "@tailwindLanguageServer@", "--stdio" },
	capabilities = capabilities,
}

-- Lua
lsp.lua_ls.setup {
	on_attach = on_attach,
	cmd = { "lua-language-server" },
	capabilities = capabilities,
	settings = {
		Lua = {
			globals = {
				"vim",
			},
			telemetry = {
				enable = false,
			},
			format = {
				enable = true,
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			}
		},
	},
}

-- Astro
vim.g.astro_typescript = "enable"

lsp.astro.setup {
	on_attach = on_attach,
	cmd = { "@astroLanguageServer@", "--stdio" },
	init_options = {
		typescript = {
			serverPath = "@typescript@",
		},
	},
}

-- Prettier
local function is_null_ls_formatting_enabed(bufnr)
	local file_type = vim.api.nvim_buf_get_option(bufnr, "filetype")
	local generators = require("null-ls.generators").get_available(
		file_type,
		require("null-ls.methods").internal.FORMATTING
	)
	return #generators > 0
end

null_ls.setup {
	---@diagnostic disable-next-line: unused-local
	on_attach = function(client, bufnr)
		if client.server_capabilities.documentFormattingProvider then
			if client.name == "null-ls" and is_null_ls_formatting_enabed(bufnr)
					or client.name ~= "null-ls"
			then
				vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
			else
				vim.api.nvim_buf_set_option(bufnr, "formatexpr", "")
			end

			-- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format({async = true})")
		end

		-- if client.server_capabilities.documentRangeFormattingProvider then
		-- 	vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.formatexpr()")
		-- end
	end
}

local prettier = require("prettier")

prettier.setup {
	bin = "prettier",
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
	cli_options = {
		-- Default to *only* config given in a project, unless none exists.
		config_precedence = "prefer-file",
		-- Prettier config if no project specific configuration is found.
		use_tabs = true,
		print_width = 120,
	},
	["null-ls"] = {
		condition = function()
			return true
			-- return prettier.config_exists({
			-- 	check_package_json = false,
			-- })
		end,
		timeout = 5000,
	}
}

-- Publish diagnostics from the language servers.
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

-- Configure diagnostic icons.
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Auto format.
vim.api.nvim_create_autocmd(
	{ "BufWritePre" },
	{
		pattern = { "*" },
		callback = function()
			vim.lsp.buf.format {
				timeout = 500,
			}
		end,
	}
)

-- Disable the preview window for omnifunc use.
vim.cmd [[
	set completeopt=menu
]]
