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

      vim.cmd([[colorscheme dracula]])

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
