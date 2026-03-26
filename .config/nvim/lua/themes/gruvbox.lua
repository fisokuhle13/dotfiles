-- Gruvbox Theme

return {

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- Load early to avoid conflicts
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        transparent_mode = true,
      })

      vim.o.termguicolors = true
      vim.cmd([[colorscheme gruvbox]])

      require("themes.utils.utils").custom_italic()
    end,
  },
}
