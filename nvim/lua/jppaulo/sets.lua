vim.opt.guicursor = ""

vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- Highlight search
vim.opt.hlsearch = true

-- Incremental search
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "80"

-- Case-insensitive searching UNLESS \C or one or more capital
-- letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.breakindent = true

-- Decrease update time
vim.opt.updatetime = 250

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Transparent background in some windows (like telescope)
vim.opt.winblend = 20
