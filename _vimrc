""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" update: 2015-11-02 19:19
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * Vundle: Use vundle as plugin manager tool
" * install git and vundle first. 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Required by vundle
set nocompatible 
filetype off 

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manager vundle, required.
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

" Vundle settings ended here
call vundle#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * Encoding settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('multi_byte')
	" Legacy encoding is the system default encoding
	let legacy_encoding=&encoding
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




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * Use directx (disabled by default)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('directx') && $VIM_USE_DIRECTX != '0'
	" renmode:5 >> best
	"set renderoptions=type:directx,renmode:5
	"let s:use_directx=1
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable filetype plugins
filetype plugin indent on

" Set auto read when a file is changed from the outside
set autoread

" Set a mapleader key instead of '\'
let mapleader = ","
let g:mapleader = ","

" Set 5 lines to the cursor
set so=5

" Use Unix as a standard file type
set ffs=unix,dos,mac

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * User interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show line number
set number
set numberwidth=6

" Always show current postion(at status bar)
set ruler

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace
set backspace=eol,start,indent

" No error bells
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Search settings
" Ignore case when searching
set ignorecase

" Try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in morden brwsers
set incsearch


" For regular expressions turn magic on
set magic

" Don't redraw while executing macros (good performance)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Turn on the Wild menu
set wildmenu
set wildignore=*.o,*~,*.pyc

" Set status line
set laststatus=2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

" No new commented lines if...
set fo-=cro


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * Window 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui_running")
	" Hide toolbar
	set guioptions-=T

	" Tearoff menu items
	set guioptions-=t

	" Default window size
	set lines=40
	set columns=120
endif

" Color column position
set colorcolumn=90

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * Text, tab, indent and wrap related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Wrap settings
set nowrap
set whichwrap+=<,>,h,l
set linebreak
"set breakat

" Set wrap if FileType == markdown
autocmd FileType markdown set wrap

" Text breakline
set textwidth=80
set formatoptions+=mM
autocmd FileType markdown set tw=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * Backup and undo 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup and swapfile off
set nobackup
set nowb
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax
syntax on

" Set colorscheme
if has("gui_running")
	set background=dark
	colorscheme mermaid
endif

" Set fonts(require a non-offical version of gvim.exe)
if has("gui_running")
	"set guifont=Monaco:h8:cANSI
	set guifont=Source\ Code\ Pro:h9:cANSI
	"set gfw=Mingliu:h9

	" Reduce linespace
	"set linespace=-1
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * Moving around
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Move between splitted windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * Mswin style keymaps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" C-a to select all and C-s to save
nmap <C-a> ggvG$
imap <C-s> <Esc>:wa<cr>i<Right>
nmap <C-s> :wa<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Abbreviation
iab idate  <c-r>=strftime("%Y-%m-%d")<cr>
iab itime <c-r>=strftime("%H:%M")<cr>

" Quick set filetype
nnoremap <leader>1 :set filetype=javascript<cr>
nnoremap <leader>2 :set filetype=css<cr>

" Quick save
nnoremap <leader>w :w<cr>

" Quick load vimrc
map <silent> <leader>ss :source $MYVIMRC<cr>

" Open vimrc
map <silent> <leader>ee :e $MYVIMRC<cr>
autocmd! bufwritepost vimrc source $MYVIMRC 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * Taglist settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let g:Tlist_javascript_settings='javascript;s:string;a:array;o:object;f:function;m:member'
map <silent> <F4> :TlistToggle<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * NERD_tree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDChristmasTree=1
map <silent> <F3> :NERDTreeToggle<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * FencView
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <F2> :FencView <cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * Startify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_bookmarks = [
			\ 'E:\GitHub\Foobar2000-UI-Scripts\scripts\Playlist.js',
			\ 'E:\GitHub\Foobar2000-UI-Scripts\scripts\Cover+PlaylistManager.js',
			\ 'E:\GitHub\Foobar2000-UI-Scripts\scripts\Xiami.js',
			\ 'E:\GitHub\WSH-Playlist\Scripts\pl.js'
			\ ]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Cmt()
	let end=80
	let num=col("$")-1
	let chr=getline(".")[col("$")-1]
	while num<=end
		let line=getline(".")
		let repl=substitute(line,'<End>',chr,'g')
		call setline(".",repl)
		let num=num+1
	endwhile
endfunction

