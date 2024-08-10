return {
    -- colorschemes
    { 'kepano/flexoki-neovim',            name = 'flexoki' },
    { 'neanias/everforest-nvim' },
    { "ellisonleao/gruvbox.nvim",         priority = 1000,                                   config = true, opts = {} },

    -- lsp
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    --{ 'WhoIsSethDaniel/mason-tool-installer.nvim' },
    { 'neovim/nvim-lspconfig' },

    -- autocomplete
    { 'hrsh7th/nvim-cmp',                 config = [[require('config.nvim-cmp')]] },
    { 'hrsh7th/cmp-nvim-lsp',             after = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer',               after = 'nvim-cmp' },         -- buffer auto-completion
    { 'hrsh7th/cmp-path',                 after = 'nvim-cmp' },         -- path auto-completion
    { 'hrsh7th/cmp-cmdline',              after = 'nvim-cmp' },         -- cmdline auto-completion
    { 'L3MON4D3/LuaSnip',                 dependencies = { "rafamadriz/friendly-snippets" }, },
    { 'saadparwaiz1/cmp_luasnip' },

    -- formatters
    {
        "prettier/vim-prettier",
        ft = { "javascript", "typescript", "json", "css", "scss", "html", "markdown", "typescriptreact", "yaml" },
    },
    {
        'stevearc/conform.nvim',
        opts = {},
    },

    -- file manager
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
    },

    -- git
    { "sindrets/diffview.nvim" },
    { "f-person/git-blame.nvim" },

    -- statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- terminal
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true
    },

    -- notes
    --{
    --    'lervag/wiki.vim',
    --    config = function()
    --        vim.g.wiki_root = '~/wiki'        -- Set your wiki root directory
    --        vim.g.wiki_filetypes = { 'md' }   -- Set file types
    --        vim.g.wiki_link_extension = '.md' -- Set file extension for links
    --    end,
    --},
    --
    {
        "vimwiki/vimwiki",
        init = function()
            vim.g.vimwiki_list = {
                {
                    path = '~/vimwiki',
                    syntax = 'default',
                    ext = '.wiki',
                },
            }
        end,
    },

}
