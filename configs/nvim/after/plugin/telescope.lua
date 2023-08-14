local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>ls', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<C-s>', function()
	builtin.live_grep({
            -- default_text = vim.fn.expand('<cword>'),
            -- search_dirs = {"./**"},
            -- use_regex = "true"
        });
end)
vim.keymap.set('n', '<leader>ws', function ()
    builtin.lsp_dynamic_workspace_symbols({
            default_text = vim.fn.expand('<cword>'),

        });
end, {})
-- LSP
vim.keymap.set('n', '<leader>qf', function ()
    vim.cmd "ccl"
    builtin.quickfix({

        });
end, {})
vim.keymap.set('n', '<leader>qfh', function ()
    builtin.quickfixhistory({

        });
end, {})


local actions = require "telescope.actions"

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
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
