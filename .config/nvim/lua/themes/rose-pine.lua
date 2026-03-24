return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000, -- ensure it loads first
  config = function()
    require("rose-pine").setup({
      variant = "main", -- main | moon | dawn

      dark_variant = "main",

      disable_background = true,
      disable_float_background = true,

      styles = {
        bold = true,
        italic = true,
        transparency = false,
      },

    })


    vim.cmd("colorscheme rose-pine")

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
}
