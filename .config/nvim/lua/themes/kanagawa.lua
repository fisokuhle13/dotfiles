return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true, -- fully transparent background
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },

      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none", -- removes gutter background (LineNr, SignColumn)
            },
          },
        },
      },
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.o.termguicolors = true
      vim.cmd([[colorscheme kanagawa]])

      -- remove blink.cmp backgrounds
      vim.api.nvim_set_hl(0, "CmpItemAbbr", { bg = "none" })
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "none" })
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { bg = "none" })
      vim.api.nvim_set_hl(0, "CmpItemKind", { bg = "none" })
      vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { bg = "none" })
    end,
  },
}
