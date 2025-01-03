return {
    -- LSP
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim", build = function() pcall(vim.cmd, "MasonUpdate") end },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-path", -- Shows paths in completion menu
            "hrsh7th/cmp-nvim-lua", -- Shows nvim api in completion menu
            "hrsh7th/cmp-nvim-lsp", -- Completion + LSP integration
            "windwp/nvim-autopairs", -- Automatic pairs
        },
        config = function()
            local npairs = require("nvim-autopairs")
            local Rule = require("nvim-autopairs.rule")
            local cond = require("nvim-autopairs.conds")
            npairs.setup()
            npairs.add_rules({
                Rule("{:", ":}", "norg")
                    :with_pair(cond.after_text("}"))
                    :replace_endpair(function() return ":" end),
            })
        end,
    },
}
