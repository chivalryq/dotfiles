-- local health = require("health")
local fn = vim.fn

-- automatically install packer
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

	use("nvim-neotest/nvim-nio")

	use("iamcco/mathjax-support-for-mkdp")
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
		ft = { "markdown" },
	})
	use("tpope/vim-fugitive")
	use("nvim-lualine/lualine.nvim")
	-- use("joshdick/onedark.vim")
	use { "catppuccin/nvim", as = "catppuccin" }
	-- use("fatih/vim-go") --, { 'do': ':GoUpdateBinaries' }
	--use {'neoclide/coc.nvim', branch = 'release'}
	use("junegunn/fzf") --, { 'do': { -> fzf#install() } }
	use("honza/vim-snippets")
	use("preservim/nerdcommenter")
	use("AndrewRadev/splitjoin.vim")
	use("AndrewRadev/switch.vim")
	use("ctrlpvim/ctrlp.vim")   -- Now only for GoDecls and GoDeclsDir
	use("universal-ctags/ctags")
	use("voldikss/vim-floaterm") -- Float terminal in nvim
	-- Find files/grep/
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use { 'nvim-telescope/telescope-fzf-native.nvim', run =
	'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
	use { "nvim-telescope/telescope-dap.nvim" }

	-- highlight, indent.. based on syntax
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")

	use({ "goolord/alpha-nvim" }) -- start page

	-- completion plugins
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	--use("uga-rosa/cmp-dictionary")
	use("ray-x/cmp-treesitter")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin

	-- LSP
	use("neovim/nvim-lspconfig")          -- Collection of configurations for built-in LSP client
	use("onsails/lspkind-nvim")           -- Icons for completion list
	use("jose-elias-alvarez/null-ls.nvim") -- formmatter and linter
	-- use("williamboman/nvim-lsp-installer") -- Simple to use language server
	use {
		"williamboman/mason.nvim",
		run = ":MasonUpdate" -- :MasonUpdate updates registry contents
	}
	use {
		"williamboman/mason-lspconfig.nvim"
	}

	use("rmagatti/goto-preview") -- Better definition/implement preview
	use("ray-x/lsp_signature.nvim")
	use({
		'ray-x/navigator.lua',
		requires = {
			{ 'ray-x/guihua.lua',     run = 'cd lua/fzy && make' },
			{ 'neovim/nvim-lspconfig' },
		},
	})
	use("simrat39/symbols-outline.nvim") -- Show syntax outline of file
	use {
		"zbirenbaum/copilot.lua",
	}
	use {
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	}


	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("nvim-tree").setup({
				hijack_cursor = true,
				update_focused_file = {
					enable = true,
					update_cwd = true,
					ignore_list = {},
				},
				filters = {
					dotfiles = true,
				},
			})
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use("windwp/nvim-autopairs")
	use({
		"L3MON4D3/LuaSnip",
		requires = "rafamadriz/friendly-snippets",
		config = function()
			require("user.snippets")
		end,
	})
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup()
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
	use({
		"ur4ltz/surround.nvim",
		config = function()
			require("surround").setup({ mappings_style = "sandwich" })
		end,
	})
	use("andrewstuart/vim-kubernetes")
	use("moll/vim-bbye")
	use("christoomey/vim-tmux-navigator")

	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	-- Debug
	use('mfussenegger/nvim-dap')
	use('leoluz/nvim-dap-go')
	use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
	-- recommended by nvim-dap-ui to integrate
	use { "folke/neodev.nvim" }
	use('theHamsta/nvim-dap-virtual-text')
	use 'mortepau/codicons.nvim'

	-- Folding
	use { 'kevinhwang91/nvim-ufo', requires = { 'kevinhwang91/promise-async', "luukvbaal/statuscol.nvim" } }
	use { "anuvyklack/fold-preview.nvim", requires = "anuvyklack/keymap-amend.nvim" }

	--always the latest
	--use("ryanoasis/vim-devicons")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
