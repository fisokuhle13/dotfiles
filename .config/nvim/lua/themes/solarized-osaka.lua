-- Solarized Osaka

return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      dim_inactive = false,
    },
    config = function(_, opts)
      require("solarized-osaka").setup(opts)

      vim.o.termguicolors = true
      vim.cmd([[colorscheme solarized-osaka]])


      -- utility: inherit highlight, remove only background
      local function remove_bg(group)
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
        if not ok or not hl then return end

        hl.bg = nil
        vim.api.nvim_set_hl(0, group, hl)
      end


      local groups = {
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "NeoTreeWinSeparator",
        "NeoTreeEndOfBuffer",

        -- Telescope
        "TelescopeBorder",
        "TelescopeNormal",
        "TelescopePrompt",
        "TelescopePromptNormal",
        "TelescopePromptBorder",
        "TelescopePromptTitle",
        "TelescopeResultsNormal",
        "TelescopeResultsBorder",
        "TelescopeResultsTitle",
        "TelescopePreviewNormal",
        "TelescopePreviewBorder",
        "TelescopePreviewTitle",
      }

      for _, group in ipairs(groups) do
        remove_bg(group)
      end


      require("themes.utils.utils").custom_italic()
    end,
  },
}
