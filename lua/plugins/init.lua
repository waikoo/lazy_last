return {
  {
    'LunarVim/lunar.nvim',
    -- priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme 'lunar'
    -- end,
  },
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'nvim-tree/nvim-web-devicons',
  'lambdalisue/glyph-palette.vim',
  'nvim-treesitter/nvim-treesitter-refactor',
  'mbbill/undotree',
  'windwp/nvim-ts-autotag',
  'VonHeikemen/lsp-zero.nvim',
  'jose-elias-alvarez/nvim-lsp-ts-utils',
  'dmmulroy/tsc.nvim',
  'mattn/emmet-vim',
  'MaxMEllon/vim-jsx-pretty',
  'hrsh7th/cmp-buffer',
  'folke/trouble.nvim',
  'rcarriga/nvim-notify',
  'theprimeagen/harpoon',
  'nvim-telescope/telescope-ui-select.nvim',
  'nvim-telescope/telescope-media-files.nvim',
  'nvim-lua/popup.nvim',
  'szw/vim-maximizer',
  'unblevable/quick-scope',
  "lukas-reineke/indent-blankline.nvim",
  'junegunn/fzf.vim',
  "folke/flash.nvim",
  'tpope/vim-obsession',
  'christoomey/vim-tmux-navigator',
  'romgrk/barbar.nvim',

  "napmn/react-extract.nvim",
  'machakann/vim-sandwich',
  'AndrewRadev/splitjoin.vim',
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },
  -- -- optiona-- lua with packer.nvim
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({})
    end,
  },

  {
    'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup {} end
  },

  {
    'max397574/colortils.nvim',
    cmd = "Colortils",
    config = function()
      require("colortils").setup()
    end,
  },

  {
    'ziontee113/color-picker.nvim',
    config = function() require('color-picker').setup() end
  },
  -- NOTE: This is where your plugins related to LSP can be installed.
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    }
  },

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = { -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} }, -- Useful status updates for LSP NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      'folke/neodev.nvim',                                -- Additional lua configuration, makes nvim stuff amazing!
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'Exafunction/codeium.vim',

    config = function()
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
      -- vim.g.codeium_exclude_dirs = { '/home/boolean/.password-store'}
      -- vim.g.codeium_exclude_files = { '*.txt' }
      vim.g.codeium_filetypes = {
        txt = false
      }
      vim.g.codeium_enabled = true
    end
  },
  'zhenyangze/vim-bitoai',

  {
    'NvChad/nvim-colorizer.lua', --------------------------------------------> needs setup
    config = function()
      require('colorizer').setup({
        css = {
          mode = 'background',
          tailwind = true,
          css = true
        },
      })
    end
  },

  {
    'laytan/tailwind-sorter.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
    config = function()
      require('tailwind-sorter').setup({
        on_save_enabled = true,                                                                                    -- If `true`, automatically enables on save sorting.
        on_save_pattern = { '*.html', '*.js', '*.jsx', '*.tsx', '*.twig', '*.hbs', '*.php', '*.heex', '*.astro' }, -- The file patterns to watch and sort.
        node_path = 'node',
      })
    end,
    build = 'cd formatter && npm i && npm run build',
  },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
        vim.keymap.set({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
      end,
    },
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',

    },
    build = ':TSUpdate',
  },
}
