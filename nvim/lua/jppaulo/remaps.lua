vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

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
vim.keymap.set("n", "<leader>e", "<cmd>tabe ~/.config/nvim/lua/plugins.lua<CR>");
