" Change cursor in various modes. This setting is for iTerm2 on macOS only.
" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
" 0: Block
" 1: Vertical bar
" 2: Underline
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]1337;CursorShape=1\x7" " Insert mode
  let &t_EI = "\<Esc>]1337;CursorShape=2\x7" " Normal mode
endif
