-- lua/plugins.lua

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- use { "github/copilot.vim" }
  -- use({
  --  "CopilotC-Nvim/CopilotChat.nvim",
  --  branch = "main",
  --  requires = {
  --    { "github/copilot.vim" },
  --    { "nvim-lua/plenary.nvim" },
  --    { "nvim-telescope/telescope.nvim" }
  --  },
  --config = function()
  --  require("CopilotChat").setup({
      -- optional settings
  --    debug = false,
  --  })
 -- end,
-- })
  use "ThePrimeagen/vim-be-good"
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
  }
  use "camgunz/amber"
  use "nvim-lua/plenary.nvim"

  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup {}
    end,
  }

  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "mbbill/undotree"
  use "tpope/vim-fugitive"
  use "stevearc/dressing.nvim"
  use "MunifTanjim/nui.nvim"
  use "MeanderingProgrammer/render-markdown.nvim"

  use {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<Tab>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
        ignore_filetypes = { cpp = true },
        color = {
          suggestion_color = "#7aa2f7",
          cterm = 110,
        },
        log_level = "info",
        disable_inline_completion = false,
        disable_keymaps = false,
        condition = function() return false end,
      })
    end,
  }

  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "mfussenegger/nvim-jdtls"

  use "hrsh7th/nvim-cmp"
  use "nvim-tree/nvim-web-devicons"
  use "HakonHarnes/img-clip.nvim"
  
  --[[
  use {
    "yetone/avante.nvim",
    branch = "main",
    run = "make",
    config = function()
      require("avante").setup()
    end,
  }
  --]]

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

  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          icons_enabled = false,
          
          section_separators = "",
          component_separators = "",
        }
      })
    end,
  }
  --[[
  use "nvim-tree/nvim-web-devicons"
  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end,
  }
  --]]
end)
