

require("mason").setup()


local configs = require'nvim-treesitter.configs'

configs.setup {
ensure_installed = { "cpp", "rust", "c", "lua", "asm"},
highlight = { -- enable highlighting
  enable = true,
},
indent = {
  enable = true, -- default is disabled anyways
}
}

local lspconfig = require('lspconfig')




-- Lua LSP setup
lspconfig.lua_ls.setup {
  on_attach = require('hardes1.lsp_bindings'),
  settings = {
    Lua = {
      runtime = {
        -- LuaJIT in the case of Neovim
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.stdpath('config') .. '/lua'] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.asm_lsp.setup {}
local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected item.
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    }
})


