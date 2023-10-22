require("react-extract").setup()

vim.api.nvim_set_keymap('v', '<Leader>rn', ':lua require("react-extract").extract_to_new_file()<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>rc', ':lua require("react-extract").extract_to_current_file()<CR>',
  { noremap = true, silent = true })
