return {
    {
        "binhtddev/dracula.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.o.termguicolors = true

            require("dracula").setup({
                variant = "soft",
                transparent = true,
                italic_comment = true, -- keep theme default behavior
            })

            vim.cmd.colorscheme("dracula")

            -- utility: inherit highlight, remove only background
            local function remove_bg(group)
                local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
                if not ok or not hl then return end

                hl.bg = nil
                vim.api.nvim_set_hl(0, group, hl)
            end


            local groups = {
                "CmpItemAbbr",
                "CmpItemAbbrMatch",
                "CmpItemAbbrMatchFuzzy",
                "CmpItemKind",
                "CmpItemKindSnippet",
                "Pmenu",
                "PmenuSel",

                "NeoTreeNormal",
                "NeoTreeNormalNC",
                "NeoTreeWinSeparator",
                "NeoTreeEndOfBuffer",
                -- Telescope
                "TelescopeBorder",

                "TelescopeNormal",
                "TelescopePrompt",
                "TelescopePromptNormal",
                "TelescopePromptBorder",
                "TelescopePromptTitle",
                "TelescopeResultsNormal",
                "TelescopeResultsBorder",
                "TelescopeResultsTitle",
                "TelescopePreviewNormal",
                "TelescopePreviewBorder",
                "TelescopePreviewTitle",

            }

            for _, group in ipairs(groups) do
                remove_bg(group)
            end

            require("themes.utils.utils").custom_italic()
        end,
    },
}
