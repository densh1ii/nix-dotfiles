return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            {
                "rcarriga/nvim-notify",
                config = function()
                    require("notify").setup({
                        background_colour = "#000000"
                    })
                end
            }
        },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },

                hover = {
                    enabled = true,
                    silent = true,
                },

                signature = {
                    enabled = true,
                },
            },

            messages = {
                enabled = true,
            },

            notify = {
                enabled = true,
            },

            cmdline = {
                enabled = true,
                view = "cmdline_popup",
                format = {
                    cmdline = {
                        pattern = "^:",
                        icon = "",
                        lang = "vim",
                    },
                    search_down = {
                        kind = "search",
                        pattern = "^/",
                        icon = " ↓",
                        lang = "regex",
                    },
                    search_up = {
                        kind = "search",
                        pattern = "^%?",
                        icon = " ↑",
                        lang = "regex",
                    },
                },
            },

            popupmenu = {
                enabled = true,
                backend = "nui",
            },

            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = true,
                lsp_doc_border = true,
            },

            routes = {
                {
                    filter = {
                        event = "msg_show",
                        find = "written",
                    },
                    opts = {
                        skip = true,
                    },
                },
            },

            views = {
                cmdline_popup = {
                    position = {
                        row = "40%",
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = "auto",
                    },
                },

                popupmenu = {
                    relative = "editor",
                    position = {
                        row = "45%",
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = 10,
                    },
                },
            },
        },
    },
}
