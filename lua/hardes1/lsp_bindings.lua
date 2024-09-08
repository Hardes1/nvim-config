local bindings = function()
       vim.keymap.set('n','gD',vim.lsp.buf.declaration)
       vim.keymap.set('n','gd', require('telescope.builtin').lsp_definitions)
       vim.keymap.set('n','<leader>k', vim.lsp.buf.hover)
       vim.keymap.set('n','gr', require('telescope.builtin').lsp_references)
       vim.keymap.set('n','gs', vim.lsp.buf.signature_help)
       vim.keymap.set('n','gi', require('telescope.builtin').lsp_implementations)
       vim.keymap.set('n','gt', require('telescope.builtin').lsp_type_definitions)
       vim.keymap.set('n', '<C-a>', vim.lsp.buf.code_action)
       vim.keymap.set('n','<leader>ds', require('telescope.builtin').lsp_document_symbols)
       vim.keymap.set('n','<leader>ws' ,require('telescope.builtin').lsp_dynamic_workspace_symbols)
       vim.keymap.set('n','<leader>r', vim.lsp.buf.rename)
       vim.keymap.set('n','<leader>l', vim.lsp.buf.format)
end

return bindings
