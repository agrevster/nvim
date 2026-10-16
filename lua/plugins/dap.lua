vim.pack.add({ { src = "https://codeberg.org/mfussenegger/nvim-dap.git" } })
vim.pack.add({ { src = "https://github.com/igorlfs/nvim-dap-view", version = vim.version.range("1.*") } })

local dap = require("dap")

-- LLDB for rust
dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-dap",
	name = "lldb",
}

dap.configurations.rust = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			local cwd = vim.fn.getcwd()
			local debug_cmd_file = cwd .. "/.debug_cmd"
			if vim.fn.filereadable(debug_cmd_file) == 1 then
				-- YAY command injection :D
				return vim.fn.readfile(debug_cmd_file)[1]
			else
				return vim.fn.input("Path to executable: ", cwd .. "/", "file")
			end
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		initCommands = function()
			local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))
			assert(vim.v.shell_error == 0, "failed to get rust sysroot using `rustc --print sysroot`: " .. rustc_sysroot)
			local script_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_lookup.py"
			local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"

			return {
				([[!command script import '%s']]):format(script_file),
				([[command source '%s']]):format(commands_file),
			}
		end,
	},
}

--- UI

--- Keys
local wc = require("which-key")
wc.add({
	{ "<leader>b", desc = "De[b]ug", icon = "" },
	{ "<leader>bn", "<cmd>DapNew<cr>", desc = "Start Debugger" },
	{ "<leader>bp", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
	{ "<leader>bt", "<cmd>DapViewToggle<cr>", desc = "Toggle Debug View " },
	{ "<leader>bo", "<cmd>DapStepOver<cr>", desc = "Step Over" },
	{ "<leader>bi", "<cmd>DapStepInto<cr>", desc = "Step Into" },
	{ "<leader>bc", "<cmd>DapContinue<cr>", desc = "Continue" },
	{
		"<leader>br",
		function()
			dap.restart()
		end,
		desc = "Restart",
	},
	{ "<leader>bq", "<cmd>DapTerminate<cr>", desc = "Stop debugger" },
})
