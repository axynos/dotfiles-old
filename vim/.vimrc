set encoding=UTF-8
set nocompatible              " be iMproved, required
set termguicolors
set number relativenumber

set cursorline

" Disable cursor line when entering Insert Mode
autocmd InsertEnter * set nocursorline

" Enable cursor line when leaving Insert Mode
autocmd InsertLeave * set cursorline

" Switch between line numbering.
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Change vertical split character to be full row height.
set fillchars+=vert:│

" Always show a sign column for git gutter etc.
set signcolumn=yes

" Automatically download vim-plug if it is not yet installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader = "\<Space>"

" Vim Plug plugins
call plug#begin()
Plug 'tpope/vim-sensible' " Sensible defaults for vim
Plug 'tpope/vim-surround' " Provides a surround object to operate on
Plug 'tpope/vim-fugitive' " Git in vim
Plug 'tpope/vim-commentary' " Helps with commenting out lines, blocks etc
Plug 'tpope/vim-repeat' " Enables plugin repeating
Plug 'tpope/vim-speeddating' " Date manipulation.

Plug 'svermeulen/vim-subversive'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-cutlass'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " Fuzzy file finder

" Visual Aids
Plug 'airblade/vim-gitgutter' " Git status in linenr column
Plug 'thaerkh/vim-indentguides'

Plug 'thaerkh/vim-workspace'
Plug 'junegunn/goyo.vim'
Plug 'rizzatti/dash.vim'

" Themeing
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'

" Autocomplete and Syntax Highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-vinegar' " Modifications to netrw to make it more usable.
" Devicons has to be the last plugin to be loaded.
Plug 'ryanoasis/vim-devicons'
call plug#end()

let g:yoinkIncludeDeleteOperations = 1
let g:yoinkSyncSystemClipboardOnFocus = 0

" Make netrw have a tree view
let g:netrw_liststyle = 3

" m now becomes "move" - yoink and delete
nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D

nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

" Rotate through yank buffer using leader-y and leader-u
nmap <silent><nowait> <leader>y <plug>(YoinkRotateForward)
nmap <silent><nowait> <leader>r <plug>(YoinkRotateBack)

" Override theme-specific background colors to match terminal background.
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guifg=#3A3B48 guibg=NONE ctermfg=NONE ctermbg=NONE
hi CursorLine guibg=#3A3B48 ctermbg=NONE

colorscheme snazzy
let g:airline_theme = 'base16_snazzy'

" I don't know what this does.
" Should figure it out eventually.
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:coc_global_extensions = [ 'coc-tsserver', 'coc-pairs', 'coc-prettier', 'coc-json', 'coc-css' ]

" Vim Workspaces
let g:workspace_create_new_tabs = 0  " enabled = 1 (default), disabled = 0
nnoremap <leader>S :ToggleWorkspace<CR>
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_persist_undo_history = 1
let g:workspace_undodir='.undodir'
let g:workspace_autosave_always = 1

" Change cursor in various modes. This setting is for iTerm2 on macOS only.
" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
" 0: Block
" 1: Vertical bar
" 2: Underline
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]1337;CursorShape=1\x7" " Insert mode
  let &t_EI = "\<Esc>]1337;CursorShape=2\x7" " Normal mode
endif

" Map scrolling down/up to a more comfortable location.
nnoremap <silent><nowait> <c-j> <c-d>
nnoremap <silent><nowait> <c-k> <c-u>

" Vertical resize window with ctrl-, and ctrl-.
nnoremap <silent><nowait> ß :vertical resize +5<CR>
nnoremap <silent><nowait> <c-l> :vertical resize -5<CR>

" Open and close tabs with leader t/T
nnoremap <silent><nowait> <leader>t :tabe<CR>
nnoremap <silent><nowait> <leader>T :tabc<CR>

" Move between tabs with leader R/Y
nnoremap <silent><nowait> <leader>Y gt
nnoremap <silent><nowait> <leader>R gT

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" _ switches to last buffer if in netrw, opens netrw in a split on the left
" hand side of the window if not
nnoremap <expr> _ &ft ==# "netrw" ? "<C-^>" : ":vertical Lexplore<CR>\|:vertical resize 45<CR>"


" Leader key remaps
" Look up visual selection in Dash (in dataset according to filetype)
xnoremap <silent><nowait> <leader>d <Esc>:execute "Dash" getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]<CR>
" Look up visual selection in Dash (in global dataset)
xnoremap <silent><nowait> <leader>D <Esc>:execute "Dash!" getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]<CR>
" Look up word under cursor in Dash (local dataset)
nnoremap <silent><nowait> <leader>d <Esc>:Dash<CR>
" Look up word under cursor in Dash (global dataset)
nnoremap <silent><nowait> <leader>D <Esc>:Dash!<CR>

" Space-Wincmd
nnoremap <silent><nowait> <leader>w <C-w>
nnoremap <silent><nowait> <leader>q <C-w>q


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
