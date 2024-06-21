return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        local lsp_zero = require('lsp-zero')
        lsp_zero.on_attach(function (client, bufnr)
            lsp_zero.default_keymaps=({buffer = bufnr})
        end)
        local lspconfig = require("lspconfig")
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                --"emmet-language-server",
                --"jedi-language-server",
                --"tailwindcss-language-server",
                --"typescript-language-server",
            },
            handlers = {
                function(server_name) -- default handler (optional)

                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
                lspconfig.tsserver.setup {},
                lspconfig.emmet_language_server.setup ({
                    --{filetypes = {"css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact", "javascript.jsx", "typescript.tsx"}},
                    {filetypes = {"css", "html", "javascript", }},
                    capabilities = capabilities,
                    init_options = {
                        includeLanguages = {},
                        excludeLanguages = {},
                        --- @type string[]
                        extensionsPath = {},
                        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
                        preferences = {},
                        --- @type boolean Defaults to `true`
                        showAbbreviationSuggestions = true,
                        --- @type "always" | "never" Defaults to `"always"`
                        showExpandedAbbreviation = "always",
                        --- @type boolean Defaults to `false`
                        showSuggestionsAsSnippets = false,
                        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
                        syntaxProfiles = {},
                        --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
                        variables = {},
                    },
                }),
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        local luasnip = require 'luasnip'
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<Tab>"] = cmp.mapping(function (fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                    end, {'i', 's' })
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                    { name = 'buffer' },
                })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
