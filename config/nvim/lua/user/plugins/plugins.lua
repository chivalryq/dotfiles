local health = require("health")
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("tpope/vim-sensible")
	use("junegunn/seoul256.vim")
	use("godlygeek/tabular")

	use("iamcco/mathjax-support-for-mkdp")
	use("iamcco/markdown-preview.vim")
	use("tpope/vim-fugitive")
	use("vim-airline/vim-airline")
	use("joshdick/onedark.vim")
	--use 'fatih/vim-go'--, { 'do': ':GoUpdateBinaries' }
	--use {'neoclide/coc.nvim', branch = 'release'}
	use("junegunn/fzf") --, { 'do': { -> fzf#install() } }
	use("honza/vim-snippets")
	use("preservim/nerdcommenter")
	use("AndrewRadev/splitjoin.vim")
	use("AndrewRadev/switch.vim")
	use("ctrlpvim/ctrlp.vim") -- Now only for GoDecls and GoDeclsDir
	use("universal-ctags/ctags")
	use("voldikss/vim-floaterm") -- Float terminal in nvim
	-- Find files/grep/
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- highlight, indent.. based on syntax
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("andymass/vim-matchup") -- Better match up like %

	use({ "goolord/alpha-nvim" }) -- start page

	-- completion plugins
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("ray-x/cmp-treesitter")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin

	-- LSP
	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
	use("onsails/lspkind-nvim") -- Icons for completion list
	use("jose-elias-alvarez/null-ls.nvim") -- formmatter and linter
	use("tami5/lspsaga.nvim") -- for more lsp feature
	use("williamboman/nvim-lsp-installer") -- Simple to use language server
	use("rmagatti/goto-preview") -- Better definition/implement preview
	use({ "ray-x/lsp_signature.nvim" })

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use("windwp/nvim-autopairs")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})
	use("pseewald/vim-anyfold")
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	-- substitutes for easyMotion
	use({
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})
	use("dstein64/vim-startuptime")
	use({ "lewis6991/impatient.nvim", config = function() end })

	--always the latest
	use("ryanoasis/vim-devicons")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
