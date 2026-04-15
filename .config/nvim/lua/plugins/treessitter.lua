return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter")
    treesitter.setup()
    treesitter.install { 'lua', 'vim', 'vimdoc', 'javascript', 'typescript', 'html', 'svelte', 'cpp', 'c', 'markdown', 'python', 'go', 'rust' }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'lua', 'vim', 'vimdoc', 'javascript', 'typescript', 'html', 'svelte', 'cpp', 'c', 'markdown', 'python', 'go', 'rust' },
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end
}
