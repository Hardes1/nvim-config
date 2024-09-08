

require("mason").setup()


local configs = require'nvim-treesitter.configs'

configs.setup {
ensure_installed = { "cpp", "rust", "c", "lua"},
highlight = { -- enable highlighting
  enable = true,
},
indent = {
  enable = true, -- default is disabled anyways
}
}


local bindings = function()
      vim.keymap.set('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
       vim.keymap.set('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
       vim.keymap.set('n','<leader>k','<cmd>lua vim.lsp.buf.hover()<CR>')
       vim.keymap.set('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
       vim.keymap.set('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
       vim.keymap.set('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
       vim.keymap.set('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
       vim.keymap.set('n', '<C-a>', '<cmd>lua vim.lsp.buf.code_action()<CR>')
       vim.keymap.set('n','<leader>ds','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
       vim.keymap.set('n','<leader>ws','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
       vim.keymap.set('n','<leader>r','<cmd>lua vim.lsp.buf.rename()<CR>')
       vim.keymap.set('n','<leader>l', '<cmd>lua vim.lsp.buf.format()<CR>')
       vim.keymap.set('n','<leader>ic','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
       vim.keymap.set('n','<leader>oc','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
  end

local lspconfig = require('lspconfig')




-- Lua LSP setup
lspconfig.lua_ls.setup {
  on_attach = bindings,
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


