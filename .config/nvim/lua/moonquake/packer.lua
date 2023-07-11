-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
         'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
         requires = { {'nvim-lua/plenary.nvim'} }
    }
 
    use "ellisonleao/gruvbox.nvim"
    use "folke/tokyonight.nvim"
    use "EdenEast/nightfox.nvim"
    use { "bluz71/vim-nightfly-colors", as = "nightfly" }

    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use ('theprimeagen/harpoon')

    use ('mbbill/undotree')

    use ('tpope/vim-fugitive')

    use {
         "windwp/nvim-autopairs",
          config = function() require("nvim-autopairs").setup {} end
    }

    use {'neoclide/coc.nvim', branch = 'release'}

    use {'CRAG666/betterTerm.nvim'}

    use {'CRAG666/code_runner.nvim'}

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use {"ofseed/lualine-copilot"}

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
end)
