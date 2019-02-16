" ここから標準の設定
syntax on
set t_Co=256
colorscheme molokai

set number
set cursorline "カーソル
set laststatus=2 "ステータスバー
set cmdheight=2 "メッセージ2行
set showmatch " 括弧表示
set whichwrap=b,s,h,l,<,>,[,] "カーソル折り返す
set scrolloff=8 "8行上にスペース
set nobackup " バックアップファイルを作らない
set noswapfile " スワップファイルを作らない

" タブをスペースに
set expandtab
set shiftwidth=2
set tabstop=2

set autoindent
" set noexpandtab
" set softtabstop=0

" ESC -> Ctrl+j
imap <c-j> <esc>
vmap <c-j> <esc>

" Ctrl-e で実行
autocmd BufRead,BufNewFile *.py nnoremap <C-e> :!python %
autocmd BufRead,BufNewFile *.rb nnoremap <C-e> :!ruby %
autocmd BufRead,BufNewFile *.tex nnoremap <C-e> :!./build.sh 

" ファイルごとのタブ設定
augroup fileTypeIndent
	autocmd!
	autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
	autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END


" Clipboard
set clipboard+=unnamed 
set clipboard+=autoselect

