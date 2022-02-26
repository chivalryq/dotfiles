-- Color scheme {{{
vim.o.termguicolors = true
vim.cmd([[silent! colorscheme onedark]])
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
