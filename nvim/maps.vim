let mapleader = "\<Space>"

" Make indenting more intuitive in normal and visual mode.
nnoremap <silent> <Tab> >>
nnoremap <silent> <S-Tab> <<
vnoremap <silent> <Tab> >>
vnoremap <silent> <S-Tab> <<
inoremap <silent> <S-Tab> <BS>

" m now becomes "move" - yoink and delete
nnoremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D

" Map scrolling down/up to a more comfortable location
" nnoremap <silent><nowait> <c-j> <c-d>
" nnoremap <silent><nowait> <c-k> <c-u>

" Open and close tabs with leader t/T
nnoremap <silent><nowait> <leader>t :tabe<CR>
nnoremap <silent><nowait> <leader>T :tabc<CR>

" Enable moving of tabs with leader r/y
nnoremap <silent><nowait> <leader>r :tabmove -<CR>
nnoremap <silent><nowait> <leader>y :tabmove +<CR>

" Quick access to specific tabs
nnoremap <silent><nowait> <leader>1 1gt
nnoremap <silent><nowait> <leader>2 2gt
nnoremap <silent><nowait> <leader>3 3gt
nnoremap <silent><nowait> <leader>4 4gt
nnoremap <silent><nowait> <leader>5 5gt
nnoremap <silent><nowait> <leader>6 6gt
nnoremap <silent><nowait> <leader>7 7gt
nnoremap <silent><nowait> <leader>8 8gt
nnoremap <silent><nowait> <leader>9 9gt
nnoremap <silent><nowait> <leader>0 10gt

" Leader WinCmd
nnoremap <silent><nowait> <leader>w <C-w>
nnoremap <silent><nowait> <leader>q <C-w>q
nnoremap <silent><nowait> <leader>Q :qa!<CR>

" Telescope
nnoremap <silent><leader>ff <cmd>Telescope find_files<cr>
nnoremap <silent><leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent><leader>fb <cmd>Telescope buffers<cr>

" Trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap <leader>xr <cmd>TroubleToggle lsp_references<cr>

" Workspace
nnoremap <leader>S :ToggleWorkspace<CR>

" Clear search highlight
nnoremap <silent> <Esc> :noh<CR><Esc>

" Open whichkey menu using double leader
nnoremap <silent> <leader><leader> :WhichKey<CR>

" Make splits more easily
nnoremap <silent> <leader><leader>h :vsplit<CR> :Explore<CR>
nnoremap <silent> <leader><leader>j :split<CR> <C-w>j :Explore<CR>
nnoremap <silent> <leader><leader>k :split<CR> :Explore<CR>
nnoremap <silent> <leader><leader>l :vsplit<CR> <C-w>l :Explore<CR>

" Autocomplete
" Use <Tab> and <S-Tab> to navigate through popup menu
" Note S-Tab in insert mode is mapped to backspace.
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"
inoremap <expr> <Esc>   pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <C-d>   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

" Use tab to open insert mode completion menu.
function! s:CleverTab()
  if strpart(getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <silent><Tab> <C-R>=<SID>CleverTab()<CR>


" Lspsaga
nnoremap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>


" _ switches to last buffer if in netrw, opens netrw in a split on the left
" hand side of the window if not
nnoremap <expr> _ &ft ==# "netrw" ? "<C-^>" : ":vertical Lexplore<CR>\|:vertical resize 45<CR>"
