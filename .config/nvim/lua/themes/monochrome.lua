return {
    {
        "slugbyte/lackluster.nvim",
        name = "lackluster",
        lazy = false,
        priority = 1000,

        config = function()
            local lackluster = require("lackluster")
            lackluster.setup({
                tweak_color = {},
                tweak_background = {
                    normal = "none",
                    telescope = "none",
                },
                tweak_ui = {
                    disable_undercurl = false,
                    enable_end_of_buffer = false,
                },
                disable_plugin = {
                    bufferline = true,
                },
            })

            vim.cmd.colorscheme("lackluster")

            local c = lackluster.color

            ----------------------------------------------------------------------
            -- helpers
            ----------------------------------------------------------------------
            local function hi(group, opts)
                vim.api.nvim_set_hl(0, group, opts)
            end

            ----------------------------------------------------------------------
            -- TODO-COMMENTS
            ----------------------------------------------------------------------
            local function setup_todos()
                hi("TodoBgTODO", { fg = c.black, bg = c.gray6, bold = true })
                hi("TodoFgTODO", { fg = c.gray9, bold = true })

                hi("TodoBgNOTE", { fg = c.black, bg = c.gray5, bold = true })
                hi("TodoFgNOTE", { fg = c.gray9 })

                hi("TodoBgWARN", { fg = c.black, bg = c.gray4, bold = true })
                hi("TodoFgWARN", { fg = c.gray9, bold = true })

                hi("TodoBgFIX", { fg = c.gray9, bg = c.gray3, bold = true })
                hi("TodoFgFIX", { fg = c.gray9, bold = true })

                hi("TodoBgHACK", { fg = c.gray9, bg = c.gray4 })
                hi("TodoBgPERF", { fg = c.gray9, bg = c.gray5 })
                hi("TodoBgDO", { fg = c.black, bg = c.gray5, bold = true })
            end

            ----------------------------------------------------------------------
            -- TREESITTER MARKDOWN
            ----------------------------------------------------------------------
            local function setup_treesitter_markdown()
                hi("@markup.heading.1.markdown", { fg = c.gray9, bold = true })
                hi("@markup.heading.2.markdown", { fg = c.gray8, bold = true })
                hi("@markup.heading.3.markdown", { fg = c.gray7, bold = true })
                hi("@markup.heading.4.markdown", { fg = c.gray6, bold = true })
                hi("@markup.heading.5.markdown", { fg = c.gray5, italic = true })
                hi("@markup.heading.6.markdown", { fg = c.gray4, italic = true })

                hi("@comment", { fg = c.gray5, italic = true })
                hi("@comment.todo", { fg = c.gray9, bold = true })
            end

            ----------------------------------------------------------------------
            -- render-markdown.nvim (OVERLAY LAYER)
            ----------------------------------------------------------------------
            local function setup_render_markdown()
                hi("RenderMarkdownH1", { fg = c.gray9, bold = true })
                hi("RenderMarkdownH2", { fg = c.gray8, bold = true })
                hi("RenderMarkdownH3", { fg = c.gray7, bold = true })
                hi("RenderMarkdownH4", { fg = c.gray6, bold = true })
                hi("RenderMarkdownH5", { fg = c.gray5, italic = true })
                hi("RenderMarkdownH6", { fg = c.gray4, italic = true })

                hi("RenderMarkdownCode", { fg = c.gray8, bg = c.gray1 })
                hi("RenderMarkdownBullet", { fg = c.gray6 })
                hi("RenderMarkdownQuote", { fg = c.gray5, italic = true })
            end

            ----------------------------------------------------------------------
            -- folds / UI polish
            ----------------------------------------------------------------------
            local function setup_ui()
                hi("Folded", { fg = c.gray4, bg = c.gray2, italic = true })
                hi("FoldColumn", { fg = c.gray4, bg = c.normal })
                hi("CursorLineFold", { fg = c.gray9, bg = c.gray3 })
            end

            ----------------------------------------------------------------------
            -- Cmp + Trouble cleanup
            ----------------------------------------------------------------------
            local function remove_bg(group)
                local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group })
                if not ok or not hl then return end
                hl.bg = nil
                vim.api.nvim_set_hl(0, group, hl)
            end

            local function cleanup_plugins()
                local groups = {
                    "CmpItemAbbr",
                    "CmpItemKind",
                    "Pmenu",
                    "PmenuSel",
                    "TroubleNormal",
                    "TroublePreview",
                    "TroubleCount",
                }

                for _, g in ipairs(groups) do
                    remove_bg(g)
                end
            end

            ----------------------------------------------------------------------
            -- APPLY FUNCTION
            ----------------------------------------------------------------------
            local function apply_theme()
                setup_todos()
                setup_treesitter_markdown()
                setup_render_markdown()
                setup_ui()
                cleanup_plugins()
            end

            apply_theme()

            vim.api.nvim_create_autocmd("ColorScheme", {
                callback = apply_theme,
            })

            -- NOTE: cool bro

            ----------------------------------------------------------------------
            -- lualine
            ----------------------------------------------------------------------
            local function setup_lualine()
                local custom = {
                    normal = {
                        a = { fg = c.gray1, bg = c.gray5, gui = "bold" },
                        b = { fg = c.gray4, bg = c.gray2 },
                        c = { fg = c.gray9, bg = c.normal },
                    },
                    insert = {
                        a = { fg = c.black, bg = c.gray6, gui = "bold" },
                        b = { fg = c.gray4, bg = c.gray2 },
                        c = { fg = c.gray9, bg = c.normal },
                    },
                }

                require("lualine").setup({
                    options = {
                        theme = custom,
                        globalstatus = true,
                        section_separators = { left = "", right = "" },
                        component_separators = { left = "", right = "" },
                    },
                })
            end

            vim.defer_fn(setup_lualine, 30)

            require("nvim-web-devicons").setup({
                color_icons = false,
            })
            require("themes.utils.utils").custom_italic()
        end,

    },
}
