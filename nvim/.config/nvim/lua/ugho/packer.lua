-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use( 'nvim-treesitter/nvim-treesitter', {run  = ':TSUpdate'} )
    use( 'theprimeagen/harpoon' )
    use( 'theprimeagen/git-worktree.nvim' )
    use( 'mbbill/undotree' )
    use( 'tpope/vim-fugitive' )
    use( 'tpope/vim-vinegar' )
    use( 'tpope/vim-rails' )
    use( 'nvim-tree/nvim-web-devicons' )
    use({ 'norcalli/nvim-colorizer.lua',
           config = function()
              require'colorizer'.setup()
           end
        })
    use({ 'glepnir/galaxyline.nvim',
	       branch = 'main',
	        -- your statusline
           config = function()
             require('ugho/my_statusline')
           end,
           -- some optional icons
           requires = { 'nvim-tree/nvim-web-devicons', opt=true },
        })
    use( 'kchmck/vim-coffee-script' )
    use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
    use({'neovim/nvim-lspconfig'})
    use({ "williamboman/mason.nvim" })
    use({'hrsh7th/nvim-cmp'})
    use({'hrsh7th/cmp-nvim-lsp'})
    use({'hrsh7th/cmp-buffer'})
    use({'hrsh7th/cmp-path'})
    use({'hrsh7th/cmp-cmdline'})
    use({'L3MON4D3/LuaSnip'}) 
end)
