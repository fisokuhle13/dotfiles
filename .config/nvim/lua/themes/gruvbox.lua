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

      -- utility: inherit highlight, only add italic
      local function italicize(group)
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
        if not ok or not hl then return end
        hl.italic = true
        vim.api.nvim_set_hl(0, group, hl)
      end

      -- apply italics (standard + treesitter)
      local groups = {
        -- core
        "Comment",
        "String",
        "Statement",
        "Keyword",
        "Repeat",

        -- treesitter
        "@comment",
        "@string",
        "@keyword",
        "@keyword.repeat",
        "@keyword.return",
      }

      for _, group in ipairs(groups) do
        italicize(group)
      end
    end,
  },
}
