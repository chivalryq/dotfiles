"Basic Setting {{{
let mapleader="\<space>"
set guifont=Courier_New:h12:cANSI
set number
set ignorecase
set relativenumber
set tabstop=4
set clipboard=unnamed
set incsearch
set hlsearch
set expandtab
set noerrorbells
set hidden
set scrolloff=8

set signcolumn=yes
set encoding=UTF-8


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
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'honza/vim-snippets'
Plug 'mhinz/vim-startify'

"always the latest
Plug 'ryanoasis/vim-devicons'

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
if has("win32")
        set pythonthreedll=$HOME\AppData\Local\Programs\Python\Python36-32\python36.dll
        set pythonthreehome=$HOME\AppData\Local\Programs\Python\Python36-32\
endif


"}}}



" Mapping ------------------{{{
nnoremap H ^
nnoremap L $

" H和L的无敌快捷键{{{
nnoremap dL d$
nnoremap dH d^
nnoremap cL c$
nnoremap cH c^
nnoremap yL y$
nnoremap yH y^
"}}}

nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j


nnoremap - ddp
nnoremap _ ddkP

" for smooth windows swtich
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>

" greatest remap ever, 选中并粘贴yank寄存器
vnoremap <leader>p "_dP

"(after copy a word) replace a word
nnoremap <leader>p viwp
" modify VIMRC faster
nnoremap <leader>mv :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :w<cr> :source $MYVIMRC<cr>

" fast warp quote on word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" i"<esc>gva"<esc>

" quick exit insert mode mode
inoremap jk <esc>
inoremap <esc> <nop>

nnoremap <leader>n :<c-u>nohlsearch<cr><c-l>

" set comma and dot as new change start
"inoremap . .<c-g>u
"inoremap , ,<c-g>u

" Moving text
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv
inoremap <c-j> <esc>:m .+1<CR>==i
inoremap <c-k> <esc>:m .-2<CR>==i
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==

" Git op / vim-fugitive mapping
nnoremap <leader>gh :diffget //3<cr>
nnoremap <leader>gu :diffget //2<cr>
nnoremap <leader>gs :G<cr>

" 全选映射
nnoremap <leader>sa ggVG

" 避免缩紧丢失选区
vnoremap < <gv
vnoremap > >gv

" 用一个与u联系比较强的键表示重做
nnoremap U <c-r>

" 删除行尾空格
nmap <silent> <leader><Space><Space> :%s/\s\+$//<cr>

" buffer 操作
" 切换到上一个buffer
nnoremap <leader><tab> :b#<cr>
" 前后切换buffer
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
" 指定名字切换buffer
nnoremap <leader>bb :buffers<cr>:b<space>

" Save & quit
noremap Q :q<CR>
noremap S :w<CR>

" NOTE: do NOT use `nore` mappings
" popup
nmap <Leader>ts <Plug>(coc-translator-p)
vmap <Leader>ts <Plug>(coc-translator-pv)
" echo
nmap <Leader>e <Plug>(coc-translator-e)
vmap <Leader>e <Plug>(coc-translator-ev)

nnoremap <leader>e :CocCommand explorer<cr>
"}}}


" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" Color scheme --------------{{{
colorscheme onedark
syntax on
highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey
"let g:onedark_termcolors=16

" 使用iTerm2，支持24bit color, 开启这个功能
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
"}}}

" vim-airline settings ---------{{{
let g:airline#extensions#tabline#enabled = 1
" }}}

" import other config ---{{{
for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
    exe 'source' f
endfor
"}}}---
