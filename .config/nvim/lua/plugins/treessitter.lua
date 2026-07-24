return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    priority = 1000,
    config = function()
        local treesitter = require("nvim-treesitter")
        treesitter.setup()
        treesitter.install { 'lua', 'vim', 'vimdoc', 'javascript', 'typescript', 'html', 'svelte', 'cpp', 'c', 'markdown', 'python', 'go', 'rust', 'zig', 'css', "vue", "kotlin" }

        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'lua', 'vim', 'vimdoc', 'javascript', 'typescript', 'html', 'svelte', 'cpp', 'c', 'markdown', 'python', 'go', 'rust', 'zig', 'css', "vue", "kotlin" },
            callback = function()
                vim.treesitter.start()
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end
}
