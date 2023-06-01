
--require('telescope').setup{
  --defaults = {
    ---- Default configuration for telescope goes here:
		--layout_config = {
			--horizontal = { prompt_position = "bottom", results_width = 0.6 },
			--vertical = { mirror = false },
		--},
		--border = {},
		--borderchars = {
			--"─",
			--"│",
			--"─",
			--"│",
			--"╭",
			--"╮",
			--"╯",
			--"╰",
		--},
		--color_devicons = true,
		--use_less = true,
		--set_env = { ["COLORTERM"] = "truecolor" },
		--path_display = { "absolute" },
		--mappings = {
			--i = {
        ---- map actions.which_key to <C-h> (default: <C-/>)
        ---- actions.which_key shows the mappings for your picker,
        ---- e.g. git_{create, delete, ...}_branch for the git_branches picker
        --["<C-h>"] = "which_key",
		--['<C-k>']="move_selection_previous",
		--['<C-j>']="move_selection_next"
      --}
    --}
  --},
  --pickers = {

    ---- builtin picker
  --},
  --extensions = {
    ---- Your extension configuration goes here:
    ---- extension_name = {
    ----   extension_config_key = value,
    ---- }
    ---- please take a look at the readme of the extension you want to configure
  --}
--}

-- Telescope configuration
local map = vim.keymap.set
local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
local use_layout = require('user.plugins.telescope.layouts')

vim.cmd([[
  highlight link FloatBorder WinSeparator
  highlight link TelescopePromptCounter TelescopeNormal
  highlight link TelescopeSelection TelescopePromptPrefix
]])

telescope.setup({
  defaults = {
    border = true,
    prompt_title = false,
    results_title = false,
    color_devicons = false,
    layout_strategy = 'horizontal',
    borderchars = {
      prompt  = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    },
    layout_config = {
      bottom_pane = {
        height = 20,
        preview_cutoff = 120,
        prompt_position = 'top'
      },
      center = {
        height = 0.4,
        preview_cutoff = 40,
        prompt_position = 'top',
        width = 0.7
      },
      horizontal = {
        prompt_position = 'top',
        preview_cutoff = 40,
        height = 0.9,
        width = 0.8
      }
    },
    sorting_strategy = 'ascending',
    prompt_prefix = ' ',
    selection_caret = ' → ',
    entry_prefix = '   ',
    file_ignore_patterns = {'node_modules', 'build'},
    path_display = { 'truncate' },
    preview = {
      treesitter = {
        enable = {
          'css', 'dockerfile', 'elixir', 'erlang', 'fish',
          'html', 'http', 'javascript', 'json', 'lua', 'php',
          'python', 'regex', 'ruby', 'rust', 'scss', 'svelte',
          'typescript', 'vue', 'yaml', 'markdown', 'bash', 'c',
          'cmake', 'comment', 'cpp', 'dart', 'go', 'jsdoc',
          'json5', 'jsonc', 'llvm', 'make', 'ninja', 'prisma',
          'proto', 'pug', 'swift', 'todotxt', 'toml', 'tsx',
        }
      }
    },
    mappings = {
      i = {
        ['<esc>'] = require('telescope.actions').close,
        ['<C-l>'] = require('telescope.actions').smart_send_to_loclist,
        ['<C-q>'] = require('telescope.actions').smart_send_to_qflist,
      },
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = 'smart_case',        -- options: 'ignore_case', 'respect_case'
    }
  }
})

telescope.load_extension('fzf')
telescope.load_extension('dap')

local set_keymap = function(lhs, rhs, mode)
  map(mode or 'n', lhs, rhs, { noremap = true })
end

set_keymap('<leader>h', use_layout(telescope_builtin.help_tags,   'popup_extended'))
set_keymap('<leader>q', use_layout(telescope_builtin.quickfix,    'ivy_plus'))
set_keymap('<leader>l', use_layout(telescope_builtin.loclist,     'ivy_plus'))
set_keymap('<leader>t', use_layout(telescope_builtin.builtin,     'popup_list'))
set_keymap('<leader>o', use_layout(telescope_builtin.find_files,  'popup_list'))
set_keymap('<leader>k', use_layout(telescope_builtin.keymaps,      'popup_list'))
set_keymap('<leader>p', use_layout(telescope_builtin.commands,    'command_pane'))
set_keymap('<leader>b', use_layout(telescope_builtin.buffers,     'popup_extended'))
set_keymap('<leader>g', use_layout(telescope_builtin.git_status,  'popup_extended'))
set_keymap('<leader>f', use_layout(telescope_builtin.grep_string, 'popup_extended'), 'v')
set_keymap('<leader>f', use_layout(telescope_builtin.live_grep,   'popup_extended'))
--set_keymap('<leader>f', use_layout(telescope.extensions.live_grep_args.live_grep_args,  'popup_extended'))
--
local dap = telescope.extensions.dap
set_keymap('<leader>d',  use_layout(dap.commands,         'popup_list'))
set_keymap('<leader>dc', use_layout(dap.configurations,   'popup_list'))
set_keymap('<leader>db', use_layout(dap.list_breakpoints, 'popup_list'))
set_keymap('<leader>dv', use_layout(dap.variables,        'popup_list'))
set_keymap('<leader>df', use_layout(dap.frames,           'popup_list'))

return use_layout;
