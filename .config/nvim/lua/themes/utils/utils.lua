local M = {}

local function no_italic()
  for _, group in ipairs(vim.fn.getcompletion('', 'highlight')) do
    local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
    if ok and hl then
      hl.italic = false
      vim.api.nvim_set_hl(0, group, hl)
    end
  end
end

-- utility: inherit highlight, only add italic
local function italicize(group)
  no_italic()
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
  if not ok or not hl then return end
  hl.italic = true
  vim.api.nvim_set_hl(0, group, hl)
end

-- apply italics (standard + treesitter)
local groups = {
  -- core
  "Comment",
  "String",
  -- "Statement",
  -- "loop",
  -- "Keyword",
  -- "Repeat",

  -- treesitter
  "@comment",
  "@string",
  -- "@keyword",
  -- "@keyword.repeat",
  -- "@keyword.return",
}

function M.custom_italic()
  for _, group in ipairs(groups) do
    italicize(group)
  end
end

return M
