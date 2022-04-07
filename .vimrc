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
Plugin 'preservim/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'fisadev/vim-isort', {'for': 'python3'}
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Valloric/YouCompleteMe'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'mileszs/ack.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'quramy/tsuquyomi'
Plugin 'dense-analysis/ale'
Plugin 'sheerun/vim-polyglot'
Plugin 'styled-components/vim-styled-components', { 'branch': 'main' }
Plugin 'puremourning/vimspector'

call vundle#end()

filetype plugin indent on    " required!

set binary
set noeol
"set splitbelow
"set splitright
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
let g:NERDTreeWinSize=50
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | NERDTree | endif

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

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

au FileType javascript,javascriptreact set formatprg=prettier
au FileType javascript,html,css,yaml
    \ set tabstop=2 |
    \ set expandtab |
    \ set softtabstop=2 |
    \ set shiftwidth=2

let NERDTreeShowHidden=1

"markdown preview options
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=1

"ycm options
"let g:ycm_python_binary_path = 'python'
let g:ycm_autoclose_preview_window_after_completion=1

"editorconfig options
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"virtualenv options
let g:virtualenv_directory = $HOME

"vimspector options
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'debugpy' ]
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>ds :call vimspector#Stop()<CR>
nnoremap <Leader>dr :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>
nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>drbp :call vimspector#ClearBreakpoints()<CR>
nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

nnoremap <leader>g :YcmCompleter GoTo<cr>
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

let python_highlight_all=1
syntax on
set background=dark
let g:solarized_termcolors = 256
colorscheme solarized
let g:syntastic_check_on_open = 1
set laststatus=2

"ale configurations
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fixers = {'css': ['prettier'], 'javascript': ['prettier'], 'typescript': ['prettier'], 'typescriptreact': ['prettier'], 'javascriptreact': ['prettier']}
" Fix files automatically on save
let g:ale_fix_on_save = 1
