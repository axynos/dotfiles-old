lua << EOF

require('telescope').setup{
  defaults = {
    prompt_prefix = ' ',
    selection_caret = ' ',
    entry_prefix = '  ',
    mappings = {
      n = {
        ['<Esc>'] = require'telescope.actions'.close,
        ['q'] = require'telescope.actions'.close
      },
      i = {
        ['<Esc><Esc>'] = require'telescope.actions'.close
      },
    },
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
  }
}

EOF
