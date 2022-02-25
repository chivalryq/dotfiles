require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
		prompt_prefix = "🔭 ",
		selection_caret = " ",
		layout_config = {
			horizontal = { prompt_position = "bottom", results_width = 0.6 },
			vertical = { mirror = false },
		},
		border = {},
		borderchars = {
			"─",
			"│",
			"─",
			"│",
			"╭",
			"╮",
			"╯",
			"╰",
		},
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" },
		path_display = { "absolute" },
		mappings = {
			i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
		['<C-k>']="move_selection_previous",
		['<C-j>']="move_selection_next"
      }
    }
  },
  pickers = {

    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

local keymap = vim.api.nvim_set_keymap
local opts ={noremap= true,silent=true}


keymap('n','<leader>fb' ,":Telescope find_files<cr>",opts)
keymap('n','<leader>fs' ,":Telescope treesitter<cr>",opts)
keymap('n','<leader>fg' ,":Telescope live_grep<cr>",opts)
keymap('n','<leader>fr' ,":Telescope lsp_references theme=cursor<cr>",opts)
keymap('n','<leader>fa' ,":Telescope autocommands<cr>",opts)
keymap('n','<leader>fo' ,":Telescope vim_options<cr>",opts)
keymap('n','<leader>ff' ,":Telescope current_buffer_fuzzy_find<cr>",opts)
