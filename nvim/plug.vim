" Based on
" https://blog.inkdrop.app/how-to-set-up-neovim-0-5-modern-plugins-lsp-treesitter-etc-542c3d9c9887

call plug#begin(stdpath('data').'/plugged')
Plug 'tpope/vim-sensible' " Sensible defaults for vim
Plug 'tpope/vim-surround' " Surround text object
Plug 'chaoren/vim-wordmotion' " Adds more word motions to allow better pascal case etc navigation.
Plug 'wellle/targets.vim' " Adds additional targets
Plug 'tpope/vim-fugitive' " Git in vim
" Plug 'tpope/vim-commentary' " Helps with commenting out lines, blocks etc
Plug 'numToStr/Comment.nvim' " Comments using treesitter
Plug 'tpope/vim-repeat' " Enables plugin repeating
Plug 'airblade/vim-gitgutter' " Git status in linenr column
Plug 'tpope/vim-vinegar' " Modifications to netrw to make it more usable.

" More options for moving around vim.
Plug 'ggandor/lightspeed.nvim'

" See list of available key binds
Plug 'folke/which-key.nvim'

" Dim inactive panes
" Enable when floating window error is fixed
" Plug 'sunjon/shade.nvim'

Plug 'godlygeek/tabular' " Makes aligning text much easier

Plug 'neovim/nvim-lspconfig' " Native LSP
Plug 'jose-elias-alvarez/null-ls.nvim' " In-memory LSP Server
" Plug 'glepnir/lspsaga.nvim'  " Improved LSP UI
Plug 'tami5/lspsaga.nvim'  " Improved LSP UI

" Fast as fuck autocomplete
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'JoosepAlviste/nvim-ts-context-commentstring' " Allows Comment.nvim in JSX
" Plug 'nvim-treesitter/playground'

" Rainbow brackets using treesitter
Plug 'p00f/nvim-ts-rainbow'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " RGB Highlighting

" Provide better access to diagnostics
Plug 'folke/trouble.nvim'

" Telescope and it's dependencies
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'lukas-reineke/indent-blankline.nvim'

" Complete pairs using treesitter.
Plug 'windwp/nvim-autopairs'

Plug 'mattn/emmet-vim'

" Highlight node under cursor using treesitter.
Plug 'RRethy/vim-illuminate'

" Make it so default cut operations write to the black hole register
Plug 'svermeulen/vim-subversive'
Plug 'svermeulen/vim-cutlass'

" Add workspace support
Plug 'thaerkh/vim-workspace'

" Icons used by other plugins
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" Status line
Plug 'hoob3rt/lualine.nvim'

Plug 'tjdevries/colorbuddy.nvim'

Plug 'RRethy/nvim-base16' " Colorschemes
Plug 'bbenzikry/snazzybuddy.nvim'

call plug#end()
