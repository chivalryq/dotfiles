-- vim.o global options
-- vim.bo window options
-- vim.bo buffer options
vim.o.encoding='UTF-8'
vim.bo.expandtab=false
vim.o.expandtab=false
vim.bo.shiftwidth=4
vim.o.shiftwidth=4
vim.bo.tabstop=4
vim.o.tabstop=4

vim.o.updatetime=100
vim.o.autowrite=true
vim.o.clipboard='unnamed'
vim.o.hidden=true
vim.o.hlsearch=true
vim.o.ignorecase=true
vim.o.incsearch=true
vim.o.errorbells=false
vim.o.scrolloff=8

vim.wo.number=true
vim.wo.relativenumber=true
vim.wo.signcolumn='yes'

vim.g.mapleader=' '


-- keymapping {{{
local keymap = vim.api.nvim_set_keymap
local opts ={noremap= true,silent=true}

keymap('n','H' ,'^',opts)
keymap('n','L', '$',opts)

-- H和L的无敌快捷键
keymap('n','dL', 'd$',opts)
keymap('n','dH', 'd^',opts)
keymap('n','cL', 'c$',opts)
keymap('n','cH', 'c^',opts)
keymap('n','yL', 'y$',opts)
keymap('n','yH', 'y^',opts)
-- idea from hrsh7th
keymap('n','<C-h>', '<C-o>0zz',opts)
keymap('n','<C-l>', '<C-i>0zz',opts)
keymap('i','<C-h>', '<Left>',opts)
keymap('i','<C-l>', '<Right>',opts)

keymap('n','k', 'gk',opts)
keymap('n','j', 'gj',opts)
keymap('n','gk', 'k',opts)
keymap('n','gj', 'j',opts)

keymap('n','-', 'ddp',opts)
keymap('n','_', 'ddkP',opts)

-- for smooth windows swtich
keymap('n','<leader>j', ':wincmd j<cr>',opts)
keymap('n','<leader>k', ':wincmd k<cr>',opts)
keymap('n','<leader>h', ':wincmd h<cr>',opts)
keymap('n','<leader>l', ':wincmd l<cr>',opts)

-- greatest remap ever, 选中并粘贴yank寄存器
keymap('v','<leader>p', '_dP',opts)

--(after copy a word) replace a word
keymap('n','<leader>p', 'viwp',opts)

-- modify VIMRC faster
keymap('n','<leader>mv', ':vsplit $MYVIMRC<cr>',opts)
keymap('n','<leader>sv', ':w<cr> :source $MYVIMRC<cr>',opts)

-- fast warp quote on word
keymap('n','<leader>"', 'viw<esc>a"<esc>hbi"<esc>lel',opts)
keymap('n','<leader>\'', 'viw<esc>a\'<esc>hbi\'<esc>lel',opts)
keymap('v','<leader>"','i"<esc>gva"<esc>',opts)

-- quick exit insert mode mode
keymap('i','jk', '<esc>',opts)
keymap('i','<esc>', '',opts)


keymap('n','<leader>n', ':<c-u>nohlsearch<cr><c-l>',opts)

-- set comma and dot as new change start
keymap('i','.', '.<c-g>u',opts)
keymap('i',',', ',<c-g>u',opts)

-- Moving text
keymap('n','<c-j>', ':m .+1<CR>==',opts)
keymap('n','<c-k>', ':m .-2<CR>==',opts)

-- Git op / vim-fugitive mapping
keymap('n','<leader>gh', ':diffget //3<cr>',opts)
keymap('n','<leader>gu', ':diffget //2<cr>',opts)
keymap('n','<leader>gs', ':G<cr>',opts)


-- 避免缩进丢失选区
keymap('v','<', '<gv',opts)
keymap('v','>', '>gv',opts)

-- 用一个与u联系比较强的键表示重做
keymap('n','U', '<c-r>',opts)

-- 删除行尾空格
-- keymap('n','<leader><Space><Space>', ":%s/\\s\+$//<cr>",opts) 

-- buffer 操作
-- 切换到上一个buffer
keymap('n','<leader><tab>', ':b#<cr>',opts)
-- 前后切换buffer
keymap('n', '<tab>', ':if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>',opts)
keymap('n', '<s-tab>', ':if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>',opts)
-- 指定名字切换buffer
keymap('n','<leader>bb', ':buffers<cr>:b<space>',opts)

-- Save & quit
keymap('n','Q', ':q<CR>',opts)
keymap('n','S', ':w<CR>',opts)

-- tree
keymap('n','<leader>e',':NvimTreeToggle<cr>',opts)



-- keys for quickfix bar, for faster code/compile/code circle
keymap('n','<leader>i', ':cprevious<cr>',opts)
keymap('n','<leader>o', ':cnext<cr>',opts)
keymap('n','<leader>a', ':cclose<cr>',opts)

keymap('n','<leader>u', ':PackerSync<cr>',opts)


-- Plugins {{{
-- automatically setup packer when first start
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'tpope/vim-sensible'
	use 'junegunn/seoul256.vim'
	use 'godlygeek/tabular'

	use 'iamcco/mathjax-support-for-mkdp'
	use 'iamcco/markdown-preview.vim'
	use 'tpope/vim-fugitive'
	use 'vim-airline/vim-airline'
	--use 'vim-airline/vim-airline-themes'
	use 'joshdick/onedark.vim'
	use 'fatih/vim-go'--, { 'do': ':GoUpdateBinaries' }
	--use {'neoclide/coc.nvim', branch = 'release'}
	use 'junegunn/fzf'--, { 'do': { -> fzf#install() } }
	use 'honza/vim-snippets'
	use 'preservim/nerdcommenter'
	use 'AndrewRadev/splitjoin.vim'
	use 'AndrewRadev/switch.vim'
	use 'ctrlpvim/ctrlp.vim' -- Now only for GoDecls and GoDeclsDir
	use 'universal-ctags/ctags'
	use 'voldikss/vim-floaterm'
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use { 'goolord/alpha-nvim' }

	-- completion plugins
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin

	-- LSP
	use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
	use 'onsails/lspkind-nvim' -- Icons for completion list
	use 'tami5/lspsaga.nvim' -- for more lsp feature
	use 'williamboman/nvim-lsp-installer' -- Simple to use language server

	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		config = function()
			require'nvim-tree'.setup { }
		end
	}
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
	}
	use 'windwp/nvim-autopairs'

	--always the latest
	use 'ryanoasis/vim-devicons'


	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)


-- file fold settings {{{
vim.cmd([[
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
]])


-- Color scheme {{{
vim.o.termguicolors = true
vim.cmd [[silent! colorscheme onedark]]
-- vim.g.colors_name=onedark
vim.cmd([[
	syntax on
	highlight Normal ctermbg=None
	highlight LineNr ctermfg=DarkGrey
]])

vim.cmd([[
if (empty($TMUX))
if (has("nvim"))
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
endif
]])

-- vim-go settings {{{
--vim.g.go_fmt_autosave = 1
--vim.g.go_fmt_command = "goimports"
--vim.g.go_doc_popup_window = 1
--vim.g.go_auto_type_info = 1
--vim.g.go_auto_sameids = 1

--vim.cmd([[
--autocmd FileType go let b:go_fmt_options = {
--\ 'goimports': '-local ' .
--\ trim(system('{cd '. shellescape(expand('%:h')) .' && go list -m;}')),
--\ }

--autocmd FileType go nmap <leader>b  <Plug>(go-build)
--autocmd FileType go nmap <leader>r  <Plug>(go-run)

--" open _test.go file with :Ax command
--autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
--autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
--autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
--autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
--]])

--vim.g.go_list_type='quickfix'

-- import other config with old method 
vim.cmd([[
for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
exe 'source' f
endfor
]])

-- Airline settings
vim.cmd([[
let g:airline#extensions#tabline#enabled = 1
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
]])


-- Import other files
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/user/plugins', [[v:val =~ '\.lua$']])) do
  require('user.plugins.'..file:gsub('%.lua$', ''))
end

require("user.lsp")

