" カラースキーム
syntax on
set t_Co=256
colorscheme darkblue

" エンコード設定
set encoding=utf-8
set fileencodings=utf-8,sjis

" 行番号
set number

"カーソル
set cursorline

"ステータスバー
set laststatus=2

"メッセージを2行で表示する
set cmdheight=2

" 対応する括弧表示
set showmatch

"カーソル折り返す
set whichwrap=b,s,h,l,<,>,[,]

"8行上にスペース
set scrolloff=8

" バックアップファイルを作らない
set nobackup 

" スワップファイルを作らない
set noswapfile 

" ESC の代わりに Ctrl+j を使用する
imap <c-j> <esc>
vmap <c-j> <esc>

" オートインデント
set autoindent

" タブをスペースに変更する
set expandtab

" タブを移動するときのスペース数
set shiftwidth=2

" タブを2文字分として表示
set tabstop=2

" ファイルごとのタブ設定
augroup fileTypeIndent
	autocmd!
	" ruby
	autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
	" python
	autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
