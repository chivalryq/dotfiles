vim.g.mapleader=' '




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
	use 'ray-x/cmp-treesitter'
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
	use 'L3MON4D3/LuaSnip'

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

require('user.lsp')
require('user.options')
require('user.keymaps')
