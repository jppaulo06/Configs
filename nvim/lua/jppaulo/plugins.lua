return require("packer").startup(function(use)
    -- This is usefull to make packer update itself
    use "wbthomason/packer.nvim"

    -- All natural pine, faux fur and a bit of soho vibes for the classy
    -- minimalist
    use({
        "rose-pine/neovim",
        as = "rose-pine",
    })

    -- A highly extendable fuzzy finder over lists. Built on the latest awesome
    -- features from neovim core. Telescope is centered around modularity,
    -- allowing for easy customization.
    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    -- A pretty list for showing diagnostics, references, telescope results,
    -- quickfix and location lists to help you solve all the trouble your code is
    -- causing.
    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
            }
        end
    })

    use("theprimeagen/refactoring.nvim")

    -- Undotree visualizes the undo history and makes it easy to browse and
    -- switch between different undo branches. You may be wondering, what are
    -- undo "branches" anyway? They"re a feature of Vim that allow you to go back
    -- to a prior state even after it has been overwritten by later edits. For
    -- example: In most editors, if you make some change A, followed by change B,
    -- then go back to A and make another change C, normally you wouldn"t be able
    -- to go back to change B because the undo history is linear. That"s not the
    -- case with Vim, however. Vim internally stores the entire edit history for
    -- each file as a single, monolithic tree structure; this plug-in exposes
    -- that tree to you so that you can not only switch back and forth between
    -- older and more recent edits linearly but can also switch between diverging
    -- branches.
    use("mbbill/undotree")

    -- Lsp and completion
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp"
    }

    -- Lint and format
    use {
        "nvimdev/guard.nvim",
        requires = {
            "nvimdev/guard-collection"
        }
    }

    -- Pretty stuff
    use("nvim-treesitter/nvim-treesitter", { run = "TSUpdate" })

    -- Permits stuff like cs'" (change surround ' to ")
    use("tpope/vim-surround")

    use("ThePrimeagen/harpoon")

    -- Icons
    use("nvim-tree/nvim-web-devicons")

    -- Pretty netrw
    use("prichrd/netrw.nvim")

    use("xiyaowong/transparent.nvim")

    use("christoomey/vim-tmux-navigator",
        {
            config = function()
                require("tmux-navigator").setup({
                    cmd = {
                        "TmuxNavigateLeft",
                        "TmuxNavigateDown",
                        "TmuxNavigateUp",
                        "TmuxNavigateRight",
                        "TmuxNavigatePrevious",
                    },
                    keys = {
                        { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
                        { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
                        { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
                        { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
                        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
                    },
                })
            end
        })

    use("github/copilot.vim")
    use("CopilotC-Nvim/CopilotChat.nvim")
end)
