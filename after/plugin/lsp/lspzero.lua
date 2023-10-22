local lspconfig = require('lspconfig')
lspconfig.tsserver.setup({
  server = 'typescript',
  on_attach = function(client, bufnr)
    -- Enable diagnostic highlighting.
    vim.lsp.diagnostic.enable(bufnr, {
      virtual_text = true
    })
    vim.lsp.diagnostic.show_line_diagnostics(bufnr)
  end,
})
