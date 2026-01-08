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
          menu = "default",
          popup = "default",
        },

        tweak_highlight = {
          -- core semantic hierarchy
          ["comment"] = { italic = true },
          ["@comment"] = { italic = true },
          ["@comment.documentation"] = { italic = true },

          ["@string"] = { italic = true },

          -- function definitions
          ["@function"] = { italic = true },
          ["@method"] = { italic = true },

          -- function / method calls (this was missing)
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
    end,
  },
}
