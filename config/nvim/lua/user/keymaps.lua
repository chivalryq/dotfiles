vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Resize with arrows
keymap("n", "<C-S-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-S-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-S-Right>", ":vertical resize +2<CR>", opts)

-- H和L的无敌快捷键
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("n", "dL", "d$", opts)
keymap("n", "dH", "d^", opts)
keymap("n", "cL", "c$", opts)
keymap("n", "cH", "c^", opts)
keymap("n", "yL", "y$", opts)
keymap("n", "yH", "y^", opts)

-- move idea from hrsh7th
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-l>", "<Right>", opts)

keymap("n", "k", "gk", opts)
keymap("n", "j", "gj", opts)
keymap("n", "gk", "k", opts)
keymap("n", "gj", "j", opts)

keymap("n", "-", "ddp", opts)
keymap("n", "_", "ddkP", opts)

-- For smooth windows swtich
-- Basically this can move both inter and inner vim and tmux
-- See: https://github.com/christoomey/vim-tmux-navigator
vim.g.tmux_navigator_no_mappings = 1
keymap("n", "<c-j>", ":TmuxNavigateDown<cr>", opts)
keymap("n", "<c-k>", ":TmuxNavigateUp<cr>", opts)
keymap("n", "<c-h>", ":TmuxNavigateLeft<cr>", opts)
keymap("n", "<c-l>", ":TmuxNavigateRight<cr>", opts)

-- 粘贴不丢失寄存器
keymap("v", "p", '"_dP', opts)

--(after copy a word) replace a word
keymap("n", "<leader>p", "viwp", opts)

-- modify VIMRC faster
keymap("n", "<leader>mv", ":vsplit $MYVIMRC<cr>", opts)
keymap("n", "<leader>sv", ":w<cr> :source $MYVIMRC<cr>", opts)

-- fast warp quote on word
keymap("n", '<leader>"', 'viw<esc>a"<esc>hbi"<esc>lel', opts)
keymap("n", "<leader>'", "viw<esc>a'<esc>hbi'<esc>lel", opts)
keymap("v", '<leader>"', 'i"<esc>gva"<esc>', opts)

-- quick exit insert mode mode
keymap("i", "jk", "<esc>", opts)
keymap("i", "<esc>", "", opts)

keymap("n", "<leader>n", ":<c-u>nohlsearch<cr><c-l>", opts)

-- set comma and dot as new change start
keymap("i", ".", ".<c-g>u", opts)
keymap("i", ",", ",<c-g>u", opts)

--Moving text
--keymap("n", "<c-j>", ":m .+1<CR>==", opts)
--keymap("n", "<c-k>", ":m .-2<CR>==", opts)

-- Git op / vim-fugitive mapping
keymap("n", "<leader>gh", ":diffget //3<cr>", opts)
keymap("n", "<leader>gu", ":diffget //2<cr>", opts)
keymap("n", "<leader>gs", ":G<cr>", opts)

-- 避免缩进丢失选区
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- 用一个与u联系比较强的键表示重做
keymap("n", "U", "<c-r>", opts)

-- 删除行尾空格
keymap("n", "<leader><Space><Space>", ":%s/\\s\\+$//<cr>", opts)

-- buffer 操作
-- 切换到上一个buffer
keymap("n", "<leader><tab>", ":b#<cr>", opts)
-- 前后切换buffer
keymap("n", "<tab>", ":if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>", opts)
keymap("n", "<s-tab>", ":if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>", opts)
-- 指定名字切换buffer
keymap("n", "<leader>bb", ":buffers<cr>:b<space>", opts)

-- Go to tab by number
keymap("n", "<leader>1", "1gt", opts)
keymap("n", "<leader>2", "2gt", opts)
keymap("n", "<leader>3", "3gt", opts)
keymap("n", "<leader>4", "4gt", opts)
keymap("n", "<leader>5", "5gt", opts)
keymap("n", "<leader>6", "6gt", opts)
keymap("n", "<leader>7", "7gt", opts)
keymap("n", "<leader>8", "8gt", opts)
keymap("n", "<leader>9", "9gt", opts)
keymap("n", "<leader>0", ":tablast<cr>", opts)

-- Save & quit
keymap("n", "<c-q>", ":q<CR>", opts)
keymap("n", "Q", ":q<CR>", opts)
keymap("n", "S", ":w<CR>", opts)

-- tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- keys for quickfix bar, for faster code/compile/code circle
keymap("n", "<leader>i", ":cprevious<cr>", opts)
keymap("n", "<leader>o", ":cnext<cr>", opts)
keymap("n", "<leader>a", ":cclose<cr>", opts)

keymap("n", "<leader>u", ":PackerSync<cr>", opts)

-- start lazygit
keymap("n", "<leader>G", ":FloatermNew! lazygit<cr>", opts)
keymap("n", "<leader>R", ":FloatermNew! ranger<cr>", opts)

-- format code
keymap("n", "<leader>F", ":Format<cr>", opts)

-- Lua
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)

-- hop keymaps

keymap("n", "<leader><leader>w", ":lua require'hop'.hint_char2()<cr>", opts)
keymap("n", "<leader><leader>l", ":lua require'hop'.hint_lines()<cr>", opts)
keymap(
	"n",
	"f",
	":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
	opts
)
keymap(
	"n",
	"F",
	":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
	opts
)
keymap(
	"o",
	"f",
	":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
	opts
)
keymap(
	"o",
	"F",
	":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
	opts
)
keymap(
	"",
	"t",
	":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
	opts
)
keymap(
	"",
	"T",
	":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
	opts
)

keymap("n", "<leader>t", ":SymbolsOutline<cr>", opts)
