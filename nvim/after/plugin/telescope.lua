local telescope = require("telescope")

telescope.setup {
	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown(),
		},
	},
}

pcall(telescope.load_extension, 'fzf')
pcall(telescope.load_extension, 'ui-select')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = '[P]rocura [H]elp' })
vim.keymap.set('n', '<leader>pk', builtin.keymaps, { desc = '[P]rocura [K]eymaps' })
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[P]rocura [F]iles' })
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = '[P]rocura by [G]rep' })
vim.keymap.set('n', '<leader>pd', builtin.diagnostics, { desc = '[P]rocura [D]iagnostics' })
vim.keymap.set('n', '<leader>p.', builtin.oldfiles, { desc = '[P]rocura Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
