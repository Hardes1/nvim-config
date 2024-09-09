
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'nvim-treesitter/nvim-treesitter'
  use "williamboman/mason.nvim"
  use "neovim/nvim-lspconfig"
  use {
  'hrsh7th/nvim-cmp', -- Completion plugin
  requires = {
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
    'hrsh7th/cmp-buffer', -- Buffer source for nvim-cmp
    'hrsh7th/cmp-path', -- Path source for nvim-cmp
    'hrsh7th/cmp-cmdline', -- Cmdline source for nvim-cmp
    'L3MON4D3/LuaSnip', -- Snippet engine
    'saadparwaiz1/cmp_luasnip', -- Snippet source for nvim-cmp
  }
  }
  use "preservim/nerdtree"
  use "ryanoasis/vim-devicons"
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
-- or                            , branch = '0.1.x',
  requires = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim'}
  }
  use {
  "nvim-lualine/lualine.nvim",
  requires = { "nvim-tree/nvim-web-devicons", opt = true }
  }
  use 'mfussenegger/nvim-dap'
  use  {
  'rcarriga/nvim-dap-ui',
  requires = 'nvim-neotest/nvim-nio'
  }
  use 'mrcjkb/rustaceanvim'
end)

