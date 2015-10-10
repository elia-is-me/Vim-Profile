" update: 2015/10/08



" always set to no compatible to vi
set nocompatible 

"{{{ use vundle to manager my plugins

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tomasr/molokai'
Plugin 'vim-scripts/taglist.vim'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-scripts/AuthorInfo'
"Plugin 'hhktony/vim-authorinfo'
Plugin 'mbbill/fencview'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'majutsushi/tagbar'
Plugin 'mhinz/vim-startify'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"}}}



filetype plugin indent on    " required

" Set Leader
let mapleader=","
map <silent> <leader>ss :source $MYVIMRC<cr>
map <silent> <leader>ee :e $MYVIMRC<cr>
autocmd! bufwritepost vimrc source $MYVIMRC 

" Wildmenu
set wildmenu
set wildignore=*.o,*~,*.pyc,*.jpg,*.png,*.ico,*.exe

set nu
set ruler
set hid
set sw=4
set ts=4

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set noswapfile

" Ingore case when search
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set nowrap

set laststatus=2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

" No sound on errors
if has("gui_running")
	autocmd GUIEnter * set vb t_vb=
endif

set noerrorbells
set novisualbell

" Color and Fonts
syntax enable
let g:molokai_original=1
colorscheme Molokai

if has("gui_running")
	set guioptions-=T 
"	set t_Co=256
	"map <f11> :call libcallnr('gvimfullscreen.dll', 'ToggleFullScreen', 0)<cr>
endif

set fo-=cro

set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,gb2312,big5,latin1
set ffs=unix,dos,mac
map <silent> <F2> :FencView <cr>

set guifont=Monaco:h8

set columns=90

" => Moving around
map j gj
map k gk


" mswin style keymaps
nmap <C-a> ggvG$
imap <C-s> <Esc>:wa<cr>i<Right>
nmap <C-s> :wa<cr>
map <C-w> :set wrap<cr>

" --------------------
" Tagbar
"let g:tagbar_left = 0

" --------------------
" => taglist(ctags)
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let g:Tlist_javascript_settings='javascript;s:string;a:array;o:object;f:function;m:member'
map <silent> <F4> :TlistToggle<cr>


" --------------------
" => nerd tree
let g:NERDChristmasTree=1
map <silent> <F3> :NERDTreeToggle<cr>

" -------------------
" => abbreviation
iab imail <c-r>elia.of.war@gmail.com<cr>
iab idate  <c-r>=strftime("%Y/%m/%d")<cr>
iab itime <c-r>=strftime("%H:%M")<cr>

" -------------------------------------
" => open _vimrc file in a split window

nnoremap <leader>1 :set filetype=javascript<cr>
nnoremap <leader>2 :set filetype=css<cr>
nnoremap <leader>w :w<cr>

" ------------------------------------
" => Auto update author's info
let g:vimrc_author='J'
let g:vimrc_email='jeannela@foxmail.com'
let g:vimrc_homepage='http://elia-is-me.github.io'
nmap <F5> :AuthorInfoDetect <cr>
