return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("dracula").setup({
        transparent_bg = true,
      })

      vim.o.termguicolors = true
      vim.cmd([[colorscheme dracula]])
    end,
  },
}
