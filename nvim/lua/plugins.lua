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
    { 'hrsh7th/cmp-buffer',               after = 'nvim-cmp' }, -- buffer auto-completion
    { 'hrsh7th/cmp-path',                 after = 'nvim-cmp' }, -- path auto-completion
    { 'hrsh7th/cmp-cmdline',              after = 'nvim-cmp' }, -- cmdline auto-completion

    -- snippets
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

    -- better highlighting with treesitter (?)
    --
    -- This will need the required development tool libraries installed on your machine
    --
    -- For linux-ubuntu you will need:
    -- sudo apt-get install build-essential
    -- sudo apt-get install python3-dev
    --
    -- For Mac (not tested):
    -- xcode-select --install
    -- brew install python
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "vim", "python", "css", "javascript", "elm" },
                highlight = {
                    enable = true,
                },
            })
        end
    },

    -- notes
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
            -- Enable syntax highlighting in code blocks
            vim.g.vimwiki_highlightcodeblocks = 1
        end,
    },

    -- comment out
    {
        'numToStr/Comment.nvim',
        opts = {
            --toggler = {
            --    ---Line-comment toggle keymap
            --    line = '<leader><Esc>',
            --    ---Block-comment toggle keymap
            --    block = '<leader>bc',
            --},
            -- add any more options here
        }
    },

    -- CSS coloring
    { 'NvChad/nvim-colorizer.lua' },

    -- surround
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }

    -- CSS & HTML related
    --{ 'mattn/emmet-vim' },
    --{
    --    'windwp/nvim-autopairs',
    --    event = "InsertEnter",
    --    config = true
    --    -- use opts = {} for passing setup options
    --    -- this is equivalent to setup({}) function
    --}
}
