--display config
vim.opt.number      = true           --行番号表示
vim.opt.showcmd     = true           --入力中のコマンドをステータスに表示
vim.opt.wildmenu    = true           --コマンドモードの補完
vim.opt.showmatch   = true           --括弧の対応表示
vim.opt.matchtime   = 1              --showmatchの表示時間
vim.opt.ruler       = true           --カーソル位置表示

--tab config
vim.opt.showtabline = 1
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.api.nvim_set_keymap('n', '<C-d>', ':tabclose <CR>', { noremap = true })

--editor config
vim.opt.swapfile = false
vim.opt.smartindent = true
vim.api.nvim_set_keymap('n', 'H', '^', { noremap = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'J', '5gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', 'K', '5gk', { noremap = true })
vim.api.nvim_set_keymap('n', 'L', '$', { noremap = true })
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {silent=true})

vim.api.nvim_set_keymap('i', '<C-Space>', '<ESC>', {silent=true})

--encoding config
--vim.opt.encoding    = 'uft-8'
vim.opt.fileencoding = 'uft-8'

--requier for yash
vim.opt.termguicolors = true

--clipboard config
vim.opt.clipboard   = "unnamedplus"

--search config
vim.opt.ignorecase  = true
vim.opt.smartcase = true
vim.opt.wrapscan = true

-- undo永続化
vim.opt.undofile = true;

--windows用ファイル設定
vim.opt.fileformats = {'unix', 'dos', 'mac'}

