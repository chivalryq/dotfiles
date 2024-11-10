local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

local vscode = require('vscode')
keymap("n", "<leader>rn", function() vscode.action("editor.action.rename") end, opts)
keymap("n", "<leader>t", function() vscode.action("workbench.action.terminal.toggleTerminal") end, opts)

