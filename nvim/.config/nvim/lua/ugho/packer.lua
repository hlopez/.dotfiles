-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use({ "keyvchan/telescope-find-pickers.nvim" })
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use({ 'folke/tokyonight.nvim' })
  use {
    'goolord/alpha-nvim',
    requires = { 'echasnovski/mini.icons' },
  }
  use({
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  })
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  })
  use('theprimeagen/harpoon')
  use('theprimeagen/git-worktree.nvim')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('shumphrey/fugitive-gitlab.vim')
  use('tpope/vim-rails')
  use('nvim-tree/nvim-web-devicons')
  use({
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup()
    end
  })
  use('kchmck/vim-coffee-script')
  use({ 'neovim/nvim-lspconfig' })
  use({ 'neovim/nvim-lsp' })
  use({
    'hrsh7th/nvim-cmp',
    requires = { { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'petertriho/cmp-git' },
      { 'saadparwaiz1/cmp_luasnip' },
      {
        "L3MON4D3/LuaSnip",
        tag = "v2.*",
        build = "make install_jsregexp"
      },
      { 'onsails/lspkind.nvim' },
    }
  })
  use({
    'williamboman/mason.nvim',
    requires = { { 'williamboman/mason-lspconfig.nvim' },
      { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
    }
  })
  use({
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup()
    end,
  })
  use({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  })
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('ugho/my_statusline')
    end,
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use({
    "stevearc/dressing.nvim",
    confing = function()
      require('dressing').setup()
    end,
  })
  -- sql integration
  use({
    "tpope/vim-dadbod",
    requires = { { "kristijanhusak/vim-dadbod-completion" },
      { "kristijanhusak/vim-dadbod-ui" }, }
  })
  -- Debugger
  use({
    "mfussenegger/nvim-dap",
    requires = { { "rcarriga/nvim-dap-ui" },
      { "theHamsta/nvim-dap-virtual-text" },
      { "nvim-telescope/telescope-dap.nvim" },
      { "suketa/nvim-dap-ruby" },
      { "nvim-neotest/nvim-nio" },
      { "anuvyklack/hydra.nvim" },
      { "jay-babu/mason-nvim-dap.nvim" },
    }
  })
end)
