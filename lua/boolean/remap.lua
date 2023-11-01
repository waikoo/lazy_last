-- print('-------------------------------------')
require("boolean.functions")

vim.g.mapleader = " "
-- Save in insert mode
vim.api.nvim_set_keymap('i', '<C-s>', '<ESC>:w<CR>a', { silent = true, noremap = true })
-- Disable highlights
vim.api.nvim_set_keymap('n', '<leader>H', ':noh<CR>', { silent = true })
-- Move to previous/next line when pressing h on the first/last character of a line
vim.api.nvim_set_keymap('n', 'h', [[col('.') == 1 ? 'k$' : 'h']], { expr = true, noremap = true })
vim.api.nvim_set_keymap('n', 'l', [[col('.') == col('$') - 1 ? 'j0' : 'l']], { expr = true, noremap = true })

-- Copy absolute path of current file to clipboard
vim.api.nvim_set_keymap('n', '<leader>pa', ':let @+ = expand("%:p")<CR>', {})

-- PrimeagenPaste - local + system clipboard
vim.api.nvim_set_keymap("x", "<leader>p", "\"_dP", {})
vim.api.nvim_set_keymap("x", "<leader>P", "\"_d\"+P", {})

-- Cursor in middle when half page navigating
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", {})
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", {})

-- Keep searched term in the middle
vim.api.nvim_set_keymap("n", "n", "nzzzv", {})
vim.api.nvim_set_keymap("n", "N", "Nzzzv", {})

-- Yank to system clipboard
vim.api.nvim_set_keymap("n", "<leader>y", "\"+y", { silent = true, noremap = true })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { silent = true, noremap = true })

-- Paste from clipboard
vim.api.nvim_set_keymap("n", "<leader>P", "\"+p", {})
vim.api.nvim_set_keymap("i", "<leader>p", "\"+p", {})

-- Delete to void register
vim.api.nvim_set_keymap("n", "<leader>d", "\"_d", {})
vim.api.nvim_set_keymap("v", "<leader>d", "\"_d", {})

-- Copy to system clipboard in visual mode and delete text object to void
vim.api.nvim_set_keymap("v", "<leader>D", [["+y"_d]], { silent = true })
vim.api.nvim_set_keymap("n", "<leader>D", [["+y"_d]], { silent = true })

-- Replace word under cursor
vim.api.nvim_set_keymap("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", {})

