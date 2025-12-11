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

		vim.lsp.enable("lua_ls")

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
