return {
  'antosha417/nvim-lsp-file-operations',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-tree.lua",
  },
  config = function()
    vim.api.nvim_set_hl(0, "NvimTreeDiagnosticError", { fg = "#cc5555" })
    require("nvim-tree").setup {
      modified = {
        enable = true,
      },
      git = {
        enable = true,
      },
      diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "", -- edited = "", opened = "", open = "📖"
        }
      },
      view = {
        relativenumber = true,
        width = 35
      },
      renderer = {
        highlight_diagnostics = true,
        highlight_git = false,
        highlight_modified = "icon",
        -- highlight_opened_files = "cmd"
        icons = {
          web_devicons = {
            folder = {
              enable = true
            }
          }
        }
      },
      filters = {
        dotfiles = true
      }
    }
    vim.api.nvim_set_hl(0, "NvimTreeDiagnosticError", { fg = "#cc5555" })

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.api.nvim_set_hl(0, "NvimTreeDiagnosticError", { fg = "#cc5555" })
      end
    })

    local function open_file_in_vertical_split()
      local tree = require 'nvim-tree.view'
      local node = tree.get_node_at_cursor()
      if node then
        vim.cmd('vsp ' .. vim.fn.fnameescape(node.absolute_path))
      end
    end

    local function open_file_in_horizontal_split()
      local tree = require 'nvim-tree.view'
      local node = tree.get_node_at_cursor()
      if node then
        vim.cmd('sp ' .. vim.fn.fnameescape(node.absolute_path))
      end
    end

    vim.api.nvim_set_keymap('n', '<leader>v', "<cmd>lua open_file_in_vertical_split()<CR>",
      { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>h', "<cmd>lua open_file_in_horizontal_split()<CR>",
      { noremap = true, silent = true })
  end
}
