vim.keymap.set('', '<leader>f', function()
    require('conform').format { async = true, lsp_format = 'fallback' }
end, { desc = '[P]rocura [H]elp' })

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function()
        require('conform').format { async = true, lsp_format = 'fallback' }
    end
})
