return {
  {
    "diegoulloao/neofusion.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("neofusion").setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,


      })

      vim.cmd("colorscheme neofusion")

      -- utility: inherit highlight, remove only background
      local function remove_bg(group)
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
        if not ok or not hl then return end

        hl.bg = nil
        vim.api.nvim_set_hl(0, group, hl)
      end




      local groups = {
        "CmpItemAbbr",
        "CmpItemAbbrMatch",
        "CmpItemAbbrMatchFuzzy",
        "CmpItemKind",
        "CmpItemKindSnippet",
        "Pmenu",
        "PmenuSel",

        -- trouble.nvim
        "TroubleNormal",
        "TroubleNormalNC",
        "TroublePreview",
        "TroublePreviewBorder",
        "TroubleCount",
        "TroubleLocation",
        "TroubleFile",
      }

      for _, group in ipairs(groups) do
        remove_bg(group)
      end


      require("themes.utils.utils").custom_italic()
    end,
  },
}
