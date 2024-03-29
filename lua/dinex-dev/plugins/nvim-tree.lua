return {
	{
		"nvim-tree/nvim-tree.lua",
		config=function()
			require("nvim-tree").setup({
				filters = {
					dotfiles = false,
				},
			})

			-- disable netrw at the very start of your init.lua
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			vim.keymap.set("n", "<leader>e", "::NvimTreeFindFileToggle<CR>", {silent = true, noremap = true})

		end
	}
}
