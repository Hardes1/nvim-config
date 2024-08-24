require("plugins")

require("mason").setup()


local configs = require'nvim-treesitter.configs'
configs.setup {
ensure_installed = { "cpp", "rust", "kotlin", "java", "c", "lua", "vim", "vimdoc", "query" },
highlight = { -- enable highlighting
  enable = true,
},
indent = {
  enable = true, -- default is disabled anyways
}
}


require('lspconfig')["clangd"].setup{
  on_attach = on_attach
}
