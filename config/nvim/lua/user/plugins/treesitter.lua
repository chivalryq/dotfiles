local status_ok, configs = pcall(require,"nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {
	sync_install = true,
	ensure_installed={'go','vim','yaml','lua','json','gomod','gowork','bash','dockerfile'},
	highlight = {
		enable = true,
	},
	indent={
		enable=true
	}
}

vim.cmd([[
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
	set foldnestmax=3
]])

