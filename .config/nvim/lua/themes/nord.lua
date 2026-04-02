return {
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.nord_disable_background = true
      vim.g.nord_borders = true

      vim.o.termguicolors = true
      vim.cmd([[colorscheme nord]])


      vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#4C566A", bg = "none" })

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
        "CmpItemKindDefault",
        "CmpItemMenu",
      }

      for _, group in ipairs(groups) do
        remove_bg(group)
      end

      require("themes.utils.utils").custom_italic()
    end,
  },
}
