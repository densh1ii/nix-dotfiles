return{
    {
        "ellisonleao/gruvbox.nvim",
         priority = 1000,
         config = function()
             require('gruvbox').setup({})
             vim.cmd("colorscheme gruvbox")
         end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'gruvbox'
                }
            })
        end
    }
}
