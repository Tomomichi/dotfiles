" Common -------------------------------
set nocompatible				" vim
filetype off


" File ---------------------------------
set autoread				" 更新時自動再読込み
set hidden				" 編集中でも他のファイルを開けるようにする
set noswapfile				" スワップファイルを作らない
set nobackup				" バックアップを取らない
autocmd BufWritePre * :%s/\s\+$//ge	" 保存時に行末の空白を除去する
syntax on				" シンタックスカラーリングオン
set fileformats=unix,dos,mac " 改行コード判別
if exists('+autochdir')		" カレントディレクトリを編集中ファイルのディレクトリにする
	set autochdir
endif
set encoding=utf-8
set fileencodings=iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,utf-8,ucs-bom,euc-jp,eucjp-ms,cp932
autocmd BufRead,BufNewFile *.mkd setfiletype mkd		"markdownファイルに対応
autocmd BufRead,BufNewFile *.md setfiletype mkd

let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {'outputter': 'browser', 'cmdopt': '-s'}
"let g:quickrun_config['markdown'] = {'type': 'markdown/pandoc', 'outputter': 'browser', 'cmdopt': '-s'}


" Indent -------------------------------
" tabstop:				Tab文字を画面上で何文字分に展開するか
" shiftwidth:				cindentやautoindent時に挿入されるインデントの幅
" softtabstop:				Tabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=2 shiftwidth=2 softtabstop=0
set autoindent smartindent		" 自動インデント，スマートインデント


" Assist imputting ---------------------
set backspace=indent,eol,start		" バックスペースで特殊記号も削除可能に
set formatoptions=lmoq			" 整形オプション，マルチバイト系を追加
set whichwrap=b,s,h,s,<,>,[,]		" カーソルを行頭、行末で止まらないようにする
set clipboard=unnamed,autoselect		" バッファにクリップボードを利用する
let g:neocomplcache_enable_at_startup = 1	" neocomplcacheをデフォルトでオン
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap <> <><Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `' `'<Left>
inoremap \|\| \|\|<Left>
let g:surround_45 = "<% \r %>"	" -で囲むと<% %>にする
let g:surround_61 = "<%= \r %>"	" =で囲むと<%= %>にする



" Complement Command -------------------
set wildmenu				" コマンド補完を強化
set wildmode=list:full			" リスト表示，最長マッチ


" Search -------------------------------
set wrapscan				" 最後まで検索したら先頭へ戻る
set ignorecase				" 大文字小文字無視
set smartcase				" 大文字ではじめたら大文字小文字無視しない
set incsearch				" インクリメンタルサーチ
set hlsearch				" 検索文字をハイライト
nnoremap <ESC><ESC> :nohlsearch<CR>	" ESC連打で検索結果ハイライトを解除


" Grep ---------------------------------
if has("win32") || has("win64")
	set grepprg=c:/cygwin/bin/grep\ -nH		"cygwinの外部grepにパスを通す
else
	set grepprg=grep\ -nH
endif
au QuickfixCmdPost vimgrep copen		" grep検索結果を自動で表示
au QuickfixCmdPost grep copen		" grep検索結果を自動で表示


" View ---------------------------------
set showmatch				" 括弧の対応をハイライト
set showcmd				" 入力中のコマンドを表示
set showmode				" 現在のモードを表示
set number				" 行番号表示
set nowrap				" 画面幅で折り返さない
set notitle				" タイトル書き換えない
set scrolloff=5				" 行送り
set display=uhex				" 印字不可能文字を16進数で表示
set cursorline				" カーソル行をハイライト
inoremap <expr> = smartchr#loop('=', ' = ', ' == ', ' === ')	" 標準で=の左右にスペースを入れる


" NERDTree ------------------------------
if has("gui_running")
	autocmd VimEnter * NERDTree ./	" 常にNERDTreeを表示
endif

" Vundle --------------------------------
if has("win32") || has("win64")
	set rtp+=~/vimfiles/vundle.git/
	call vundle#rc('~/vimfiles/bundle')
else
	set rtp+=~/.vim/vundle.git/
	call vundle#rc()
endif
	Bundle 'gmarik/vundle'
	Bundle 'Lokaltog/vim-powerline'
	Bundle 'scrooloose/nerdtree'
	Bundle 'tpope/vim-surround'
	Bundle 'taichouchou2/html5.vim'
	Bundle 'taichouchou2/vim-javascript'
	Bundle 'hail2u/vim-css3-syntax'
	Bundle 'tpope/vim-rails'
	Bundle 'tomtom/tcomment_vim'
	Bundle 'thinca/vim-ref'
	Bundle 'kana/vim-smartchr'
	Bundle 'Shougo/neocomplcache'
	Bundle 'thinca/vim-quickrun'
	Bundle 'tyru/open-browser.vim'
	Bundle 'sonesuke/tumblr-vim'
	Bundle 'kchmck/vim-coffee-script'
	Bundle 'groenewege/vim-less'
filetype plugin indent on

