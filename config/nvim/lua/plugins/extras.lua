return{
    {
        'tpope/vim-fugitive',
    },
    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup({})
        end
    },
    {
        'vyfor/cord.nvim',
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
}

