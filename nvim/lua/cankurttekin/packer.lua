-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

    use "ThePrimeagen/vim-be-good"

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    --use "camgunz/amber"
	use {
		"maxmx03/solarized.nvim",
		config = function()
			require("solarized").setup({
				theme = "neo",
				transparent = {
					enable = false,
				},
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
				},
			})
			vim.cmd.colorscheme("solarized")
		end,
	}

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'
	use "neovim/nvim-lspconfig"
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	}

	use { "hrsh7th/nvim-cmp" }
	use { "hrsh7th/cmp-nvim-lsp" }
	use { "L3MON4D3/LuaSnip" }
	use { "saadparwaiz1/cmp_luasnip" }
	use { "hrsh7th/cmp-buffer" }
	use { "hrsh7th/cmp-path" }
	use { "rafamadriz/friendly-snippets" }

    use { "github/copilot.vim" }
    use({
            "CopilotC-Nvim/CopilotChat.nvim",
            branch = "main",
            requires = {
                    { "github/copilot.vim" },
                    { "nvim-lua/plenary.nvim" },
                    { "nvim-telescope/telescope.nvim" }
            },
            config = function()
                    require("CopilotChat").setup({
                            -- optional settings
                            debug = false,
                    })
            end,
    })

    -- use { "nvim-tree/nvim-web-devicons" }
    use {
            'nvim-lualine/lualine.nvim',
    }

    use {
            "supermaven-inc/supermaven-nvim"
    }

  use "MeanderingProgrammer/render-markdown.nvim"
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "mfussenegger/nvim-jdtls"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "folke/which-key.nvim"
end)
