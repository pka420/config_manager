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

        --Fidget
        {"j-hui/fidget.nvim"},

        -- Snippets
        { 'rafamadriz/friendly-snippets' },
    },
    config = function()
        require('lspconfig')
        require("fidget").setup()
        local lsp_zero = require('lsp-zero')
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "gopls",
                "bashls",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {}
                end
            },
            ["lua_ls"] = function ()
               local lspconfig = require("mason-lspconfig")
               lspconfig.lua_ls.setup {
                   settings = {
                       Lua = {
                           diagnostics = {
                               globals = { "vim" }
                           }
                       }
                   }
               }
           end,
        });

        local cmp = require('cmp')
        cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- or use your preferred snippet engine
        end,
      },
      mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Disable default <C-y> mapping.
        ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },  -- Ensure 'path' is included here
        { name = 'cmdline' },  -- Optional: for command-line completion
      })
    })
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local cmp_mappings = lsp_zero.defaults.cmp_mappings({
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ['<C-t>'] = cmp.mapping.confirm({ select = false }),
            ["<C-Space>"] = cmp.mapping.complete(),
        })

        cmp_mappings['<Tab>'] = nil
        cmp_mappings['<S-Tab>'] = nil


        lsp_zero.set_sign_icons({
                error = "",
                warn = "",
                hint = "󰋗",
                info = ""
        })

        lsp_zero.setup()

        vim.diagnostic.config({
            virtual_text = true
        })
    end
}

