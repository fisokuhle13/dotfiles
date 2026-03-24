return {
  {
    "slugbyte/lackluster.nvim",
    name = "lackluster",
    lazy = false,
    priority = 1000,
    config = function()
      require("lackluster").setup({
        tweak_color = {},

        tweak_background = {
          normal = "none",
          telescope = "none",
        },

        tweak_highlight = {
          -- core semantic hierarchy
          ["comment"] = { italic = true },
          ["@comment"] = { italic = true },
          ["@comment.documentation"] = { italic = true },

          ["@string"] = { italic = true },

          ["@function"] = { italic = true },
          ["@statement"] = { italic = true },
          ["@method"] = { italic = true },

          -- function / method calls
          ["@function.call"] = { italic = true },
          ["@method.call"] = { italic = true },

          ["@type"] = { bold = true },
          ["@keyword"] = {},

          -- conversational signals
          ["@variable.unused"] = { italic = true },
          ["@parameter.unused"] = { italic = true },

          -- diagnostics: whisper only
          ["diagnostichint"] = { italic = true },
          ["diagnosticinfo"] = { italic = true },
          ["diagnosticwarn"] = { undercurl = true },
          ["diagnosticerror"] = { undercurl = true },

          -- meta-commentary
          ["todo"] = { italic = true, undercurl = true },
          ["@comment.todo"] = { italic = true, undercurl = true },
          ["@comment.warning"] = { italic = true, undercurl = true },
          ["@comment.note"] = { italic = true },

          -- lsp / documentation
          ["lspsignatureactiveparameter"] = { italic = true },
          ["@markup.heading"] = { bold = true },
          ["@markup.italic"] = { italic = true },
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
        "PmenuSel"
      }

      for _, group in ipairs(groups) do
        remove_bg(group)
      end
    end,
  },
}
