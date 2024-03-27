return {
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local transform_mod = require('telescope.actions.mt').transform_mod
		local actions = require('telescope.actions')
		local mod = {}
		mod.open_in_nvim_tree = function(prompt_bufnr)
			local cur_win = vim.api.nvim_get_current_win()
			vim.cmd("NvimTreeFindFile")
			vim.api.nvim_set_current_win(cur_win)
		end

		mod = transform_mod(mod)
		require("telescope").setup{
			defaults = {
				mappings = {
					i = {
						["<CR>"] = actions.select_default + mod.open_in_nvim_tree,
					},
					n = {
						["<CR>"] = actions.select_default + mod.open_in_nvim_tree,
					},
				},
			},
		}

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
		vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
	end
}
