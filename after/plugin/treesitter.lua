require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "tsx", "javascript", "typescript", "lua", "vim", "vimdoc", "query",
    "css", "html", "svelte", "bash", "markdown", "markdown_inline", "regex" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- Commentstring plugin
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  -- Autotag
  autotag = {
    enable = true
  },
  -- Use TreeSitter syntax highlighting
  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner"
      }
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ['f['] = '@function.outer',
        [']]'] = '@class.outer'
      },
      goto_next_end = {
        ['f]'] = '@function.outer',
        [']['] = '@class.outer'
      },
      goto_previous_start = {
        ['b['] = '@function.outer',
        ['[['] = '@class.outer'
      },
      goto_previous_end = {
        ['b]'] = '@function.outer',
        ['[]'] = '@class.outer'
      },
      swap = {
        enable = true,
        swap_next = { ["<leader>xp"] = "@parameter.inner" },
        swap_previous = { ["<leader>xP"] = "@parameter.inner" }
      }
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["<leader>fo"] = "@function.outer",
        ["<leader>oc"] = "@class.outer"
      }
    }
  }
}

vim.treesitter.language.register("bash", "zsh")

-- idk
require('Comment').setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}

vim.g.jsx_pretty_highlight_close_tag = 1
