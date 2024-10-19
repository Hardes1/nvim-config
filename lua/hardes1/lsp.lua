

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

lspconfig.clangd.setup {
  on_attach = require('hardes1.lsp_bindings'),
  filetypes = { "c", "cpp", "objc", "objcpp" },
  single_file_support = true
}


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



local cmp = require('cmp')
local luasnip = require('luasnip')
cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
        end,
  },
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            if luasnip.expandable() then
                luasnip.expand()
            else
                cmp.confirm({
                    select = true,
                })
            end
        else
            fallback()
        end
     end),
    ["<Tab>"] = cmp.mapping(function(fallback)
      -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        end
        cmp.confirm()
      else
        fallback()
      end
    end, {"i","s","c",})
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    }
})


