vim.g.mapleader = " "

local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>r", "<CMD>Neotree reveal<CR>")

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>df", "<cmd>Telescope find_files hidden=true<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers initial_mode=normal<cr>")
map("n", "<leader>fs", "<cmd>Telescope git_status<cr>")
map("n", "<leader>fc", "<cmd>Telescope git commits<cr>")
map("n", "<M-b>", "<cmd>Telescope buffers initial_mode=normal<CR>")
map("n", "<leader>bf", "<cmd>Telescope current_buffer_fuzzy_find<CR>")

-- Flash
map("n", "<leader>j", "<cmd>lua require('flash').jump()<cr>")

-- TODO Comments
map("n", "<leader>td", "<cmd>TodoQuickFix<cr>")

-- Bufferline
map("n", "<A-,>", "<cmd>BufferLineMovePrev<CR>")
map("n", "<A-.>", "<cmd>BufferLineMoveNext<CR>")

-- Lazygit
map("n", "<leader>lg", "<cmd>LazyGit<cr>")

-- New Windows
map("n", "<leader>o", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- Buffer navigation with Caps H / L
vim.keymap.set("n", "L", ":bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "H", ":bprevious<CR>", { desc = "Previous Buffer" })

vim.keymap.set("n", "<leader>bd", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Close Buffer (Keep Split)" })

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- clear search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- Move current line down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
-- Move current line up
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- Move selected block down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
-- Move selected block up
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
