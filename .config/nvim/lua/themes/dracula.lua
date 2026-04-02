return {
  {
    "binhtddev/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.termguicolors = true

      require("dracula").setup({
        variant = "soft",
        transparent = true,
        italic_comment = true, -- keep theme default behavior
      })

      vim.cmd.colorscheme("dracula")

      require("themes.utils.utils").custom_italic()
    end,
  },
}
