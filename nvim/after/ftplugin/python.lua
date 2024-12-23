local ft = require('guard.filetype')

-- Assuming you have guard-collection
-- Put this in your ftplugin/lang.lua to lazy load guard
--ft('lang'):fmt('format-tool-1')
--          :append('format-tool-2')
--          :env(env_table)
--          :lint('lint-tool-1')
--          :extra(extra_args)

ft('python'):fmt('isort')
            :fmt('black')
            :fmt('autopep8')
            :lint('mypy')

-- change this anywhere in your config, these are the defaults
vim.g.guard_config = {
    -- format on write to buffer
    fmt_on_save = true,
    -- use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = false,
    -- whether or not to save the buffer after formatting
    save_on_fmt = true,
}
