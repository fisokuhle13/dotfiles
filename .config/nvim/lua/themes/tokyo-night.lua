return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd.colorscheme("tokyonight-night")
            require("themes.utils.utils").custom_italic()


            vim.api.nvim_set_hl(0, "WinSeparator", {
                fg = "#24283b"

                ,
                bg = "none"
            })
        end,
    },
}
