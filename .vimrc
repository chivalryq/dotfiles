"Basic Setting {{{
let mapleader="\<space>"
set guifont=Courier_New:h12:cANSI
set nu
set tabstop=4
set clipboard=unnamed
set incsearch
set hlsearch

"}}}

" Plugin --------------{{{
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'godlygeek/tabular'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'flazz/vim-colorschemes'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"}}}

"Windows Gvim Setting ------------{{{
"Gvim中文菜单乱码解决方案
" 设置文件编码格式
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1,gbk,gb18030,gk2312
if has("win32")
 set fileencoding=chinese
 "解决consle提示信息输出乱码
 language messages zh_CN.utf-8
else
 set fileencoding=utf-8
endif

"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


" markdown-preview
nmap <silent> <F8> <Plug>MarkdownPreview        " 普通模式
imap <silent> <F8> <Plug>MarkdownPreview        " 插入模式
nmap <silent> <F9> <Plug>StopMarkdownPreview    " 普通模式
imap <silent> <F9> <Plug>StopMarkdownPreview    " 插入模式
set pythonthreedll=$HOME\AppData\Local\Programs\Python\Python36-32\python36.dll
set pythonthreehome=$HOME\AppData\Local\Programs\Python\Python36-32\


if has("win32")
 colorscheme gruvbox
endif
"}}}

" Mapping ------------------{{{
nnoremap H ^ 
nnoremap L $

" H和L的无敌快捷键
nnoremap dL d$
nnoremap dH d^
nnoremap cL c$
nnoremap cH c^
nnoremap yL y$
nnoremap yH y^

nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

nnoremap - ddp
nnoremap _ ddkp

"delete one line in insert mode
inoremap <c-d> <esc>ddi
inoremap <esc>ddi <nop>
inoremap <c-u> <esc>viw~i
nnoremap <c-u> viw~
"(after copy a word) replace a word
nnoremap <leader>p viwp
" edit VIMRC faster
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" fast warp quote on word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" i"<esc>gva"<esc>
" quick exit insert mode mode
inoremap jk <esc>
inoremap <esc> <nop>

nnoremap <leader>l :<c-u>nohlsearch<cr><c-l>
"}}}

" Status Bar ----------------{{{
set statusline=%f         " 文件的路径
set statusline+=%=        " 右对齐
set statusline+=%l        " 当前行
set statusline+=/         " 分隔符
set statusline+=%L        " 总行数
"}}}


" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}


