vim.g.lsp_zero_api_warnings = 0

local lsp = require('lsp-zero').preset()
lsp.setup_nvim_cmp({
  preselect = 'none',
  completion = {
    completeopt = 'menu,menuone,noselect'
    -- completeopt = 'menu,menuone,noinsert,noselect' --> before
  },
})


lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<leader>ls', function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)

  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end, opts)
  vim.keymap.set('n', '<leader>a', function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set('n', '<leader>lR', function() vim.lsp.buf.rename(vim.fn.input("Rename to -> ")) end, opts)
  vim.keymap.set('n', '<leader>lr', function() vim.lsp.buf.references() end, opts)
  vim.keymap.set('n', '<leader>ld', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', '<leader>li', function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set('n', '<leader>lt', function() vim.lsp.buf.type_definition() end, opts)

  vim.keymap.set('n', '<leader>lw', function() vim.lsp.buf.workspace_symbol(vim.fn.expand("<cword>")) end, opts)
  vim.keymap.set('n', '<F2>', function() vim.lsp.buf.workspace_symbol(vim.fn.expand("<cword>")) end, opts)
  vim.keymap.set('n', '<leader>lW', function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set('n', '<leader>lds', function() vim.lsp.buf.document_symbol() end, opts)

  vim.keymap.set('n', '<leader>lc', function() vim.lsp.buf.completion() end, opts)
  vim.keymap.set('n', '<leader>lwf', function() vim.lsp.buf.add_workspace_folder() end, opts)
  -- execute_command
end)
-------------------------------------

require("mason").setup({})
-- require("mason-lspconfig").setup({
--   ensure_installed = {
--     "tsserver",
--     "jsonls",
--     "emmet_ls",
--     "lua_ls",
--     "tailwindcss",
--     "cssls",
--     "html",
--   },
--   automatic_installation = true,
--   handlers = {
--     lsp.default_setup,
--     tsserver = function()
--       local ts_utils = require("nvim-lsp-ts-utils")
--       require("lspconfig").tsserver.setup({
--         server = 'typescript',
--         init_options = require('nvim-lsp-ts-utils'),
--         settings = {
--           completions = {
--             completeFunctionCalls = true,
--           }
--         },
--         on_attach = function(client, bufnr)
--           client.resolved_capabilities.document_formatting = false
--           client.resolved_capabilities.document_range_formatting = false
--
--           ts_utils.setup({
--             -- eslint_bin = "eslint_d",
--             enable_import_on_completion = true,
--             update_imports_on_move = true,
--             ts_utils.setup_client(client)
--           })
--
--           local opts = { silent = true }
--           vim.api.nvim_buf_set_keymap(bufnr, "n", "to", ":TSLspOrganize<CR>", opts)
--           vim.api.nvim_buf_set_keymap(bufnr, "n", "tr", ":TSLspRenameFile<CR>", opts)
--           vim.api.nvim_buf_set_keymap(bufnr, "n", "ti", ":TSLspImportAll<CR>", opts)
--           -- Enable diagnostic highlighting.
--           vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--             vim.lsp.diagnostic.on_publish_diagnostics, {
--               virtual_text = true,
--               underline = true,
--             }
--           )
--         end
--       })
--     end,
--     emmet_ls = function()
--       require("lspconfig").emmet_ls.setup({
--         filetypes = {
--           "html",
--           "typescriptreact",
--           "javascriptreact",
--         }
--       })
--     end
--   }
-- })

require("neodev").setup()
-------------
local lspconfig = require('lspconfig')

-------------------------------------------------------------------------- dev.to ts config #3
local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      -- callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end
end

-- local function rename_file()
--   local source_file, target_file
--
--   vim.ui.input({
--       prompt = "Source : ",
--       completion = "file",
--       default = vim.api.nvim_buf_get_name(0)
--     },
--     function(input)
--       source_file = input
--     end
--   )
--   vim.ui.input({
--       prompt = "Target : ",
--       completion = "file",
--       default = source_file
--     },
--     function(input)
--       target_file = input
--     end
--   )
--
--   local params = {
--     command = "_typescript.applyRenameFile",
--     arguments = {
--       {
--         sourceUri = source_file,
--         targetUri = target_file,
--       },
--     },
--     title = ""
--   }
--
--   vim.lsp.util.rename(source_file, target_file)
--   vim.lsp.buf.execute_command(params)
-- end


-------------------------------------------------------------------------- dev.to ts config #3

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      workspace = {
        library = { ["/home/boolean/.local/share/nvim/mason/packages/lua-language-server/libexec/meta/5393ac01"] = true },
      }
    }
  }
})
--
lspconfig.jsonls.setup({})
lspconfig.emmet_language_server.setup({
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug",
    "typescriptreact", "typescript" },
  init_options = {
    --- @type table<string, any> https://docs.emmet.io/customization/preferences/
    preferences = {},
    --- @type "always" | "never" defaults to `"always"`
    showexpandedabbreviation = "always",
    --- @type boolean defaults to `true`
    showabbreviationsuggestions = true,
    --- @type boolean defaults to `false`
    showsuggestionsassnippets = true,
    --- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
    syntaxprofiles = {},
    --- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
    variables = {},
    --- @type string[]
    excludelanguages = {},
  },
})
-- from kozer/emmet-language-server:
local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not lspconfig.emmet_language_server then
  configs.emmet_language_server = {
    default_config = {
      cmd = { 'emmet-language-server', '--stdio' },
      filetypes = {
        'html', 'typescriptreact', 'javascriptreact', 'javascript',
        'typescript', 'javascript', 'typescript', 'css'
      },
      root_dir = util.root_pattern("package.json", ".git"),
      settings = {},
    },
  }
end
lspconfig.emmet_ls.setup { capabilities = capabilities, }

lspconfig.emmet_ls.setup({ filetypes = { 'html', 'typescript' } })

-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').cssls.setup {
  capabilities = capabilities,
}
-- TypeScript
-- nvim_lsp.tsserver.setup {
--   on_attach = on_attach,
--   filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
--   cmd = { "typescript-language-server", "--stdio" },
-- }

lspconfig.tsserver.setup({
  server = 'typescript',
  -- init_options = require('nvim-lsp-ts-utils'),
  on_attach = function(client, bufnr)
    local ts_utils = require("nvim-lsp-ts-utils")
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    ts_utils.setup({
      eslint_bin = "eslint_d",
      enable_import_on_completion = true,
      update_imports_on_move = true,
      enable_rename = true,
      enable_code_actions = true,
      enable_formatting = true,
      formatter = "prettier",
      ts_utils.setup_client(client)
    })

    local opts = { silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "to", ":TSLspOrganize<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "tr", ":TSLspRenameFile<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "tia", ":TSLspImportAll<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "ti", ":TSLspImportCurrent<CR>", opts)
    -- Enable diagnostic highlighting.
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        underline = true,
      }
    )
  end,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  -- commands = {
  --   RenameFile = {
  --     rename_file,
  --     description = "Rename File"
  --   }
  -- }
})
----------------------------------
lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    -- name = 'buffer'
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})
