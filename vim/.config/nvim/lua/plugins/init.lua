return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "plugins.configs.treesitter"
    end,
  }

  use {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
    end,
  }

  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require "plugins.configs.lsp-lines"
    end,
  })

  use {
    "hrsh7th/cmp-nvim-lsp",
  }
  use {
    "hrsh7th/cmp-buffer",
  }
  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require "plugins.configs.cmp"
    end,
  }

  use {
    "fneuhaus/oceanic-neo",
    config = function()
      vim.cmd("colorscheme oceanic-neo")
      if vim.fn.has('termguicolors') == 1 then
        vim.o.termguicolors = true
      end
    end,
  }

  use {
    "kyazdani42/nvim-web-devicons",
    -- after = "nvim-base16.lua",
    config = function()
      require "plugins.configs.icons"
    end,
  }

  use {
    "hoob3rt/lualine.nvim",
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require "plugins.configs.lualine"
    end,
  }

  use {
    "majutsushi/tagbar",
    config = function()
      require "plugins.configs.tagbar"
    end,
  }

  use {
    "raimondi/delimitmate",
  }

  use {
    "SirVer/ultisnips",
    config = function()
      require "plugins.configs.ultisnips"
    end,
  }

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "plugins.configs.gitsigns"
    end,
  }

  use {
    "nvim-lua/plenary.nvim",
  }

  use {
    "christoomey/vim-tmux-navigator",
    config = function()
      require "plugins.configs.tmux-navigator"
    end,
  }

  use {
    "troydm/zoomwintab.vim",
    config = function()
      require "plugins.configs.zoomwintab"
    end,
  }

  use {
    "psf/black",
    config = function()
      require "plugins.configs.black"
    end,
  }
  
  use {
    "terryma/vim-multiple-cursors",
    config = function()
      require "plugins.configs.vim-multiple-cursors"
    end,
  }

  use {
    "farmergreg/vim-lastplace",
  }

  use {
    "scrooloose/nerdcommenter",
    config = function()
      require "plugins.configs.nerd"
    end,
  }

  use {
    "lervag/vimtex",
    config = function()
      require "plugins.configs.vimtex"
    end,
  }

  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "plugins.configs.indent-blankline"
    end,
  }

  use {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end,
  }

  use {
    "ggandor/leap.nvim",
    config = function()
      require "leap".set_default_keymaps()
    end,
  }

  use {'kaarmu/typst.vim', ft = {'typst'}}
end)

