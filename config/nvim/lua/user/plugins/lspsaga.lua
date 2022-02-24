local saga = require 'lspsaga'
saga.init_lsp_saga()


local keymap = vim.api.nvim_set_keymap
local opts ={noremap= true,silent=true}
keymap('n','gh' ,':Lspsaga lsp_finder<CR>',opts)
keymap('n','<leader>ca' ,':Lspsaga code_action<CR>',opts)
keymap('v','<leader>ca' ,':Lspsaga range_code_action<CR>',opts)
--keymap('n','K',':Lspsaga preview_definition<CR>',opts
