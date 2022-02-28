-- use anyfold for what I am developing
vim.cmd([[
augroup anyfold
  autocmd!
  autocmd Filetype * AnyFoldActivate
augroup END
]])
