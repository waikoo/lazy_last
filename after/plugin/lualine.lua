require('lualine').setup {
  sections = {
    lualine_b = {
      {
        function()
          return vim.fn["codeium#GetStatusString"]()
        end,
        -- color = { fg = '#FFC6F8', bg = 'black' },
        -- separator = "",
      }
    },
    lualine_c = { 'filename' },
    lualine_i = { 'showcmdlocation' },
  }
}
