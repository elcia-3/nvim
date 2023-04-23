vim.keymap.set('n', '<C-g>', require('telescope.builtin').live_grep, {})
vim.api.nvim_set_keymap('n', '<tab>', ':Telescope file_browser dir_icon=<CR>', { noremap = true })
require('telescope').setup {
    defaults = {
        prompt_prefix = '  ',
        dynamic_preview_title = true,
        borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
        entry_prefix = '  ',
        selection_caret = ' ',
        selection_strategy = 'reset',
        sorting_strategy = "ascending",
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
                prompt_position = 'top',
            },
        },
    },
    extensions = {
        file_browser = {
            initial_mode = 'normal',
            hijack_netrw = true,
            hidden = true,
            hide_parent_dir = true,
            mappings = {
                ['i'] = {
                },
                ['n'] = {
                    ['<tab>'] = require "telescope.actions".close,
                    ['<CR>'] = require "telescope.actions".select_tab,
                    ['l'] = require "telescope.actions".select_default,
                    ['h'] = require "telescope".extensions.file_browser.actions.goto_parent_dir,
                },
            },
        },
    },
}

vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#2E323C', bold = true })
vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = '#222426' })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = '#272a30', fg = '#B1B1B1' })
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = '#B1B1B1' })
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = '#B1B1B1' })

require('telescope').load_extension 'file_browser'


