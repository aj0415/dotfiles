set nocompatible              " be iMproved
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'fisadev/vim-isort', {'for': 'python'}
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()

filetype plugin indent on    " required!

set splitbelow
set splitright
set nu
set nowrap
set hidden
set clipboard=unnamed
set encoding=utf-8
set wildignore=*.swp,*.bak,*.pyc,*.class
set nobackup
set noswapfile
let mapleader = "\<Space>"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" reload vimrc on save
augroup config
  autocmd!
  autocmd BufWritePost $MYVIMRC :so $MYVIMRC
augroup END

if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

function! Preserve(command)
  let l:winview = winsaveview()
  let l:search = getreg('/')
  execute 'keepjumps ' . a:command
  call winrestview(l:winview)
  call setreg('/', l:search)
endfunction
function! s:cleanwhitespace()
  normal! G
  while getline('.') =~ '^\s*$' && line('.') != 1
    normal! dd
  endwhile
  %s/\s\+$//e
endfunction
function! CleanWhiteSpace()
  call Preserve('call s:cleanwhitespace()')
endfunction
"remove trailing whitespace on save
augroup preSave
  autocmd!
  autocmd BufWritePre * call CleanWhiteSpace()
augroup END

" restore cursor position when opening up a file
augroup restorecursor
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"file formatting
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=99 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoTo<cr>
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
let python_highlight_all=1
syntax on
set background=dark
let g:solarized_termcolors = 256
colorscheme solarized
let g:syntastic_check_on_open = 1
set laststatus=2
