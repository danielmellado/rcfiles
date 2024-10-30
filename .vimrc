" .vimrc configuration

" Basics
set nocompatible               " Enable modern Vim features
filetype off                   " Disable filetype detection temporarily for Vundle setup

" Vundle Setup for Plugin Management
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Manage Vundle itself
Plugin 'VundleVim/Vundle.vim'

" Plugins List
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'baskerville/bubblegum'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'preservim/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'nvie/vim-flake8'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'davidhalter/jedi-vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'antoyo/vim-licenses'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'honza/vim-snippets'
Plugin 'edkolev/tmuxline.vim'
Plugin 'matze/vim-move'
Plugin 'xuhdev/vim-latex-live-preview'

call vundle#end()               " End Vundle setup
filetype plugin indent on       " Enable filetype detection and auto-indentation

" Basic Settings
set encoding=utf-8
set t_Co=256                    " Enable 256 colors
set background=dark
colorscheme bubblegum-256-dark  " Set color scheme
set number                      " Show line numbers
set title                       " Show file name in window title
set ruler                       " Show cursor position
set cursorline                  " Highlight current line
set colorcolumn=80              " Show 80-character limit column
set backspace=indent,eol,start  " Enable flexible backspace in insert mode
set splitbelow                  " New splits open below
set splitright                  " New vertical splits open to the right

" Syntax Highlighting
syntax on
let python_highlight_all=1

" Disable swap and backup files
set nobackup
set nowritebackup
set noswapfile

" Search settings
set hlsearch
set incsearch
nnoremap <CR> :noh<CR><CR>      " Clear search highlighting with Enter

" Indentation settings
set textwidth=80
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set shiftround
set autoindent
set foldmethod=indent
set foldlevel=99

" Enable system clipboard usage
set clipboard=unnamed

" --- Plugin Settings ---

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
map <C-Right> :tabn<cr>
map <C-Left> :tabp<cr>
map <C-t> :tabnew<CR>

" NERDCommenter
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_python = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Vim-Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'

" GitGutter
let g:gitgutter_highlight_lines = 0
let g:gitgutter_realtime = 1

" Tagbar
nnoremap <silent><F3> :TagbarToggle<CR>
let g:tagbar_width = 30
let g:tagbar_autoclose = 1

" Remove trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWritePre * :%s/\s\+$//e

" SnipMate configuration
let g:snipMate = { 'snippet_version' : 1 }

" Virtualenv for Python
autocmd BufNewFile *.py :Apache
let g:licenses_copyright_holders_name = 'Red Hat, Inc.'

" Flake8 linting for Python files
autocmd BufWritePost *.py call Flake8()

" Move plugin configuration
let g:move_key_modifier = 'C'

" YAML specific settings
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Window navigation with Alt + Arrow keys
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
