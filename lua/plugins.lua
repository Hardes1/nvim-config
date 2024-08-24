
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'nvim-treesitter/nvim-treesitter'
  use "williamboman/mason.nvim"
  use "neovim/nvim-lspconfig"
  use "preservim/nerdtree"
  use "ryanoasis/vim-devicons"
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
  "nvim-lualine/lualine.nvim",
  requires = { "nvim-tree/nvim-web-devicons", opt = true }
  }
end)

