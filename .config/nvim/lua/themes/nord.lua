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

      -- Fix cmp icon bg
      vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
      vim.api.nvim_set_hl(0, "PmenuSel", { bg = "none", bold = true })
      vim.api.nvim_set_hl(0, "CmpItemAbbr", { bg = "none" })
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "none", bold = true })
      vim.api.nvim_set_hl(0, "FloatBorder", { link = "Type" })

      vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#4C566A", bg = "none" })
    end,
  },
}
