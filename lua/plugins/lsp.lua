return {
	"neovim/nvim-lspconfig",
	dependencies = { 'saghen/blink.cmp' },
	config = function()
		vim.lsp.config["lua_ls"] = {
			settings = {
				Lua = {
					telemetry = { enable = false },
					completion = {
						callSnippet = 'Replace',
					},
				},
			},
		}

		vim.lsp.config["rust_analyzer"] = {
			settings = {
				cargo = {
					allFeatures = true,
				},
				checkOnSave = { command = "clippy" },
				inlayHints = { bindingModeHints = { enable = true } },
				rustfmt = { enable = true },
				root_dir = require("lspconfig.util").root_pattern("app/Cargo.toml", "Cargo.toml", ".git"),
			},
		}

		vim.lsp.config["luau_lsp"] = {
			cmd = { '/usr/local/bin/luau-lsp', 'lsp', '--definitions=nice-clock.d.luau' },
		}

		vim.lsp.config["zls"] = {
			settings = {
				zls = {
					semantic_tokens = "partial",
				},
			},
		}

		vim.lsp.config["basedpyright"] = {}

		vim.lsp.enable("lua_ls")
		vim.lsp.enable("rust_analyzer")
		vim.lsp.enable("zls")
		vim.lsp.enable("luau_lsp")
		vim.lsp.enable("basedpyright")

		-- Diagnostic Config
		-- See :help vim.diagnostic.Opts
		vim.diagnostic.config {
			severity_sort = true,
			float = { border = 'rounded', source = 'if_many' },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = '󰅚 ',
					[vim.diagnostic.severity.WARN] = '󰀪 ',
					[vim.difaagnostic.severity.INFO] = '󰋽 ',
					[vim.diagnostic.severity.HINT] = '󰌶 ',
				},
			} or {},
			virtual_text = {
				source = 'if_many',
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		}

		-- Auto command stuff
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),

			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or 'n'
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
				end

				-- Binds from kickstart
				map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
				map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
				map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
				map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
				map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
				map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
				map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')


				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client:supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
					vim.keymap.set("", "<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
					end, { desc = "Inlay [h]ints" })
				end
			end
		})
	end
}
