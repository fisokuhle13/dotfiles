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

    require("themes.utils.utils").custom_italic()

    -- Full clean swap: Normal <-> Insert mode in the rose-pine lualine theme
    local function swap_lualine_modes()
      -- Get the lualine theme that rose-pine just loaded via 'auto'
      local ok, theme = pcall(require, "lualine.themes.rose-pine")

      if not ok or not theme then
        -- fallback in case the exact name differs
        ok, theme = pcall(require, "lualine.themes.rose_pine")
      end
      if not ok or not theme then return end

      -- Full swap of the two mode tables (everything: a,b,c,x,y,z + fg/bg/styles)
      local normal_mode = theme.normal
      local insert_mode = theme.insert

      theme.normal = vim.deepcopy(insert_mode)
      theme.insert = vim.deepcopy(normal_mode)

      -- Now tell lualine to use our modified theme
      require("lualine").setup({
        options = {
          theme = theme, -- override the auto theme with our swapped version
          globalstatus = true,
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = { "dashboard" },
            winbar = { "dashboard" },
          },
        },
      })
    end

    -- Run after the colorscheme has loaded the theme
    vim.defer_fn(swap_lualine_modes, 30)
  end,
}
