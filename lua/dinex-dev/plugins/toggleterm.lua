return {
    -- amongst your other plugins
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = function(term)
                    if term.direction == "horizontal" then
                        return 15
                    elseif term.direction == "vertical" then
                        return vim.o.columns * 0.3
                    end
                end,

                open_mapping = [[<c-\>]],
                direction = 'vertical'
            })
        end
    },

    --{'akinsho/toggleterm.nvim', version = "*", opts = {[> things you want to change go here<]}}
}
