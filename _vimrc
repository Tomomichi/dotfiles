set nocompatible

set number
set showmode
set title
set ruler
set showcmd
set showmatch
set laststatus

set showtabline=2
set imdisable
set transparency=10
set antialias
set guifont=Monaco:h14
colorscheme evening

if has("gui_running")
	set fuoptions=maxvert,maxhorz
	au GUIEnter * set fullscreen
endif


set rtp+=~/.vim/vundle.git/
call vundle#rc()

	Bundle 'Lokaltog/vim-powerline'

filetype plugin indent on

