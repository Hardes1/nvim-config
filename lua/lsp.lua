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


local custom_attach = function(client)
  local map = function(type, key, value)
	  vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
  end

	map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
	map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
	map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
	map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
	map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
	map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
	map('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
	map('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
	map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end


local lspconfig = require('lspconfig') 
lspconfig["rust_analyzer"].setup {
  on_attach = custom_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      }
    }
  }
}

local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    }
})