-- Make current file executable
vim.api.nvim_set_keymap("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true })

-- Toggle comments on the current line or visual selection
vim.api.nvim_set_keymap('n', '<leader>/', '<cmd>lua require("comment").toggle()<CR>', { noremap = true })
vim.api.nvim_set_keymap('x', '<leader>/', '<cmd>lua require("comment").toggle()<CR>', { noremap = true })

-- LSP Format
vim.api.nvim_set_keymap("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", {})

-- Unknown PrimeagenSets
vim.api.nvim_set_keymap("n", "Q", "<nop>", {})
vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", {})

-- Quickfix navigation --> :cc 2 -> brings you to the 2nd quickfix list item
vim.api.nvim_set_keymap('n', '<C-M-m>', ':cnext<CR>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-M-n>', ':cprev<CR>zz', { noremap = true, silent = true })

-- -- Locationlist navigation
-- vim.api.nvim_set_keymap('n', '<C-M>m', ':lnext<CR>zz', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-M>n', ':lprev<CR>zz', { noremap = true, silent = true })

-- Replace names in current project
vim.api.nvim_set_keymap('n', '<Leader>=', ":lua require('boolean.functions').renameAcrossWorkspace()<CR>",
  { silent = true })

------------------------------------------------------------------------------------ Line Manipulation Start

-- Copy line up - down
vim.api.nvim_set_keymap('n', '<C-M>j', 'yyp', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-M>k', 'yyP', { noremap = true, silent = true })

-- Move lines n + v mode
vim.api.nvim_set_keymap('n', '<M-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-k>', ':m .-2<CR>==', { noremap = true, silent = true })

-- Move lines in visual mode
vim.api.nvim_set_keymap('x', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Duplicate line or visual selection in normal and visual mode
vim.api.nvim_set_keymap('n', '<C-M-j>', ':t .+0<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-M-k>', ':t .-1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<C-M-j>', ':t \'>+1<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<C-M-k>', ':t \'<-2<CR>gv=gv', { noremap = true, silent = true })

-- Copy and move line(s) by line number
vim.api.nvim_set_keymap('n', '<Leader>m',
  ":lua require('boolean.functions').moveOrCopyLines('m', require('boolean.functions').getInput('Move lines to: '))<CR>",
  { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>C',
  ":lua require('boolean.functions').moveOrCopyLines('t', require('boolean.functions').getInput('Copy lines to: '))<CR>",
  { silent = true })
vim.api.nvim_set_keymap('x', '<Leader>m',
  ":lua require('boolean.functions').moveOrCopyLines('m', require('boolean.functions').getInput('Move lines to: '))<CR>",
  { silent = true })
vim.api.nvim_set_keymap('x', '<Leader>C',
  ":lua require('boolean.functions').moveOrCopyLines('t', require('boolean.functions').getInput('Copy lines to: '))<CR>",
  { silent = true })

------------------------------------------------------------------------------------ Line Manipulation End

------------------------------------------------------------------------------------ Split Manipulation Start

-- Resize vertical split
vim.api.nvim_set_keymap('n', '<Leader><Up>', '<C-w>5+', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader><Down>', '<C-w>5-', { noremap = true })

-- Resize horizontal split
vim.api.nvim_set_keymap('n', '<Leader><Left>', '<C-w>5<', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader><Right>', '<C-w>5>', { noremap = true })

-- MaximizerToggle
vim.api.nvim_set_keymap('n', '<C-w>m', ':MaximizerToggle<CR>', { silent = true })
vim.api.nvim_set_keymap('v', '<C-w>m', ':MaximizerToggle<CR>gv', { silent = true })
vim.api.nvim_set_keymap('i', '<C-w>m', '<C-o>:MaximizerToggle<CR>', { silent = true })

------------------------------------------------------------------------------------- Split Manipulation End

-- Bito Custom Prompt
vim.api.nvim_set_keymap('n', '<Leader>bp', ':lua require("boolean.functions").M.customPrompt()<CR>',
  { noremap = true, silent = true })

-- Splitjoin plugin
vim.api.nvim_set_keymap('n', 'gS', ':silent! SplitjoinSplit<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', 'gJ', ':silent! SplitjoinJoin<CR>', { silent = true, noremap = true })

-- Typescript Keymaps
vim.api.nvim_set_keymap('n', '<Leader>ti', ':lua require("typescript").actions.addMissingImports()<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>to', ':lua require("typescript").actions.organizeImports()<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tR', ':lua require("typescript").actions.removeUnused()<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tt', ':lua require("typescript").actions.fixAll()<CR>',
  { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>tr', ':lua require("typescript").renameFile(vim.fn.expand("%:p"), "")<Left><Left>',
  { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<leader>td', [[<Cmd>lua
local winnr = vim.fn.winnr()
local opts = { fallback = true }
vim.cmd('TypescriptGoToSourceDefinition ' .. winnr .. ' ' .. vim.inspect(opts))
<CR>]]
, { silent = true })

vim.api.nvim_set_keymap('n', '<C-m>', '<Plug>MarkdownPreviewToggle', { noremap = true, silent = true })

-- Refresh, resource nvim config
vim.api.nvim_set_keymap('n', '<leader>rr', ':source $MYVIMRC<CR>', { noremap = true, silent = true })

-- Telescope open in split
vim.api.nvim_set_keymap('n', "<leader>L", ':vsp<CR>:lua require("telescope.builtin").find_files()<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>J', ':sp<CR>:lua require("telescope.builtin").find_files()<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<leader>l", ':vsp<CR>:lua require("telescope.builtin").git_files()<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':sp<CR>:lua require("telescope.builtin").git_files()<CR>',
  { noremap = true, silent = true })

-- Close split
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>',
  { noremap = true, silent = true })

-- Colortils Open Editor While On Value
vim.api.nvim_set_keymap('n', '<leader>o', ':Colortils<CR>', { noremap = true, silent = true })

-- ColorPicker
vim.api.nvim_set_keymap('n', '<leader>ct', ':CccToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cc', ':CccConvert<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cp', ':CccPick<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>cp', ':PickColor<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<leader>ci', ':PickColorInsert<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>cr', ':ConvertHEXandRGB<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ch', ':ConvertHEXandHSL<CR>', { noremap = true, silent = true })


-- Substitute HSL for Tailwind-compatible syntax in *.css files
vim.api.nvim_set_keymap('n', '<leader>ct', ':%s/hsl(\\(\\d\\+\\), \\(\\d\\+\\)%, \\(\\d\\+\\)%);/\\1deg \\2% \\3%;/g<CR>',
  { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>cb', ':%s/\\(\\d\\+\\)deg \\(\\d\\+\\)% \\(\\d\\+\\)%;/hsl(\\1, \\2%, \\3%);/g<CR>',
  { noremap = true, silent = true }
)

-- Focus split
-- vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true }) -- focus down split
-- vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true }) -- focus up split
-- vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true }) -- focus left split
-- vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true }) -- focus right split

