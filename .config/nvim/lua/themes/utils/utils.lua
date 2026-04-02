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
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
  if not ok or not hl then return end
  hl.italic = true
  vim.api.nvim_set_hl(0, group, hl)
end


-- apply italics (standard + treesitter)
local groups = {
  "Comment",
  "String",
  "Keyword",
  "Conditional",
  "Repeat",

  -- Treesitter groups (modern & more precise)
  "@comment",
  "@string",
  "@keyword",
  "@keyword.conditional",
  "@keyword.repeat",
  "@keyword.return",
}

function M.custom_italic()
  no_italic()

  for _, group in ipairs(groups) do
    italicize(group)
  end
end

return M
