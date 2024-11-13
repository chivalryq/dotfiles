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

keymap("n", "gs", function() vscode.action("workbench.files.action.focusFilesExplorer") end, opts)

local vscode = require('vscode')
keymap("n", "<leader>rn", function() vscode.action("editor.action.rename") end, opts)


-- debug related
keymap("n", "<leader>de", function() vscode.action("workbench.action.debug.start") end, opts)
keymap("n", "<leader>x", function() vscode.action("workbench.action.debug.stop") end, opts)
keymap("n", "<leader>g", function() vscode.action("workbench.action.debug.continue") end, opts)
keymap("n", "<leader>o", function() vscode.action("workbench.action.debug.stepOver") end, opts)
keymap("n", "<leader>i", function() vscode.action("workbench.action.debug.stepInto") end, opts)
keymap("n", "<leader>t", function() vscode.action("workbench.action.debug.stepOut") end, opts)
keymap("n", "<leader>b", function() vscode.action("editor.debug.action.toggleBreakpoint") end, opts)
