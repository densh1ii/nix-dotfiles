return{
    {
        "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
            })
            vim.cmd("colorscheme catppuccin-nvim")
            --vim.api.nvim_set_hl(0,"Normal",{bg = "none"})
        end

    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'auto',
                },
            })

        end
    }
}
