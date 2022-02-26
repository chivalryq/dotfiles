vim.g.mapleader=' '

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
--vim.g.go_fmt_autosave = 0
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

require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.lsp"
