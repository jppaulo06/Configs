local ft = require('guard.filetype')

-- Configure guard filetype for Python
ft('python')
    :lint("mypy")
    :extra("--config-file", "pyproject.toml")
    :fmt("isort")
    :extra("--settings-path", "pyproject.toml")
    :fmt("black")
    :extra("--config", "pyproject.toml")

-- Default guard configuration
vim.g.guard_config = {
    -- Format on write to buffer
    fmt_on_save = false,
    -- Use LSP if no formatter was defined for this filetype
    lsp_as_default_formatter = true,
    -- Whether or not to save the buffer after formatting
    save_on_fmt = false,
    auto_lint = true,
}

vim.keymap.set("n", "<leader>f", "<cmd>Guard fmt<CR>")
