return {
  "saghen/blink.cmp",
  version = "*",



  dependencies = {
    "rafamadriz/friendly-snippets",
    "L3MON4D3/LuaSnip",
  },

  opts = {
    keymap = { preset = "enter" },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      list = {
        selection = {
          auto_insert = true,
          preselect = true,

        },
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
        },
      },

      menu = {
        border = "rounded",
        draw = { gap = 2 },
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
      },
    },

    snippets = {
      preset = "luasnip",
    },
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        -- Transparent body & border
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        local fb = vim.api.nvim_get_hl(0, { name = "FloatBorder", link = false })
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = fb.fg, bg = "none" })

        -- Selection (theme-aware)
        local visual = vim.api.nvim_get_hl(0, { name = "Visual", link = false })
        vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { fg = visual.fg, bg = visual.bg, bold = visual.bold })
        vim.api.nvim_set_hl(0, "BlinkCmpDocCursorLine", { fg = visual.fg, bg = visual.bg, bold = visual.bold })

        -- Text & match: remove any bg
        local abbr = vim.api.nvim_get_hl(0, { name = "CmpItemAbbr", link = false })
        vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = abbr.fg, bg = "none" })

        local match = vim.api.nvim_get_hl(0, { name = "CmpItemAbbrMatch", link = false })
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = match.fg, bg = "none" })
      end,
    })
  },
}
