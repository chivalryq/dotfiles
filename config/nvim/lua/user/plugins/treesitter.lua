local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	sync_install = true,
	ensure_installed = { "go", "vim", "yaml", "lua", "json", "gomod", "gowork", "bash", "dockerfile" },
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-w>",
			node_incremental = "<C-w>",
			scope_incremental = "grc", -- not used
			node_decremental = "<C-s>",
		},
	},
	textobjects = {
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},
})

vim.cmd([[
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
	set foldnestmax=3
]])
