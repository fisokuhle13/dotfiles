return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    init = function()
      vim.g.mkdp_auto_start = 0 -- Don't start preview automatically
      vim.g.mkdp_auto_close = 1 -- Auto-close when leaving buffer
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_browser = "" -- Default browser
      vim.g.mkdp_theme = "dark" -- Dark theme

      -- Enable diagrams
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = { server = "http://www.plantuml.com/plantuml" },
        maid = { theme = "default" },
        sequence_diagrams = {},
        flowchart_diagrams = {},
        toc = {},
      }
    end,
    ft = { "markdown" },
  },
}
