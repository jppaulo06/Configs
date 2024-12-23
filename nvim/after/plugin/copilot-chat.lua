copilot = require("CopilotChat")

copilot.setup(
    {
        model = 'gpt-4o',  -- Default model to use, see ':CopilotChatModels' for available models (can be specified manually in prompt via $).
        agent = 'copilot', -- Default agent to use, see ':CopilotChatAgents' for available agents (can be specified manually in prompt via @).
        context = nil,     -- Default context or array of contexts to use (can be specified manually in prompt via #).
        temperature = 0.1, -- GPT result temperature

        headless = false,  -- Do not write to chat buffer and use history(useful for using callback for custom processing)

        show_help = true,                 -- Shows help message as virtual lines when waiting for user input

        debug = false, -- Enable debug logging (same as 'log_level = 'debug')
        log_level = 'info', -- Log level to use, 'trace', 'debug', 'info', 'warn', 'error', 'fatal'

        chat_autocomplete = true, -- Enable chat autocompletion (when disabled, requires manual `mappings.complete` trigger)
        history_path = vim.fn.stdpath('data') .. '/copilotchat_history', -- Default path to stored history
    }
)

vim.keymap.set("n", "<leader>c", copilot.toggle)
