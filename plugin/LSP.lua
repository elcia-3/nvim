--LSP--
require("mason").setup()
require("mason-lspconfig").setup()

local nvim_lsp = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

mason_lspconfig.setup_handlers({
    function(server_name)
        local opts = {}

        if server_name == "jdtls" then
            opts.capabilities = capabilities
            opts.cmd = {
                "java",
                "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                "-Dosgi.bundles.defaultStartLevel=4",
                "-Declipse.product=org.eclipse.jdt.ls.core.product",
                "-Dlog.protocol=true",
                "-Dlog.level=ALL",
                "-Xms1g",
                "--add-modules=ALL-SYSTEM",
                "--add-opens", "java.base/java.util=ALL-UNNAMED",
                "--add-opens", "java.base/java.lang=ALL-UNNAMED",
                "-jar", "C:\\Java\\jdt-language-server-1.14.0\\plugins\\org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
                "-configuration", "C:\\Java\\jdt-language-server-1.14.0\\config_win",
                "-data", vim.loop.os_homedir() .. "\\workspace"
            }
        end

        if server_name == "sumneko_lua" then
            opts.settings = {
                Lua = {
                    diagnostics = {
                        globals = {"vim"},
                    },
                },
            }
        end

        nvim_lsp[server_name].setup(opts)
    end
})

nvim_lsp.rust_analyzer.setup{capabilities = capabilities}
nvim_lsp.gopls.setup{capabilities = capabilities}
nvim_lsp.clangd.setup{capabilities = capabilities}
nvim_lsp.html.setup{capabilities = capabilities}
nvim_lsp.cssls.setup{capabilities = capabilities}
nvim_lsp.tsserver.setup{capabilities = capabilities}
nvim_lsp.jsonls.setup{capabilities = capabilities}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = false,
        underline = true,
        signs = true,
    }
)

vim.cmd [[
set updatetime=200
autocmd CursorHold * lua vim.diagnostic.open_float(0, {scope="line", focus=false})

sign define DiagnosticSignError text= texthl= linehl=DiagnosticLineError numhl=DiagnosticLineNrError
sign define DiagnosticSignWarn text= texthl= linehl=DiagnosticLineWarn numhl=DiagnosticLineNrWarn
sign define DiagnosticSignHint text= texthl= linehl=DiagnosticLineHint numhl=DiagnosticLineNrHint
sign define DiagnosticSignInfo text= texthl= linehl=DiagnosticLineInfo numhl=DiagnosticLineNrInfo
]]

--nvim-cmp--
-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-l>'] = cmp.mapping.select_prev_item(),
        ['<C-y>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'vsnip' }, -- For vsnip users.
        { name = 'nvim_lsp' },
    }, {
            { name = 'buffer' },
        })
})



-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
            { name = 'cmdline' }
        })
})


