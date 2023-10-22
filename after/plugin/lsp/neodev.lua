local lsp = require('lsp-zero').preset()
require "lsp-zero".setup()
local neodev = require "neodev"

neodev.setup({
  lsp = {
    on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts) -- open definition of current word in new split
  vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts) -- open declaration of current word in new split
  vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts) -- open implementation of current word in new split
  vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts) -- open references of current word in new split
  vim.keymap.set('n', 'gs', function() vim.lsp.buf.signature_help() end, opts) -- open signature help for fn calling
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts) -- open hover
  vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts) -- open workspace symbol
  vim.keymap.set('n', '<leader>F2', function() vim.lsp.workspace.rename() end, opts) -- workspace rename
  vim.keymap.set('n', 'F2', function() vim.lsp.buf.rename() end, opts) -- buffer rename
  vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end, opts) -- gl
  vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts) -- next diagnostic
  vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts) -- prev diagnostic
  vim.keymap.set('n', '<leader>C', function() vim.lsp.buf.code_action() end, opts) -- code action
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end, opts)
    end
  },
})

local lspconfig = require 'lspconfig'
lspconfig.tsserver.setup {}
-- lspconfig.jsonls.setup()

