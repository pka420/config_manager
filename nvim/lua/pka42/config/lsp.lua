return {
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v3.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'L3MON4D3/LuaSnip' },

        -- Fidget (LSP progress UI)
        { "j-hui/fidget.nvim" },

        -- Snippets
        { 'rafamadriz/friendly-snippets' },
    },
    config = function()
        local lsp_zero = require('lsp-zero')
        local lspconfig = require('lspconfig')

        -- Setup Mason
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "gopls",
                "bashls",
            },
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = lsp_zero.capabilities,
                    })
                end,
            },
        })

        -- Lua language server special configuration
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        })

        -- Fidget (LSP loading UI)
        require("fidget").setup()

        -- Setup nvim-cmp
        local cmp = require('cmp')
        local luasnip = require("luasnip")

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- Use LuaSnip instead of `vsnip#anonymous`
                end,
            },
            mapping = {
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-y>'] = cmp.config.disable, -- Disable default <C-y> mapping
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' },
            }),
        })

        -- Set LSP diagnostic signs
        lsp_zero.set_sign_icons({
            error = "",
            warn = "",
            hint = "󰋗",
            info = ""
        })

        -- Apply LSP settings
        lsp_zero.setup()

        -- Enable virtual text diagnostics
        vim.diagnostic.config({
            virtual_text = true
        })
    end
}

