local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
}

local plugins = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
    {
        -- Theme inspired by Atom
        'navarasu/onedark.nvim',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'onedark'
        end,
    },
    -- cmp plugins
    "hrsh7th/nvim-cmp", -- The completion plugin
    "hrsh7th/cmp-buffer",       -- buffer completions
    "hrsh7th/cmp-path",         -- path completions
    "hrsh7th/cmp-cmdline",      -- cmdline completions
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",

    -- snippets
    "L3MON4D3/LuaSnip",             --snippet engine
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use

    -- LSP
    "neovim/nvim-lspconfig",              -- enable LSP
    "williamboman/mason.nvim",            -- simple to use language server installer
    "williamboman/mason-lspconfig.nvim",  -- simple to use language server installer
    "jose-elias-alvarez/null-ls.nvim",    -- LSP diagnostics and code actions
}

require("lazy").setup(plugins, opts)
