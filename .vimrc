color lucius
LuciusDarkLowContrast

syntax on



" Set cross-like cursor
set cursorcolumn
set cursorline

" To avoid vim's own clipboard (works on OS X only?)
set clipboard=unnamed

" Show the matching part of a pair for [] {} and ()
set showmatch

" Enable folding
set foldmethod=indent
set foldlevel=99

" UTF-8 support
set encoding=utf-8

" Powerline visible only when plugin like NERDTree is active, fix it to display always
set laststatus=2



" Enable all Python syntax highlighting features
let python_highlight_all = 1

" Show docstring when folding
let g:SimpylFold_docstring_preview=1

" Let's syntastic uses those priority
let g:syntastic_python_checkers = ['flake8', 'pylint', 'python']

" Ignore in NERDTree .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$']

" To detect different venvs
"You can use this code instead of using plugin jmcantrell/vim-virtualenv and `let g:virtualenv_directory = $PWD`
"use py or py3 depends of your vim

"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

let g:virtualenv_directory = $PWD



" Enable Vundle + + +

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'jnurmine/Zenburn'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable Vundle - - -



" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable folding with the spacebar
nnoremap <space> za



" Additional settings by filetype
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set number

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Flagging Unnecessary Whitespace
" :highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/



" JEDI-VIM close preview window after completion
" let g:jedi#auto_close_doc = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

