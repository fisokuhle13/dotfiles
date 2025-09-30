return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.nvim", -- Or use 'echasnovski/mini.icons' or 'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require("render-markdown").setup({
        anti_conceal = { enabled = true }, -- Hide virtual text on cursor line
        file_types = { "markdown", "vimwiki" }, -- Add vimwiki if needed
        completions = { lsp = { enabled = true } }, -- Enable LSP-based completions
        tables = { auto_align = true }, -- Auto-align tables
      })
    end,
  },
}
