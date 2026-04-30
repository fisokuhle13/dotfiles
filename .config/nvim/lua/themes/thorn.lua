return {
  {
    "jpwol/thorn.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      theme = nil,         -- 'light' or 'dark' - defaults to vim.o.background if unset
      background = "cold", -- options are 'warm' and 'cold'

      transparent = true,  -- transparent background
      terminal = true,     -- terminal colors
    },

    config = function(_, opts)
      require("thorn").setup(opts)
      vim.cmd.colorscheme("thorn")

      local function patch(group, opts)
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
        if not ok or not hl then return end

        for k, v in pairs(opts) do
          hl[k] = v
        end

        vim.api.nvim_set_hl(0, group, hl)
      end

      -- diagnostics (undercurl + color)
      patch("DiagnosticUnderlineError", { undercurl = true })
      patch("DiagnosticUnderlineWarn", { undercurl = true })
      patch("DiagnosticUnderlineInfo", { undercurl = true })
      patch("DiagnosticUnderlineHint", { undercurl = true })

      vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#223B49", bg = "none" })

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
  }
}
