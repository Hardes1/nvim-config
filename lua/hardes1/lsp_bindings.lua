local bindings = function()
       vim.keymap.set('n','gD',vim.lsp.buf.declaration)
       vim.keymap.set('n','gd',vim.lsp.buf.definition)
       vim.keymap.set('n','<leader>k',vim.lsp.buf.hover)
       vim.keymap.set('n','gr',vim.lsp.buf.references)
       vim.keymap.set('n','gs',vim.lsp.buf.signature_help)
       vim.keymap.set('n','gi',vim.lsp.buf.implementation)
       vim.keymap.set('n','gt',vim.lsp.buf.type_definition)
       vim.keymap.set('n', '<C-a>', vim.lsp.buf.code_action)
       vim.keymap.set('n','<leader>ds',vim.lsp.buf.document_symbol)
       vim.keymap.set('n','<leader>ws',vim.lsp.buf.workspace_symbol)
       vim.keymap.set('n','<leader>r',vim.lsp.buf.rename)
       vim.keymap.set('n','<leader>l',vim.lsp.buf.format)
       vim.keymap.set('n','<leader>ic',vim.lsp.buf.incoming_calls)
       vim.keymap.set('n','<leader>oc',vim.lsp.buf.outgoing_calls)
  end

return bindings
