local keymap = vim.api.nvim_set_keymap
local opts ={noremap= true,silent=true}

keymap('n','H' ,'^',opts)
keymap('n','L', '$',opts)

-- H和L的无敌快捷键
keymap('n','dL', 'd$',opts)
keymap('n','dH', 'd^',opts)
keymap('n','cL', 'c$',opts)
keymap('n','cH', 'c^',opts)
keymap('n','yL', 'y$',opts)
keymap('n','yH', 'y^',opts)
-- idea from hrsh7th
keymap('n','<C-h>', '<C-o>0zz',opts)
keymap('n','<C-l>', '<C-i>0zz',opts)
keymap('i','<C-h>', '<Left>',opts)
keymap('i','<C-l>', '<Right>',opts)

keymap('n','k', 'gk',opts)
keymap('n','j', 'gj',opts)
keymap('n','gk', 'k',opts)
keymap('n','gj', 'j',opts)

keymap('n','-', 'ddp',opts)
keymap('n','_', 'ddkP',opts)

-- for smooth windows swtich
keymap('n','<leader>j', ':wincmd j<cr>',opts)
keymap('n','<leader>k', ':wincmd k<cr>',opts)
keymap('n','<leader>h', ':wincmd h<cr>',opts)
keymap('n','<leader>l', ':wincmd l<cr>',opts)

-- greatest remap ever, 选中并粘贴yank寄存器
keymap('v','<leader>p', '_dP',opts)

--(after copy a word) replace a word
keymap('n','<leader>p', 'viwp',opts)

-- modify VIMRC faster
keymap('n','<leader>mv', ':vsplit $MYVIMRC<cr>',opts)
keymap('n','<leader>sv', ':w<cr> :source $MYVIMRC<cr>',opts)

-- fast warp quote on word
keymap('n','<leader>"', 'viw<esc>a"<esc>hbi"<esc>lel',opts)
keymap('n','<leader>\'', 'viw<esc>a\'<esc>hbi\'<esc>lel',opts)
keymap('v','<leader>"','i"<esc>gva"<esc>',opts)

-- quick exit insert mode mode
keymap('i','jk', '<esc>',opts)
keymap('i','<esc>', '',opts)


keymap('n','<leader>n', ':<c-u>nohlsearch<cr><c-l>',opts)

-- set comma and dot as new change start
keymap('i','.', '.<c-g>u',opts)
keymap('i',',', ',<c-g>u',opts)

-- Moving text
keymap('n','<c-j>', ':m .+1<CR>==',opts)
keymap('n','<c-k>', ':m .-2<CR>==',opts)

-- Git op / vim-fugitive mapping
keymap('n','<leader>gh', ':diffget //3<cr>',opts)
keymap('n','<leader>gu', ':diffget //2<cr>',opts)
keymap('n','<leader>gs', ':G<cr>',opts)


-- 避免缩进丢失选区
keymap('v','<', '<gv',opts)
keymap('v','>', '>gv',opts)

-- 用一个与u联系比较强的键表示重做
keymap('n','U', '<c-r>',opts)

-- 删除行尾空格
keymap('n','<leader><Space><Space>', ":%s/\\s\\+$//<cr>",opts)

-- buffer 操作
-- 切换到上一个buffer
keymap('n','<leader><tab>', ':b#<cr>',opts)
-- 前后切换buffer
keymap('n', '<tab>', ':if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>',opts)
keymap('n', '<s-tab>', ':if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>',opts)
-- 指定名字切换buffer
keymap('n','<leader>bb', ':buffers<cr>:b<space>',opts)

-- Save & quit
keymap('n','Q', ':q<CR>',opts)
keymap('n','S', ':w<CR>',opts)

-- tree
keymap('n','<leader>e',':NvimTreeToggle<cr>',opts)



-- keys for quickfix bar, for faster code/compile/code circle
keymap('n','<leader>i', ':cprevious<cr>',opts)
keymap('n','<leader>o', ':cnext<cr>',opts)
keymap('n','<leader>a', ':cclose<cr>',opts)

keymap('n','<leader>u', ':PackerSync<cr>',opts)
