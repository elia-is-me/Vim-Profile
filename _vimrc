" ==================== "
"  update: 2015-10-28
" ==================== "

" ================================================================================"
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
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'vim-scripts/taglist.vim'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mbbill/fencview'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mhinz/vim-startify'
"Plugin 'dyng/ctrlsf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"}}}

" ============================================================================== "
"

if has('multi_byte')
	" Legacy encoding is the system default encoding
	"let legacy_encoding=&encoding
endif


if has('gui_running') && has('multi_byte')
	" Set encoding (and possibly fileencodings)
	if $LANG !~ '\.' || $LANG =~? '\.UTF-8$'
		set encoding=utf-8
	else 
		let $encoding=matchstr($LANG, '\.\zs.*')
		let $fileencodings='ucs-bom,utf-8,' . $encoding
		let legacy_encoding=$encoding
	endif

	language messages zh_CN.UTF-8

endif

if has('directx') && $VIM_USE_DIRECTX != '0'
	"set renderoptions=type:directx,renmode:5
	let s:use_directx=1
endif

if has('syntax')
	set spelllang=en_gb
endif


filetype plugin indent on    " required

" Set Leader
let mapleader=","
map <silent> <leader>ss :source $MYVIMRC<cr>
map <silent> <leader>ee :e $MYVIMRC<cr>
autocmd! bufwritepost vimrc source $MYVIMRC 
map <silent> <leader>xx :close<cr>

set nowrap
set whichwrap+=<,>,h,l
map <silent><leader>tt :set invwrap<cr>
set linebreak
set showbreak=>_
set breakat-=-

set textwidth=80
set formatoptions+=mM


" Wildmenu
set wildmenu
set wildignore=*.o,*~,*.pyc,*.jpg,*.png,*.ico,*.exe

set number
set numberwidth=6
set ruler
set hid
set sw=4
set ts=4

set backspace=eol,start,indent
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
let g:molokai_original=0
colorscheme mermaid

if has("gui_running")
	" t: tearoff menu items
	" T: Toolbar
	set guioptions-=T
	set guioptions-=t
	"map <f11> :call libcallnr('gvimfullscreen.dll', 'ToggleFullScreen', 0)<cr>
endif

set fo-=cro

set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,gb2312,big5,latin1
set ffs=unix,dos,mac
map <silent> <F2> :FencView <cr>

set guifont=Monaco:h8
"set guifont=menlo:h9
"set gfw=NSimSun:h9
set gfw=Mingliu:h9
set linespace=-1


set lines=40
set columns=120
set colorcolumn=90

" => Moving around
map j gj
map k gk
map <A-h> <C-o>h
map <A-j> <C-o>j
map <A-k> <C-o>k
map <A-l> <C-o>l


" mswin style keymaps
nmap <C-a> ggvG$
imap <C-s> <Esc>:wa<cr>i<Right>
nmap <C-s> :wa<cr>

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
iab iname <c-r>elia<cr>
iab imail <c-r>jeannela@foxmail.com<cr>
iab idate  <c-r>=strftime("%Y-%m-%d")<cr>
iab itime <c-r>=strftime("%H:%M")<cr>

" -------------------------------------
" => 

nnoremap <leader>1 :set filetype=javascript<cr>
nnoremap <leader>2 :set filetype=css<cr>
nnoremap <leader>w :w<cr>

"----------------------------------------------------------------------------------------
" startify settings
let g:startify_bookmarks = [
			\ 'E:\GitHub\Foobar2000-UI-Scripts\scripts\Playlist.js',
			\ 'E:\GitHub\Foobar2000-UI-Scripts\scripts\Cover+PlaylistManager.js',
			\ 'E:\GitHub\Foobar2000-UI-Scripts\scripts\Xiami.js'
			\ ]
