-- Load the LuaSnip module
local ls = require 'luasnip'
require("luasnip.loaders.from_vscode").lazy_load()
-- Key mappings for insert mode
vim.api.nvim_set_keymap('i', '<C-K>', [[<Cmd>lua require'luasnip'.expand()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-L>', [[<Cmd>lua require'luasnip'.jump(1)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-J>', [[<Cmd>lua require'luasnip'.jump(-1)<CR>]], { noremap = true, silent = true })

-- Key mapping for insert mode with a conditional
vim.api.nvim_set_keymap('i', '<C-E>',
  [[<Cmd>lua if require'luasnip'.choice_active() then require'luasnip'.change_choice(1) end<CR>]],
  { noremap = true, silent = true })

-- Key mappings for select mode (s)
vim.api.nvim_set_keymap('s', '<C-K>', [[<Cmd>lua require'luasnip'.expand()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('s', '<C-L>', [[<Cmd>lua require'luasnip'.jump(1)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('s', '<C-J>', [[<Cmd>lua require'luasnip'.jump(-1)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('s', '<C-E>',
  [[<Cmd>lua if require'luasnip'.choice_active() then require'luasnip'.change_choice(1) end<CR>]],
  { noremap = true, silent = true })

local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
local date = function() return { os.date('%Y-%m-%d') } end

ls.snippets = {
  all = {
    snip({
      trig = "date",
      name = "Date",
      dscr = "Date in the form of YYYY-MM-DD",
    }, {
      insert(1, { os.date('%Y-%m-%d') }),
    }),
  },
}
