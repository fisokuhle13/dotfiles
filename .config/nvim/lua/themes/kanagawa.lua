return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true, -- fully transparent background
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { italic = true },
      typeStyle = {},
      dimInactive = false,
      terminalColors = true,
      overrides = function(colors)
        return {}
      end,
      theme = "wave",  -- Load "wave" theme
      background = {   -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus"
      },

      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.cmd([[colorscheme kanagawa]])

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
      }

      for _, group in ipairs(groups) do
        remove_bg(group)
      end
      require("themes.utils.utils").custom_italic()
    end

  },
}
