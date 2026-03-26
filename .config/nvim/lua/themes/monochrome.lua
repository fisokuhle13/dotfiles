return {
  {
    "slugbyte/lackluster.nvim",
    name = "lackluster",
    lazy = false,
    priority = 1000,
    config = function()
      require("lackluster").setup({
        tweak_color = {},

        tweak_background = {
          normal = "none",
          telescope = "none",
        },


        tweak_ui = {
          disable_undercurl = false,
          enable_end_of_buffer = false,
        },

        disable_plugin = {
          bufferline = true,
        },
      })

      vim.cmd.colorscheme("lackluster")

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
