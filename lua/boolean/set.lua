-- print('!!!!!!!!!!!!!!!')
-- Set leader key
vim.g.mapleader = " "

-- Substitutions in split window
vim.cmd('set inccommand="split"')

-- Always open on right side
-- vim.cmd('set splitright')
vim.o.splitright = true
vim.o.splitbelow = true

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Confirm writes
vim.cmd('set confirm')

-- No backup so no Enter
vim.cmd([[set nobackup]])
vim.cmd([[set nowritebackup]])

-- No -- INSERT --
vim.o.showmode = false

-- Lower cmdheight
vim.o.cmdheight = 1

-- Global status line
vim.opt.laststatus = 3

-- Treesitter context
vim.opt.foldmethod = 'manual'
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- Smaller timeout (were 500 before)
vim.opt.ttimeoutlen = 100
vim.opt.timeoutlen = 250

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.api.nvim_command('set t_Co=256')

-- Line cursor
vim.cmd('set cursorline')

-- Show line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'
-- vim.opt.statuscolumn = "%l %r"

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Disable infinite line
vim.o.breakindent = true

-- Tab settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Enable text wrap
vim.opt.wrap = true

-- Undo and backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- -- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- -- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

vim.opt.wildmenu = true                -- Enable wildmenu for enhanced file and directory selection
vim.opt.wildmode = 'longest:full,full' -- Set wildmode to display matching files and directories
vim.opt.wildcharm = 26                 -- Set the wildcharm option to a non-printable character (such as <C-Z>) to enable filename completion in command-line mode
vim.opt.autochdir = true               -- Set 'autochdir' to automatically change the working directory to the directory of the current file

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Set split height-width by mouse
vim.opt.mouse = 'a'
vim.g.mouse_tty = true
-- hi yo
-- Write all buffers before navigating from Neovim to tmux pane
vim.g.tmux_navigator_save_on_switch = 2

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 250

-- Add path to zsh config folder so gf works
vim.opt.path:append('/home/boolean/.config/zsh')
-- vim.opt.path:append(os.getenv("PROJECT_DIR"))
-- vim.wo.foldcolumn = -1

-- Include cwd and subdirs in path
vim.api.nvim_set_option('path', vim.fn.getcwd() .. ',**')

-- Cursor settings
-- vim.opt.cursorcolumn = true
-- vim.opt.cursorline = true

-- -- Disable netrw banner
-- vim.g.netrw_banner = 0
--
-- -- Set netrw list style to 3
-- vim.g.netrw_liststyle = 3
--
-- -- Set netrw browse split to 4
-- vim.g.netrw_browse_split = 4
--
-- -- Set netrw winsize to 20
-- vim.g.netrw_winsize = 20
--
-- -- Recommended by netrw docs
-- vim.cmd('filetype plugin on')
vim.cmd('set nocompatible')

-- -- Automatically run fern when starting neovim in a directory
-- vim.cmd [[autocmd VimEnter * if isdirectory(expand('%')) | execute 'Fern .' | endif]]

vim.cmd('colorscheme lunar')
-- vim.opt.background = 'dark'
