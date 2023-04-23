--colorscheme------------------------------------------------------------
vim.cmd[[colorscheme yash]]

--lightline----------------------------------------------------------------
vim.g['lightline'] = {
    colorscheme = 'wombat',
    active = {
        left = { { 'mode', 'paste' }, { 'readonly', 'filename', 'modified' } }
    },
    component = {
        filename = '%F'
    },
}


--tree-sitter--------------------------------------------------------------
require('nvim-treesitter.configs').setup {
    ensure_installed = { 'go', 'lua', 'typescript', 'javascript' },
    highlight = { enable = true },
    indent = { enable = true }
}

--bufferline
require("bufferline").setup{}


