return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets", -- optional but recommended for snippets
      "L3MON4D3/LuaSnip",
    },
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        nerd_font_variant = "mono",
      },

      windows = {
        autocomplete = {
          border = "single", -- or "rounded", "double", "shadow"
        },
        documentation = {
          border = "single",
        },
        signature = {
          border = "single",
        },
      },

      snippets = {
        preset = "luasnip",
      },
    },
  }
}
