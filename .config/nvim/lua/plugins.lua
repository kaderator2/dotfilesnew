return { 
    -- Plugins will be added here accordingly.
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 
        "danymat/neogen", 
        config = true,
        -- Uncomment next line if you want to follow only stable versions
        -- version = "*" 
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    {'sbdchd/neoformat'},
    {"ThePrimeagen/harpoon"},
    {"tpope/vim-fugitive"},
    {"ThePrimeagen/vim-be-good"},
    { 'rose-pine/neovim', name = 'rose-pine' },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {"mbbill/undotree"},
    {"neovim/nvim-lspconfig"},
    {"mfussenegger/nvim-jdtls"},
    {"williamboman/mason.nvim"},
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer", -- source for text in buffer
            "hrsh7th/cmp-path", -- source for file system paths
            "L3MON4D3/LuaSnip", -- snippet engine
            "saadparwaiz1/cmp_luasnip", -- for autocompletion
            "rafamadriz/friendly-snippets", -- useful snippets
            "onsails/lspkind.nvim", -- vs-code like pictograms
        },
        config = function()
            local cmp = require("cmp")

                        local luasnip = require("luasnip")

                        local lspkind = require("lspkind")

                        -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
                        require("luasnip.loaders.from_vscode").lazy_load()

                        cmp.setup({
                                completion = {
                                        completeopt = "menu,menuone,preview,noselect",
                                },
                                snippet = { -- configure how nvim-cmp interacts with snippet engine
                                expand = function(args)
                                        luasnip.lsp_expand(args.body)
                                end,
                        },
                        mapping = cmp.mapping.preset.insert({
                                ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                                ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                                ["<C-e>"] = cmp.mapping.abort(), -- close completion window
                                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                        }),
                        -- sources for autocompletion
                        sources = cmp.config.sources({
                                { name = "nvim_lsp" },
                                { name = "luasnip" }, -- snippets
                                { name = "buffer" }, -- text within current buffer
                                { name = "path" }, -- file system paths
                        }),
                        -- configure lspkind for vs-code like pictograms in completion menu
                        formatting = {
                                format = lspkind.cmp_format({
                                        maxwidth = 50,
                                        ellipsis_char = "...",
                                }),
                        },
                })
        end,
}
}
