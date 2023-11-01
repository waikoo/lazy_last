return {
  {
    'LunarVim/lunar.nvim',
    priority = 1000,
    config = function()
      -- vim.api.nvim_set_hl(0, "@css_classname", { fg = "#ec82f2" })
      -- vim.api.nvim_set_hl(0, "@css_plain_value", { fg = "#ea8346" })
      --
      -- -- javascript
      -- vim.api.nvim_set_hl(0, "@method.call", { fg = "#7aa2f7", bg = nil })
      -- vim.api.nvim_set_hl(0, "function", { fg = "#edd15b", bg = nil })
      -- vim.api.nvim_set_hl(0, "@operator", { fg = "#FFFFFF", bg = nil })
      -- vim.api.nvim_set_hl(0, "@parameter", { fg = "#ff8e64", bg = nil })
      -- vim.api.nvim_set_hl(0, "@include", { fg = "#cb7df2", bg = nil })
      -- vim.api.nvim_set_hl(0, "NvimTreeDiagnosticError", { fg = "#cc5555", bg = nil })
      -- vim.api.nvim_set_hl(0, "BufferCurrent", { fg = "#fbd05a", bg = nil })
      -- vim.api.nvim_set_hl(0, "BufferCurrentSign", { bg = nil })
      -- vim.api.nvim_set_hl(0, "BufferTabpageFill", { bg = nil })
      vim.cmd.colorscheme 'lunar'
    end,
  },
  {
    "michaelb/sniprun",
    branch = "master",

    build = "sh install.sh",
    -- do 'sh install.sh 1' if you want to force compile locally
    -- (instead of fetching a binary from the github release). Requires Rust >= 1.65

    config = function()
      require("sniprun").setup({
        selected_interpreters = { "JS_TS_deno" },
        repl_enable = { "JS_TS_deno" }
      })
    end,
  },
  'RRethy/vim-illuminate',
  {
    'gelguy/wilder.nvim',
  },
  {
    'vuki656/package-info.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
      require('package-info').setup()
    end
  },
  'uga-rosa/ccc.nvim',
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
  {
    'theprimeagen/harpoon',
    config = function()
      require("harpoon").setup({
        save_on_toggle = true,
        tabline = true,
      })
    end
  },
  'nvim-telescope/telescope-ui-select.nvim',
  'nvim-telescope/telescope-media-files.nvim',
  'nvim-lua/popup.nvim',
  'szw/vim-maximizer',
  'unblevable/quick-scope',
  "lukas-reineke/indent-blankline.nvim",
  'junegunn/fzf.vim',
  'christoomey/vim-tmux-navigator',
  'romgrk/barbar.nvim',

  {
    "napmn/react-extract.nvim",
    config = function()
      require("react-extract").setup()
    end
  },
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
      { 'roobert/tailwindcss-colorizer-cmp.nvim', config = true },
      opts = function(_, opts)
        local format_kinds = opts.formatting.format
        opts.formatting.format = function(entry, item)
          format_kinds(entry, item)
          return require("tailwindcss-rolorizer-cmp").formatter(entry, item)
        end
      end,
      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },
  {
    'stevearc/dressing.nvim',
    opts = {
      input = {
        enabled = true
      }
    },
    -- config = function()
    --   require('dressing').setup()
    -- end
  },
  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup()
    end
  },
  {
    {
      'folke/trouble.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      opts = {

      }
    },
  },
  {
    "SmiteshP/nvim-navic",
    dependencies =
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navbuddy"

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
  {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  },
  {
    'NvChad/nvim-colorizer.lua', --------------------------------------------> needs setup
    opts = {
      user_default_options = {
        tailwind = true,
      },
    }
  },

  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
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
        theme = 'lunar',
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
