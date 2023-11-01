return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  config = function()
    local actions = require 'telescope.actions'
    local trouble = require('trouble.providers.telescope')
    local builtin = require('telescope.builtin')
    require('telescope').load_extension('media_files')
    require 'telescope'.setup {
      defaults = {
        mappings = {
          i = { ["<C-t>"] = trouble.open_with_trouble },
          n = { ["<C-t>"] = trouble.open_with_trouble },
        }
      },
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
  end,

}
