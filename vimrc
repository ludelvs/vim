" コマンド履歴の保持数
set history=20

" バックスペースでインデントとや改行を削除できるようにする
set backspace=indent,eol,start

" 前回閉じた行位置を記憶する
if has("autocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

" 行番号を表示する
set number

" 改行しない
"set nowrap

" 新しい行のインデントを現在行と同じにする
set autoindent

" バックアップを取らない
set nobackup

" スワップファイルを作成しない
set noswapfile

" ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer

" クリップボードをWindowsと連携
set clipboard+=unnamed

" Vi互換をオフ
set nocompatible

" パス入力時にタブ補完
set wildmenu wildmode=list:full

" タブの代わりに空白文字を挿入する
set expandtab

" インクリメンタルサーチを行う
set incsearch

" シフト移動幅
set shiftwidth=2

" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

" 検索時に大文字を含んでいたら大/小を区別
set smartcase

" 新しい行を作ったときに高度な自動インデントを行う
"set smartindent

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

" ファイル内の <Tab> が対応する空白の数
set tabstop=2

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" 検索をファイルの先頭へループしない
set nowrapscan

" 検索時に大文字小文字を区別しない
set ignorecase

" 検索パターンに大文字が含まれる場合だけは大文字小文字が区別される
set smartcase

" ウィンドウを最大化して起動
au GUIEnter * simalt ~x

" 入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

" 日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0

" タブ幅をリセット
au BufNewFile,BufRead * set tabstop=2 shiftwidth=2

" .rhtmlと.rbでタブ幅を変更
au BufNewFile,BufRead *.rhtml   set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb  set nowrap tabstop=2 shiftwidth=2

" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
set pastetoggle=<F12>

set shiftround

noremap <CR> o<ESC>

" ビジュアルモード時vで行末まで選択
vnoremap v $h

set cursorline

" スペースキーでカーソルを画面中心に保ってスクロール
nnoremap <Space> jzz
nnoremap <S-Space> kzz

" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
set ambiwidth=double
endif

" 保存していなくても別のファイルを開く
set hidden

" [Ctrl]を押しながら[j]を押すことで、表示するファイルを順に切り替え
nmap <silent> <C-j>      :update<CR>:bn<CR>
imap <silent> <C-j> <ESC>:update<CR>:bn<CR>
vmap <silent> <C-j> <ESC>:update<CR>:bn<CR>
cmap <silent> <C-j> <ESC>:update<CR>:bn<CR>
nmap <silent> <C-b>      :update<CR>:bN<CR>
imap <silent> <C-b> <ESC>:update<CR>:bN<CR>
vmap <silent> <C-b> <ESC>:update<CR>:bN<CR>
cmap <silent> <C-b> <ESC>:update<CR>:bN<CR>

" 表示 {{{
" シンタックスのハイライト
syntax on

" 全角空白、タブ文字、行末の空白を視覚化
function! ActivateInvisibleIndicator()
  syntax match InvisibleMultibyteSpace "　" display containedin=ALL
  syntax match InvisibleTab "\t" display containedin=ALL
  syntax match InvisibleEOLSpace "\s\+$" display containedin=ALL

  " see: http://upload.wikimedia.org/wikipedia/commons/9/95/Xterm_color_chart.png
  highlight InvisibleMultibyteSpace term=underline ctermbg=88
  highlight InvisibleTab term=underline cterm=underline ctermfg=234
  highlight InvisibleEOLSpace term=underline ctermbg=238
endf

augroup invisible
  autocmd! invisible
  autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
augroup END

" カラースキーマの設定
colorscheme molokai

" 背景色
"set background=dark

" 一部のマルチバイト文字を正しく認識させる
set ambiwidth=double

" 常にカーソル位置から指定行数を空ける
set scrolloff=20

" 対応する括弧を表示
set showmatch

" 行番号の表示
set number

" ステータスラインにエンコーディングや改行コード情報を表示
set statusline=%F%m%r%h%w\%=\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[POS=%04l,%04v][%p%%]\[LOW=%l/%L]

" 'statusline'の情報を常にステータスラインに表示
set laststatus=2
" }}}

" 編集 {{{
" 高度なインデント
set smartindent

" シフトオペレータのインデント数
set shiftwidth=2

" タブの移動量
set tabstop=2

" TABキーをスペースに変換
set expandtab
" }}}

" 操作 {{{
" 次のタブに移動
map <C-n> :tabn <Enter>

" 前のタブに移動
map <C-p> :tabp <Enter>
" }}}

" 検索 {{{
" インクリメンタルサーチを有効化
set incsearch

" 検索にマッチするすべてのキーワードをハイライト化
set hlsearch

" 検索時の大文字・小文字を無視する
set ignorecase

" 大文字を含めた検索時のみ大文字・小文字を区別する
set smartcase

" 検索後にファイルの先頭へループしない
"set nowrapscan
" }}}

filetype plugin indent on     " required!
filetype indent on

let g:Powerline_symbols = 'fancy'
set t_Co=256

let g:Powerline_symbols = 'compatible'

" neocomplcache {{{
" プラグインの有効化
let g:neocomplcache_enable_at_startup = 1

" ポップアップリストの長さ
let g:neocomplcache_max_list =  20

" 日本語を補完候補として取得しない
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" キャッシュディレクトリ
let g:neocomplcache_temporary_dir = '~/.vim/.neocon'
"let g:neocomplcache_temporary_dir = $home.'/.vim/.neocon'

" 辞書
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'php' : '~/.vim/dict/php.dict',
  \ }

