return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true, -- fully transparent background
            typeStyle = {},
            dimInactive = false,
            terminalColors = true,
            overrides = function(colors)
                return {}
            end,
            theme = "wave",
            background = {
                dark = "wave", -- try "dragon" !
                light = "lotus"
            },

            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none",
                        },
                    },
                },
            },
        },
        config = function(_, opts)
            require("kanagawa").setup(opts)
            vim.cmd([[colorscheme kanagawa]])

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
            }

            for _, group in ipairs(groups) do
                remove_bg(group)
            end
            require("themes.utils.utils").custom_italic()
        end

    },
}
