-- nvim/after/plugin/conform.lua
local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    -- Add others as needed
  },

  -- *** Disable Format on Save ***
  format_on_save = nil, -- Remove or set to nil/false

  -- Optional formatter definitions (usually not needed if using Mason)
  -- formatters = {
  --   ruff_format = {
  --      prepend_args = {"format", "-"} -- Ensure it reads from stdin
  --   }
  -- }
})

-- Your keymap for manual formatting (<leader>f which is <space>f)
vim.keymap.set({ "n", "v" }, "<leader>f", function()
  print("'<leader>f' pressed. Attempting to format with conform...") -- Debug 1
  local format_opts = {
    async = true,
    lsp_fallback = true,   -- Try LSP if conform fails (useful for non-python)
    quiet = false          -- Show messages
  }

  conform.format(format_opts, function(err, did_format)                                   -- Add callback
    if err then
      print("Conform formatting error: " .. tostring(err))                                -- Debug 2
    elseif not did_format then
      print("Conform: No formatter configured or formatting needed for this buffer.")     -- Debug 3
    else
      print("Conform: Formatting applied.")                                               -- Debug 4
    end
  end)
end, { desc = "Format buffer [conform]" }) -- Updated description

