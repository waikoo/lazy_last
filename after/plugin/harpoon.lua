local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Add current file to harpoon
vim.api.nvim_set_keymap('n', '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>',
  { silent = true, noremap = true })

-- Toggle quick menu
vim.api.nvim_set_keymap('n', '<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
  { silent = true, noremap = true })

-- Cycle left and right
vim.api.nvim_set_keymap('n', '<leader>hl', ':lua require("harpoon.ui").nav_next()<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>hh', ':lua require("harpoon.ui").nav_prev()<CR>', { silent = true, noremap = true })

-- Harpoon to 8 files
vim.api.nvim_set_keymap('n', '<leader>h1', ':lua require("harpoon.ui").nav_file(1)<CR>',
  { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>h2', ':lua require("harpoon.ui").nav_file(2)<CR>',
  { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>h3>', ':lua require("harpoon.ui").nav_file(3)<CR>',
  { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>h4>', ':lua require("harpoon.ui").nav_file(4)<CR>',
  { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>h5>', ':lua require("harpoon.ui").nav_file(5)<CR>',
  { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>h6>', ':lua require("harpoon.ui").nav_file(6)<CR>',
  { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>h7>', ':lua require("harpoon.ui").nav_file(7)<CR>',
  { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>h8>', ':lua require("harpoon.ui").nav_file(8)<CR>',
  { silent = true, noremap = true })
