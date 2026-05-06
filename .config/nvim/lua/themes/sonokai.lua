return {
    {
        'sainnhe/sonokai',
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.sonokai_enable_italic = true
            vim.g.sonokai_transparent_background = 1
            vim.cmd.colorscheme('sonokai')

            vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#4C566A", bg = "none" })
            require("themes.utils.utils").custom_italic()
        end
    },

}
