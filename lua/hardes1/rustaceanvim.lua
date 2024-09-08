
vim.g.rustaceanvim = {
   server = {
     on_attach = function(client, bufnr)
       vim.keymap.set("n", "<c-A>", function() vim.cmd.RustLsp('codeAction') end,{ silent = true, buffer = bufnr })  
       vim.keymap.set("n", "<c-R>", function() vim.cmd.RustLsp('runnables') end,{ silent = true, buffer = bufnr })
       vim.keymap.set("n", "<c-D>", function() vim.cmd.RustLsp('debuggables') end,{ silent = true, buffer = bufnr })
       require('hardes1.lsp_bindings')()
    end
   }
}
