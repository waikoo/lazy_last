vim.cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')

-- Custom highlights
vim.api.nvim_exec([[
augroup MyColors
    autocmd!
    autocmd ColorScheme * lua EnhanceLunar()
    au! FileType bito set syntax=javascript
    autocmd bufwritepost tmux.conf execute ':!tmux source-file %'
    autocmd FileType tmux.conf setlocal noundofile
    " autocmd CursorMovedI,InsertLeave * lua ShowSignatureHelp()
    autocmd BufWritePre * lua vim.lsp.buf.format()
    autocmd BufWritePost *.css lua vim.defer_fn(function() vim.cmd(':silent! write') end, 300)
    autocmd! User FugitiveEditor wincmd L
    autocmd Signal SIGUSR1 source $MYVIMRC
]], false)

-- autocmd BufWritePre *.ts,*.tsx lua require('boolean.functions').checkTypeScriptErrors()

function EnhanceLunar()
  -- Check if the current colorscheme is 'lunar'
  if vim.g.colors_name == "lunar" then
    -- css
    vim.api.nvim_set_hl(0, "@css_classname", { fg = "#ec82f2" })
    vim.api.nvim_set_hl(0, "@css_plain_value", { fg = "#ea8346" })

    -- javascript
    vim.api.nvim_set_hl(0, "@method.call", { fg = "#7aa2f7", bg = nil })
    vim.api.nvim_set_hl(0, "function", { fg = "#edd15b", bg = nil })
    vim.api.nvim_set_hl(0, "@operator", { fg = "#FFFFFF", bg = nil })
    vim.api.nvim_set_hl(0, "@parameter", { fg = "#ff8e64", bg = nil })
    vim.api.nvim_set_hl(0, "@include", { fg = "#cb7df2", bg = nil })
    vim.api.nvim_set_hl(0, "NvimTreeDiagnosticError", { fg = "#cc5555", bg = nil })
    vim.api.nvim_set_hl(0, "BufferCurrent", { fg = "#fbd05a", bg = nil })
    vim.api.nvim_set_hl(0, "BufferCurrentSign", { bg = nil })
    vim.api.nvim_set_hl(0, "BufferTabpageFill", { bg = nil })
    -- vim.api.nvim_set_hl(0, "@comments", { fg = "#303030", bg = nil })
  end
end

function ShowSignatureHelp()
  if vim.fn.pumvisible() == 0 then
    vim.lsp.buf.signature_help()
  end
end

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
