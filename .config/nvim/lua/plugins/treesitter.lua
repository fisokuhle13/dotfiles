return {
	-- Treesitter (ensure parsers installed)
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "html", "javascript", "typescript", "tsx", "css", "json", "lua", "svelte" },
				highlight = { enable = true },
			})
		end,
	},

	-- autotag (depends on treesitter)
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			-- guarded require so we get a useful error instead of crashing
			local ok, autotag = pcall(require, "nvim-ts-autotag")
			if not ok then
				vim.notify("nvim-ts-autotag failed to load: " .. tostring(autotag), vim.log.levels.ERROR)
				return
			end
			autotag.setup({})
		end,
	},

	-- autopairs (optional, if you want general autopairs too)
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({ check_ts = true })
		end,
	},
}
