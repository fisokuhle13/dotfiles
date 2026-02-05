return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- NOTE: personal daily words of wisdom - you don't know when you might need it
      local dailyMotivation = {
        "“All great men before us - began somewhere”",
        "“Amateurs wait for inspiration. We just get to work — and refine.”",
        "“I am just an extreme example of what a hard working man can archive”"
      }
      local randomMotivationIndex = math.random(1, #dailyMotivation)
      require("dashboard").setup({
        theme = "hyper",
        disable_move = false,
        shortcut_type = "letter",
        shuffle_letter = false,
        letter_list = "abcdefghiklmnopqrstuvwxyz",
        change_to_vcs_root = false,
        config = {
          week_header = { enable = true },
          shortcut = {
            {
              icon = " ",
              icon_hl = "@variable",
              desc = " Find File",
              group = "Label",
              action = "Telescope find_files",
              key = "f",
            },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = "Restore Session",
              group = "Label",
              action = function()
                require("persistence").load()
              end,
              key = "s",
            },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = " File Explorer",
              group = "Label",
              action = "Neotree toggle",
              key = "e",
            },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = " New File",
              group = "Label",
              action = "ene | startinsert",
              key = "n",
            },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = " Quit",
              group = "Label",
              action = "qa",
              key = "q",
            },
          },
          mru = {
            enable = true,
            limit = 8,
            icon = " ",
            label = "Recent Files",
            cwd_only = true,
          },
          packages = { enable = false },
          project = { enable = false },
          footer = {
            "", -- Add empty lines for spacing if needed
            dailyMotivation[randomMotivationIndex],
          },
          footer_pad = true, -- Push footer to the bottom
          hide = {
            statusline = true,
            tabline = true,
            winbar = true,
          },
          -- Autocmd to hide ~ only in dashboard buffer
          vim.api.nvim_create_autocmd("FileType", {
            pattern = "dashboard",
            callback = function()
              vim.opt_local.fillchars:append({ eob = " " })
              vim.b.lualine_disable = true
              vim.cmd("redrawstatus") -- Force lualine to update immediately
            end,
          }),
        },
      })
    end,
  },
}
