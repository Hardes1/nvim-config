
vim.g.rustaceanvim = {
   server = {
     on_attach = function(client, bufnr)
      local bufnr = vim.api.nvim_get_current_buf()
       vim.keymap.set("n", "<c-A>", function() vim.cmd.RustLsp('codeAction') end,{ silent = true, buffer = bufnr })  
       vim.keymap.set("n", "<c-R>", function() vim.cmd.RustLsp('runnables') end,{ silent = true, buffer = bufnr })
       vim.keymap.set("n", "<c-D>", function() vim.cmd.RustLsp('debuggables') end,{ silent = true, buffer = bufnr })
       vim.keymap.set('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
       vim.keymap.set('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
       vim.keymap.set('n','k','<cmd>lua vim.lsp.buf.hover()<CR>')
       vim.keymap.set('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
       vim.keymap.set('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
       vim.keymap.set('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
       vim.keymap.set('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
       vim.keymap.set('n','<leader>ds','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
       vim.keymap.set('n','<leader>ws','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
       vim.keymap.set('n','<leader>r','<cmd>lua vim.lsp.buf.rename()<CR>')
       vim.keymap.set('n','<leader>l', '<cmd>lua vim.lsp.buf.format()<CR>')
       vim.keymap.set('n','<leader>ic','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
       vim.keymap.set('n','<leader>oc','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
    end
   }
}
