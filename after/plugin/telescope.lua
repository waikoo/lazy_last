local builtin = require('telescope.builtin')
require('telescope').load_extension('media_files')
require 'telescope'.setup {
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webp", "jpg", "jpeg" },
      -- find command (defaults to `fd`)
      find_cmd = "rg"
    }
  },
}

-- Copy file path to clipboard
vim.keymap.set('n', '<leader>fi', ":lua require('telescope').extensions.media_files.media_files()<CR>",
  { noremap = true, silent = true })
-- Old files
vim.keymap.set('n', '<leader>po', builtin.oldfiles, {})

-- Command history
vim.keymap.set('n', '<leader>pc', builtin.command_history, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- Git-Project grep & find files
vim.keymap.set('n', '<leader>pp', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>pf', function()
--   builtin.find_files({
--     cwd = '~/Pro/thrifty-bun/'
--   })
-- end, { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pf',
  "<cmd>lua require('telescope.builtin').find_files({ cwd = '~/Pro/thrifty-bun/' })<CR>",
  { noremap = true, silent = true })


vim.keymap.set('n', '<leader>pg', function()
  builtin.live_grep({
    cwd = '~/Pro/thrifty-bun/'
  })
end, { noremap = true, silent = true })

-- Grep
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)


-- Location grep and find files
vim.keymap.set('n', '<leader>lg', function()
  builtin.live_grep({
    cwd = vim.fn.getcwd()
  })
end, { noremap = true }
)

vim.keymap.set('n', '<leader>lf', function()
  builtin.find_files({
    cwd = vim.fn.getcwd()
  })
end, { noremap = true }
)

-- Nvim grep & find files
vim.keymap.set('n', '<leader>nf', function()
  builtin.find_files({
    cwd = '/home/boolean/.config/nvim/'
  })
end, {})

vim.keymap.set('n', '<leader>ng', function()
  builtin.live_grep({
    cwd = '/home/boolean/.config/nvim/'
  })
end, { noremap = true }
)

-- Fuzzily find zsh files
vim.keymap.set('n', '<leader>zf', function()
  builtin.find_files({
    cwd = '/home/boolean/.config/zsh/',
    hidden = true,
  })
end, {})

vim.keymap.set('n', '<leader>zg', function()
  builtin.live_grep({
    cwd = '/home/boolean/.config/zsh/',
  })
end, { noremap = true }
)

-- -- Fuzzily find kitty files
-- vim.keymap.set('n', '<leader>cf', function()
--   builtin.find_files({
--     cwd = '/home/boolean/.config/',
--   })
-- end, { noremap = true })

-- Open buffers in telescope
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>b', ':lua Buffers<CR>', {})
-- vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>', { noremap = true, silent = true })

-- -- See `:help telescope.builtin`
-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
-- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
-- vim.keymap.set('n', '<leader>/', function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, { desc = '[/] Fuzzily search in current buffer' })
--
-- vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
-- vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
-- vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })


-- local renameAcrossWorkspace()
--   local newName = vim.fn.input('New name -> ')
--   local position_params = vim.lsp.util.make_position_params()
--
--   position_params.newName = newName
--
--   vim.lsp.buf_request(0, 'textDocument/rename', position_params, function(err, method, result, ...)
--     print(vim.inspect(result))
--     print "Renaming..."
--     vim.lsp.handlers["textDocument/rename"](err, method, result, ...)
--     print "... renaming done!"
--   end)
