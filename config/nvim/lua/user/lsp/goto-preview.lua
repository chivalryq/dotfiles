local status_ok, goto_preview = pcall(require, "goto-preview")
if not status_ok then
	return
end

goto_preview.setup({})

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "K", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", opts)
keymap("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", opts)
keymap("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<cr>", opts)
keymap("n", "R", "<cmd>lua require('goto-preview').goto_preview_references()<cr>", opts)
