-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use  {
	      'nvim-telescope/telescope.nvim', tag = '0.1.1',
	      -- or                            , branch = '0.1.x',
	      requires = { {'nvim-lua/plenary.nvim'} }	
	     }

    -- Colorschemes
    use "rafamadriz/neon"
	use { "catppuccin/nvim", as = "catppuccin" }
	use({ 'rose-pine/neovim', 
		as = 'rose-pine' })
		config = function()
			m.cmd('colorscheme rose-pine')
	end

    use  ('bluz71/vim-nightfly-guicolors')
    
	-- use  ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	-- use  ('nvim-treesitter/playground')
    -- use  ('nvim-tree/nvim-web-devicons')
	use  ('mbbill/undotree')
    use {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            requires = { 
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim",
        }
    }
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
	  }
	}

    -- Autocerrado de (), [], {}
    use ('windwp/nvim-autopairs')

    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}
end)