" tabで補完
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
" }}}


" syntastic {{{
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}
" }}}


" エンコーディングと改行コード {{{
" 内部エンコーディング
set encoding=utf-8

" 出力エンコーディング
set termencoding=utf-8

" ファイルを開く際に優先するエンコーディング
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp

" 改行の自動認識
set fileformats=unix,dos,mac
" }}}

" neosnippet {{{
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.

if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" }}}

" NERDTree {{{
nmap <F9> :NERDTreeToggle<CR>
"隠しファイル表示
let NERDTreeShowHidden=1
" }}}

" ctrl+lで記録を実行
nmap <C-l> @q
" 全選択
nmap <C-a> ggVG

nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?

source $VIMRUNTIME/macros/matchit.vim

let php_noShortTags = 1

set mouse=a

" ヴィジュアルモードで選択したテキストをnで検索する(レジスタv使用)
vnoremap <silent> n "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

" x でレジスタのリストに入れない
nnoremap x "_x
let g:yankring_n_keys = 'Y D'

" 通常はブロック型点滅カーソル,挿入モード時はライン型点滅カーソル
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" dein {{{
if &compatible
  set nocompatible
endif

" Vim起動完了時にインストール
augroup PluginInstall
  autocmd!
  autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

" 各プラグインをインストールするディレクトリ
let s:plugin_dir = expand('~/.vim/dein/')
" dein.vimをインストールするディレクトリをランタイムパスへ追加
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_dir

" dein.vimがまだ入ってなければ 最初に`git clone`
if !isdirectory(s:dein_dir)
  call mkdir(s:dein_dir, 'p')
  silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
endif

if dein#load_state(s:plugin_dir)
  call dein#begin(s:plugin_dir)

  " ここからインストールするプラグインを書いていく
  call dein#add('Shougo/dein.vim')

  " インストール後ビルドする場合
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

  " 条件によって使ったり使わなかったり制御する場合
  call dein#add('Shougo/neocomplete.vim', {
        \ 'if' : has('lua')
        \ })

  " 依存関係がある場合
  call dein#add('Shougo/unite.vim')
  call dein#add('ujihisa/unite-colorscheme', {'depends' : 'Shougo/unite.vim'})

  " 手動でcall dein#source('プラグイン名')して使い始める場合
  call dein#add('Shougo/vimfiler', {'lazy' : 1})

  " 指定のファイルタイプ使う場合
  call dein#add('tpope/vim-rails', {'on_ft' : 'ruby'})

  " dein.vimで管理して更新だけするリポジトリ（NeoBundleFetchとおなじ）
  call dein#add('jszakmeister/markdown2ctags', {'rtp': ''})

  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/vimshell')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neocomplcache.vim')
  call dein#add('Shougo/neosnippet')
  call dein#add('jpalardy/vim-slime')
  call dein#add('scrooloose/syntastic')
  call dein#add('othree/eregex.vim')
  call dein#add('sudo.vim')
  call dein#add('tComment')
  call dein#add('Syntastic')
  call dein#add('The-NERD-tree')
  call dein#add('thinca/vim-ref.git')
  call dein#add('jpo/vim-railscasts-theme.git')
  call dein#add('tpope/vim-surround.git')
  call dein#add('JavaScript-syntax')
  call dein#add('LeafCage/yankround.vim')

  " サブディレクトリを指定してdein#add()する場合
  " frozenオプションは自動で更新しない
  " 自分で開発するプラグインの管理に便利
  call dein#local('~/src/github.com/violetyk',
        \ {
        \   'frozen' : 1,
        \   'depends' : [
        \     'kana/vim-gf-user',
        \     'Shougo/neosnippet.vim',
        \     'vim-jp/vital.vim'
        \   ]
        \ },
        \ [
        \   '*.vim',
        \   'neosnippet-*',
        \   'neocomplete-*',
        \   'scratch-utility'
        \ ])
  call dein#end()
  call dein#save_state()
endif
" }}}

filetype plugin indent on

" yankround {{{
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_dir = '~/.vim/yankround'
nnoremap <silent><SID>(ctrlp) :<C-u>CtrlP<CR>
nmap <expr><C-p> yankround#is_active() ? "\<Plug>(yankround-prev)" : "<SID>(ctrlp)"
nnoremap <silent>g<C-p> :<C-u>Unite yankround<CR>
" }}}
