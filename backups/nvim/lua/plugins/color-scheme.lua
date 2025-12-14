-- Gruvbox Theme
--

return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- Load early to avoid conflicts
    config = function()
      require("gruvbox").setup({
        contrast = "hard", -- Darker contrast for better readability
        transparent_mode = true, -- Enable transparent background
        -- Optional: Override palette for even darker background (uncomment if needed)
        -- palette_overrides = {
        --   dark0_hard = "#000000", -- Pure black background
        -- },
      })
      vim.o.background = "dark" -- Ensure dark mode

      vim.o.termguicolors = true
      vim.cmd([[colorscheme gruvbox]]) -- Apply colorscheme after setup
    end,
  },

  -- Configure LazyVim to use Gruvbox as the default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
