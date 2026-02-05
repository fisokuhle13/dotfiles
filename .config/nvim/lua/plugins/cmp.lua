return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets", -- optional but recommended for snippets
      "L3MON4D3/LuaSnip",
    },

    version = "*", -- or "*" for latest
    opts = {
      keymap = { preset = 'enter' },



      appearance = {
        nerd_font_variant = "mono",
      },

      snippets = {
        preset = "luasnip",
      },
    },
  }
}
