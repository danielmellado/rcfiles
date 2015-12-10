" load pathogen
execute pathogen#infect()

" syntax highlighting
" syntax enable

let python_highlight_all=1
syntax on

" enable file type detection
filetype on

" set theme
set t_Co=256
set background=dark
set encoding=utf-8
colorscheme bubblegum

" show number lines the title of the window and the ruler
set number
set title
set ruler

" highlight current line
set cursorline

" show color column at 80
set colorcolumn=80

" disable swap files
set nobackup
set nowritebackup
set noswapfile

" highlight inc search
set hlsearch
set incsearch

"This clears the 'last search pattern' by hitting return
nnoremap <CR> :noh<CR><CR>

" open new slip panes to right and bottom, which feels more natural
set splitbelow
set splitright

" autocompletion options
set completeopt=menuone,longest,preview
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" lines longer than 80 columns will be broken
set textwidth=80
" operation >> indents 4 columns; << unindents 4 columns
set shiftwidth=4
" an hard TAB displays as 4 columns
set tabstop=4
" insert spaces when hitting TABs
set expandtab
" insert/delete 4 spaces when hitting a TAB/BACKSPACE
set softtabstop=4
" round indent to multiple of 'shiftwidth'
set shiftround
" align the new line indent with the previous line
set autoindent
set foldmethod=indent
" inside a method type 'za' to open and close a fold.
set foldlevel=99

" Alt + Arrow navigation
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Use system clipboard
set clipboard=unnamed

" --- PLUGINS ----

" remaps for vim-uninmpaired
nmap < [
nmap > ]
omap < [
omap > ]
xmap < [
xmap > ]

" load the plugin indent file for specific file types
filetype plugin indent on

" Remove trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWritePre * :%s/\s\+$//e

" vim-license
" Add apache license to new python files
let g:licenses_copyright_holders_name = 'Red Hat, Inc.'
autocmd BufNewFile *.py :Apache

" Flake8
" run the Flake8 check every time you write a Python file
autocmd BufWritePost *.py call Flake8()

" NERDTree
" configure NERDTree to close if it's the last tab and maps
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR>
map <C-Right> :tabn<cr>
map <C-Left> :tabp<cr>
map <C-t> :tabnew<CR>

" Vim-Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"vim-gitgutter
let g:gitgutter_highlight_lines = 0
let g:gitgutter_realtime = 1

"vim-tagbar
nnoremap <silent><F3> :TagbarToggle<CR>
let g:tagbar_width = 30
let g:tagbar_autoclose = 1

"vim-isort
nnoremap <silent><F8> :Isort<CR>

"vim-ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"Add the virtualenv's site-packages to vim path"
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
