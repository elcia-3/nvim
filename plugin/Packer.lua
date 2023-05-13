--packer.nvim--------------------------------------------------------------
local packer_bootstrap = function()
    local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

require('packer').init({
    display = {
        non_interactive = true
    }
})


require('packer').startup(function(use)
    --Packer
    use 'wbthomason/packer.nvim'

    --Theme
    use 'itchyny/lightline.vim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'akinsho/bufferline.nvim'
    use 'Kenbayashi/yash.nvim'

    --LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'

    use 'jose-elias-alvarez/null-ls.nvim'
    use 'WhoIsSethDaniel/mason-tool-installer.nvim'

    --LuaSnip
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    --Telescope
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use "nvim-telescope/telescope-frecency.nvim"
    use 'kkharji/sqlite.lua'


    --pop.nvim
    use {
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
      config = function()
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
    }

    --edit tools
    use 'cohama/lexima.vim'
    use 'vim-scripts/vim-auto-save'

    --go
    use 'fatih/vim-go'

    --etc
    use 'nvim-lua/plenary.nvim'
    use 'tpope/vim-fugitive'


    if packer_bootstrap then
        require('packer').sync()
    end
end)

