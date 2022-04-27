" Basics
" Note: some of these are included in vim-sensible,
" but I've included them here anyway.
set nocompatible
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8

" For some reason the syntax needs to be reenabled.
" autocmd BufRead,BufEnter,FocusGained * syntax enable

" Initialize autocmd
autocmd!

" Set up python for nvim using virtualenv first
" https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim#using-virtual-environments
" Python2 disabled for Apple Silicon, not sure I need it for anything.
" let g:python_host_prog = '.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '.pyenv/versions/neovim3/bin/python'

" Make netrw have a tree view
let g:netrw_liststyle = 3

" Disable cursorline in Insert Mode
set cursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline

" TextEdit might fail if hidden is not set
set hidden

" Some servers have issues with backup files
set nobackup
set nowritebackup

" Dynamic line numbering
" Show relative line numbers in Normal Mode
" Show absolute line numbers in Insert Mode
set number relativenumber
augroup numbertoggle
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set title

" Highlight searches
set hlsearch

" Incremental substitution (neovim)
" Demo https://www.youtube.com/watch?v=sA3z6gsqOuw
if has('nvim')
  set inccommand=split
endif

" Specify space for displaying messages
set cmdheight=2

" Always show the status line
set laststatus=2

" Show last command
set showcmd

" Min lines to show above and below cursor
set scrolloff=15

" Longer updatetime (default is 4000ms) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Change vertical split character to be full row height
set fillchars+=vert:│

" Always show a sign column
" Used for git gutter etc
set signcolumn=yes

set lazyredraw

" Ignore case in a pattern until uppercase
set smartcase

" Indent options aka controversial opinions
filetype plugin indent on
" sw - shift-width
" sts - soft tab stop
" et - expandtab
set sw=2 sts=2 et
set autoindent
set expandtab

" Finding files: include subfolders, but ignore node_modules
set path+=**
set wildignore+=*/node_modules/*

" File types
au BufNewFile,BufRead *.es6 setf javascript
au BufNewFile,BufRead *.tsx setf typescriptreact
au BufNewFile,BufRead *.md set filetype=markdown

" Filetype overrides
au FileType python setlocal et sw=4 sts=4 smartindent

" Autocomplete
set completeopt=menuone,noinsert,noselect

" Autostart Coq
let g:coq_settings = {
      \ 'clients': { 'tabnine': { 'enabled': v:false }},
      \ 'auto_start': 'shut-up',
      \ 'display.pum.fast_close': v:false
      \ }

" Automatically download vim-plug if it is not yet installed
if empty(glob('~'))
  silent !curl -fLo
        \ "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/plug.vim
endif


" Vim Workspaces
let g:workspace_create_new_tabs = 1
let g:workspace_session_directory = $HOME.'/.vim/sessions'
let g:workspace_persist_undo_history = 1
let g:workspace_undodir = $HOME.'/.vim/undodir'
let g:workspace_autosave_always = 0
let g:workspace_autosave = 0


" --------------------------------
" Import configs from other files.
" --------------------------------
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif

runtime ./maps.vim
" --------------------------------

" Syntax theme & true color
" --------------------------------
set termguicolors
set winblend=0
set wildoptions=pum
set pumblend=5
set background=dark

let g:snazzybuddy_icons = v:true

" I don't know what this does.
" Should figure it out eventually.
" Does something for tmux.
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Override theme-specific background colors to match terminal background.
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guifg=#3A3B48 guibg=NONE ctermfg=NONE ctermbg=NONE
hi CursorLine guibg=#3A3B48 ctermbg=NONE

" lua require('base16-colorscheme').setup('base16-snazzy')
lua require('colorbuddy').colorscheme('snazzybuddy')

colorscheme snazzybuddy

" Overwrite some styles for snazzybuddy
hi TablineSel guifg=#5af78e guibg=none guisp=none
hi NormalNC guifg=none guibg=none guisp=none
hi Whitespace guifg=#363b44 guibg=none guisp=none


" colorscheme nord
" --------------------------------
