return {
    "lewis6991/hover.nvim",
    opts = {
        preview_opts = {
            border = "rounded",
        },
    },
    config = function(_, opts)
        require("hover").setup(opts)


        vim.keymap.set("n", "K", require("hover").open)
        vim.keymap.set("n", "gK", require("hover").enter)
    end,
}
