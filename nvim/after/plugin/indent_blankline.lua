-- local indent_colors = {}

-- for i = 1, 7 do
--     table.insert(indent_colors, 'SnazzyIndent' .. i)
-- end

-- vim.g.indent_blankline_char_highlight_list = indent_colors

require('indent_blankline').setup {
  char = '│',
  buftype_exclude = { 'terminal' },
}
