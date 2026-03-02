return {
  { "nvim-telescope/telescope.nvim" },

  {
    "nvim-telescope/telescope-media-files.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      -- Load the extension
      require("telescope").load_extension("media_files")

      -- Optional: tweak settings
      require("telescope").setup({
        extensions = {
          media_files = {
            -- Filetypes to recognize + preview
            filetypes = { "png", "jpg", "jpeg", "gif", "webp", "svg", "pdf", "mp4" },
            find_cmd = "rg", -- or "fd"
            backend = "kitty",
          },
        },
      })
    end,
  },
}
