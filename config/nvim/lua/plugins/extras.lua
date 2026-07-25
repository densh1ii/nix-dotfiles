return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    { 'vyfor/cord.nvim' },
    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup({})
        end
    },
    { 'ojroques/vim-oscyank' },
    { 'tpope/vim-fugitive' },
}
