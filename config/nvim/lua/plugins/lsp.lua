return {

    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true,
    },


    {
        "williamboman/mason-lspconfig.nvim",

        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },

        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "lua_ls",
                },
            })
        end,
    },


    {
        "neovim/nvim-lspconfig",

        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },


        config = function()
            local capabilities =
                require("cmp_nvim_lsp").default_capabilities()


            local on_attach = function(_, bufnr)
                local opts = {
                    buffer = bufnr,
                    silent = true,
                }


                vim.keymap.set("n", "gd",
                    vim.lsp.buf.definition,
                    opts)

                vim.keymap.set("n", "gr",
                    vim.lsp.buf.references,
                    opts)

                vim.keymap.set("n", "K",
                    vim.lsp.buf.hover,
                    opts)

                vim.keymap.set("n", "<leader>rn",
                    vim.lsp.buf.rename,
                    opts)

                vim.keymap.set("n", "<leader>ca",
                    vim.lsp.buf.code_action,
                    opts)

                vim.keymap.set("n", "<leader>gf",
                    function()
                        vim.lsp.buf.format()
                    end,
                    opts)
            end



            vim.lsp.config("clangd", {

                capabilities = capabilities,

                on_attach = on_attach,

                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--completion-style=detailed",
                },

            })



            vim.lsp.config("lua_ls", {

                capabilities = capabilities,

                on_attach = on_attach,

                settings = {

                    Lua = {

                        diagnostics = {
                            globals = {
                                "vim",
                            },
                        },

                        workspace = {
                            library =
                                vim.api.nvim_get_runtime_file("", true),
                        },

                        telemetry = {
                            enable = false,
                        },

                    },

                },

            })



            vim.lsp.config("pyright", {
                capabilities = capabilities,
                on_attach = on_attach,
            })


            vim.lsp.config("ts_ls", {
                capabilities = capabilities,
                on_attach = on_attach,
            })



            vim.lsp.enable({
                "clangd",
                "lua_ls",
                "pyright",
                "ts_ls",
            })
        end,
    },



    {
        "hrsh7th/nvim-cmp",

        dependencies = {

            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",

            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",

            "rafamadriz/friendly-snippets",

        },


        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")


            require("luasnip.loaders.from_vscode").lazy_load()


            cmp.setup({

                snippet = {

                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,

                },


                mapping = cmp.mapping.preset.insert({

                    ["<CR>"] =
                        cmp.mapping.confirm({
                            select = true,
                        }),


                    ["<Tab>"] =
                        cmp.mapping(function(fallback)
                            if luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                            else
                                fallback()
                            end
                        end, {
                            "i",
                            "s",
                        }),


                    ["<S-Tab>"] =
                        cmp.mapping(function(fallback)
                            if luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end, {
                            "i",
                            "s",
                        }),

                }),


                sources = {

                    {
                        name = "nvim_lsp",
                    },

                    {
                        name = "luasnip",
                    },

                    {
                        name = "buffer",
                    },

                    {
                        name = "path",
                    },

                },

            })
        end,

    },

}
