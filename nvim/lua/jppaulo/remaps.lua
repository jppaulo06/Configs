vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Put cursor on center on useful stuff
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Don't overwrite on paste
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Don't copy to register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Substitute every string in the file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Edit plugins
vim.keymap.set("n", "<leader>e", "<cmd>e ~/.config/nvim/lua/jppaulo/plugins.lua<CR>");

-- Stop highlighting
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>")
