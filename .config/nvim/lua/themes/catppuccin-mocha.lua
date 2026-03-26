-- Catppuccin Theme
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,                 -- load before other plugins
    opts = {
      flavour = "mocha",             -- latte, frappe, macchiato, mocha
      background = { light = "latte", dark = "mocha" },
      transparent_background = true, -- fully transparent
      show_end_of_buffer = false,
      term_colors = false,
      dim_inactive = { enabled = false },
      no_italic = false,
      no_bold = false,
      no_underline = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        bufferline = true,
        notify = true,
        mini = { enabled = true },
      },
    },
    config = function(_, opts)
      -- setup plugin
      require("catppuccin").setup(opts)

      -- apply colorscheme
      local ok, _ = pcall(vim.cmd, "colorscheme catppuccin")
      if not ok then
        vim.o.termguicolors = true
        vim.notify("Failed to load colorscheme 'catppuccin'", vim.log.levels.WARN)
      end

      -- === Custom Highlights ===
      local cp = require("catppuccin.palettes").get_palette(opts.flavour)


      local function patch(group, opts)
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
        if not ok or not hl then return end

        for k, v in pairs(opts) do
          hl[k] = v
        end

        vim.api.nvim_set_hl(0, group, hl)
      end

      -- diagnostics (undercurl + color)
      patch("DiagnosticUnderlineError", { undercurl = true, sp = cp.red })
      patch("DiagnosticUnderlineWarn", { undercurl = true, sp = cp.yellow })
      patch("DiagnosticUnderlineInfo", { undercurl = true, sp = cp.blue })
      patch("DiagnosticUnderlineHint", { undercurl = true, sp = cp.teal })

      require("themes.utils.utils").custom_italic()
    end,
  },
}
