vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    } -- Fuzzy finder

    use ({
        'projekt0n/github-nvim-theme',
        config = function()
            vim.cmd('colorscheme github_dark')
        end
    })
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}) -- Treesitter
    use('nvim-treesitter/nvim-treesitter-textobjects') -- Text objects
    use('nvim-treesitter/playground') -- Treesitter playground
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use('mbbill/undotree') -- Undo Tree
    use('tpope/vim-fugitive') -- Git commands in nvim
    use('tpope/vim-commentary') -- "gc" to comment visual regions/lines
    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        after = "nvim-web-devicons", -- keep this if you're using NvChad
        config = function()
            require("barbecue").setup()
        end,
    })
    use('github/copilot.vim')
    use('nvim-tree/nvim-web-devicons') -- Icons
    use('lewis6991/gitsigns.nvim') -- OPTIONAL: for git status
    use('nvim-lualine/lualine.nvim') -- Status Line
    use('romgrk/barbar.nvim')
    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {

            }
        end
    }
    use('ms-jpq/chadtree', {run = 'python -m chadtree deps'}) -- File Explorer

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    } -- LSP
}
end)