-- OPEN FILES / SPLIT / MOVE END ---------------------------------------

-- Close split
vim.api.nvim_set_keymap('n', '<leader>q', ':close<CR>', { noremap = true, silent = true }) -- close split


-- Define a Lua function to open to the right
function OpenToRight()
  -- Enter Visual mode
  vim.cmd('normal v')
  local path = vim.fn.expand('%:p')
  print(path) -- You can use 'print' instead of 'echo'
  vim.cmd('q!')

  -- Open a new vertical split to the right with the stored path
  vim.cmd('belowright vnew ' .. path)

  -- Adjust the window size (optional)
  vim.cmd('normal <C-l>')
end

-- Define a Lua function to open below
function OpenBelow()
  -- Enter Visual mode
  vim.cmd('normal v')

  -- Get the current file path and store it in a variable
  local path = vim.fn.expand('%:p')

  -- Close the current window
  vim.cmd('q!')

  -- Open a new horizontal split below with the stored path
  vim.cmd('belowright new ' .. path)

  -- Adjust the window size (optional)
  vim.cmd('normal <C-l>')
end

-- NvimTree
vim.api.nvim_set_keymap('n', '<leader>pe', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>\\', ':lua OpenToRight()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>/', ':lua OpenBelow()<CR>', { noremap = true, silent = true })

-- Gdiff
vim.api.nvim_set_keymap('n', '<leader>d', ':Gdiffsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dv', ':Gvdiffsplit<CR>', { noremap = true, silent = true })
-- Git commit

vim.api.nvim_set_keymap('n', '<leader>gc', ":lua require('boolean.functions').commit_with_message()<CR>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gi', ':G<CR>', { noremap = true, silent = true })

-- Tabline toggle
function toggle_tabline()
  if vim.o.showtabline == 0 then
    vim.o.showtabline = 2
  else
    vim.o.showtabline = 0
  end
end

-- Tabline toggle
vim.api.nvim_set_keymap('n', '<leader>bt', ':lua toggle_tabline()<CR>', { silent = true })

-- Move between buffers
vim.api.nvim_set_keymap('n', '<leader>bn', ':bn<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>bp', ':bp<CR>', { silent = true })

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Package-info
vim.api.nvim_set_keymap("n", "<leader>ns", "<cmd>lua require('package-info').show()<cr>",
  { silent = true, noremap = true }
)

vim.api.nvim_set_keymap('v', '<Leader>re', '<Cmd>lua require("react-extract").extract_to_new_file()<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>rc', '<Cmd>lua require("react-extract").extract_to_current_file()<CR>',
  { noremap = true, silent = true })
-- React extract


-- Unmap <C-k> from luasnip
vim.api.nvim_set_keymap('s', '<C-k>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('s', '<leader>le', '<Cmd>lua require("luasnip").expand()<CR>', { noremap = true, silent = true })

-- Code Action Menu
vim.api.nvim_set_keymap('n', '<leader>ca', ':CodeActionMenu<CR>', { noremap = true, silent = true })
