return{
    {
        'aliqyan-21/darkvoid.nvim',
        config = function()
            require('darkvoid').setup({
                glow = true,
                transparent = true,
            })
            vim.cmd("colorscheme darkvoid")
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
