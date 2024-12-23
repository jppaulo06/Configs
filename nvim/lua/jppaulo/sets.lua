vim.opt.guicursor = ""

vim.g.mapleader = " "

vim.g.netrw_banner = 0

-- Numbers on the left
vim.opt.nu = false
vim.opt.relativenumber = false

-- Tab size
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- 4 spaces for tabs
-- Expandtab = true -> 4 spaces when tab
-- Expandtab = false -> 1 tab with 4 spaces wide when tab
vim.opt.expandtab = true

-- Identation with =
vim.opt.smartindent = true

-- Wrap lines
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

-- Nice for undotree
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "80"
