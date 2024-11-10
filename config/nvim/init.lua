require("user.options")

if vim.g.vscode then
	require("user.vscode_keymap")
else
	require("user.keymaps")
	require("user.colorscheme")

	-- require("user.plugins.plugins")
	require("user.plugins")
	-- use impatient to speedup start
	--require("impatient")

	require("user.lsp")
end
