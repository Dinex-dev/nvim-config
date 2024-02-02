return {
    'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = false
        -- setup barbar to give offset with Nvim Tree
        require'barbar'.setup {
            sidebar_filetypes = {
                -- Use the default values: {event = 'BufWinLeave', text = nil}
                NvimTree = true,
                -- Or, specify the text used for the offset:
                --undotree = {text = 'File Manager'},
                ---- Or, specify the event which the sidebar executes when leaving:
                --['neo-tree'] = {event = 'BufWipeout'},
                ---- Or, specify both
                Outline = {event = 'BufWinLeave', text = 'File Manager'},
            },
        }
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        -- Move to previous/next
        map('n', 'H', '<Cmd>BufferPrevious<CR>', opts)
        map('n', 'L', '<Cmd>BufferNext<CR>', opts)
        -- Re-order to previous/next
        map('n', '<C-H>', '<Cmd>BufferMovePrevious<CR>', opts)
        map('n', '<C-L>', '<Cmd>BufferMoveNext<CR>', opts)
        -- Goto buffer in position...
        map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
        map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
        map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
        map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
        map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
        map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
        map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
        map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
        map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
        map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
        -- Pin/unpin buffer
        map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
        -- Close buffer
        map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
        -- Wipeout buffer
        --                 :BufferWipeout
        -- Close commands
        --                 :BufferCloseAllButCurrent
        --                 :BufferCloseAllButPinned
        --                 :BufferCloseAllButCurrentOrPinned
        --                 :BufferCloseBuffersLeft
        --                 :BufferCloseBuffersRight
        -- Magic buffer-picking mode
        map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
        -- Sort automatically by...
        map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
        map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
        map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
        map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

        -- Other:
        -- :BarbarEnable - enables barbar (enabled by default)
        -- :BarbarDisable - very bad command, should never be used


    end,
    opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
} 
