-- nvim/after/plugin/lsp.lua

-- Basic LSP UI settings (Keep these)
vim.opt.signcolumn = 'yes'
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- Completion setup (Keep this)
local cmp = require('cmp')
-- ... (Keep your existing cmp setup here - unchanged from previous version) ...
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = { -- Ensure you have mappings defined here
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-y>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.close(),
    },
})


-- LSP Capabilities (Keep this)
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Mason setup (Keep this)
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "ruff", "pyright" },
})

-- LSP Server Configuration (Keep this)
local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers {
    function(server_name) -- Default handler
        lspconfig[server_name].setup {
            capabilities = capabilities,
        }
    end,
    -- ... (Keep your specific handlers for ruff_lsp, pyright, lua_ls here - unchanged) ...
    ["ruff"] = function() lspconfig.ruff.setup { capabilities = capabilities, init_options = { settings = { args = {}, } } } end,
    ["pyright"] = function() lspconfig.pyright.setup { capabilities = capabilities } end,
    ["lua_ls"] = function() lspconfig.lua_ls.setup { capabilities = capabilities, settings = { Lua = { runtime = { version = 'LuaJIT' }, diagnostics = { globals = { 'vim' } }, workspace = { library = vim.api.nvim_get_runtime_file("", true) }, telemetry = { enable = false } } } } end,
}

-- Simplified LSP Attach Autocommand
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
    callback = function(event)
        -- Check if buffer is valid before setting options/keymaps
        if not event or not event.buf or not vim.api.nvim_buf_is_valid(event.buf) then
            print("LspAttach Error: Invalid buffer in event.")
            return
        end

        local opts = { buffer = event.buf, noremap = true, silent = true }
        -- print("Setting up LSP keymaps for buffer: " .. event.buf) -- Debug print

        -- Essential LSP Keymaps
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

        -- Diagnostics Keymaps
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<leader>dl', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, opts)

        -- ** NOTE: Formatting keymap should be handled by conform.lua **
        -- vim.keymap.set({ 'n', 'v' }, '<leader>f', function() vim.lsp.buf.format { async = true } end, opts) -- Avoid this if using conform
    end,
})
