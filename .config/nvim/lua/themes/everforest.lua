return {
  "sainnhe/everforest",
  priority = 1000,
  config = function()
    vim.g.everforest_background = "hard"
    vim.g.everforest_enable_italic = 1

    vim.cmd("colorscheme everforest")


    require("themes.utils.utils").custom_italic()

    local function remove_bg(group)
      local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
      if not ok or not hl then return end

      hl.bg = nil
      vim.api.nvim_set_hl(0, group, hl)
    end



    local groups = {
      "Normal",
      "NormalFloat",
      "NormalNC",
      "SignColumn",
      "EndOfBuffer",
      "MsgArea",
      "FloatBorder",


      "CmpItemAbbr",
      "CmpItemAbbrMatch",
      "CmpItemAbbrMatchFuzzy",
      "CmpItemKind",
      "CmpItemKindSnippet",
      "Pmenu",
      "PmenuSel",


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
  end,
}
