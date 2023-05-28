vim.opt.encoding = "UTF-8"
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.updatetime = 100
vim.opt.autowrite = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.errorbells = false
vim.opt.scrolloff = 8
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.guifont = "JetBrains_Mono:h18" -- adjust font size in irenvim

vim.g.mkdp_browser = "/System/Volumes/Data/Applications/Microsoft Edge.app"
vim.g.mkdp_auto_start = 1
vim.g.mkdp_auto_close = 1

-- use ufo to fold, some constructions from ufo
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
