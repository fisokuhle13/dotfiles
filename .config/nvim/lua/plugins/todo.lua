return {
	"folke/todo-comments.nvim",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		signs = true,
		sign_priority = 8,
		keywords = {
			TODO = { icon = " ", color = "info" },
			DO = { icon = " ", color = "info", alt = { "do" } }, -- Added DO keyword
			FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG" } },
			HACK = { icon = " ", color = "warning" },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } }, -- Added XXX as alias
			PERF = { icon = " ", color = "hint" },
			NOTE = { icon = "󰌶 ", color = "hint", alt = { "INFO" } },
		},
		gui_style = {
			fg = "BOLD", -- bold text for foreground
			bg = "BOLD", -- bold background color
		},
		highlight = {
			multiline = false,
			before = "", -- no extra symbols before
			keyword = "bg", -- highlights the whole keyword with background
			after = "bg", -- also highlight the text after keyword
			pattern = [[.*<(KEYWORDS)\s*:]], -- matches `TODO:`, `DO:`, etc.
		},
		colors = {
			error = { "DiagnosticError" }, -- Use diagnostic highlight groups
			warning = { "DiagnosticWarn" },
			info = { "DiagnosticInfo" },
			hint = { "DiagnosticHint" },
			default = { "Identifier" },
		},
	},
	keys = {
		{
			"]t",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Next todo comment",
		},
		{
			"[t",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "Previous todo comment",
		},
		{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Search todos" },
		{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
	},
}
