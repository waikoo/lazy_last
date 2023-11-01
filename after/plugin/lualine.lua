-- #1
local function get_file_icon()
  local filename = vim.fn.expand('%:t')
  local extension = vim.fn.expand('%:e')
  local devicons = require('nvim-web-devicons')
  local icon = devicons.get_icon(filename, extension)
  local icon_color = devicons.get_icon_color(filename, extension)

  local icon_highlight = '%#' .. icon_color .. '#' .. icon .. '%*'
  local filename_text = ' ' .. filename

  -- Add custom highlight groups for specific file extensions
  if extension == 'tsx' then
    icon_highlight = '%#myTSX#' .. icon .. '%*'
  elseif extension == 'lua' then
    icon_highlight = '%#myLua#' .. icon .. '%*'
  elseif extension == 'css' then
    icon_highlight = '%#myCSS#' .. icon .. '%*'
  elseif extension == 'js' then
    icon_highlight = '%#myJS#' .. icon .. '%*'
  end

  return icon_highlight .. filename_text
end



local function get_branch_icon()
  local branch = vim.fn.FugitiveHead()
  local icon = ''

  local icon_highlight = '%#DevIconGit#' .. icon .. '%*'
  local branch_text = ' ' .. branch
  return icon_highlight .. branch_text
end

require('lualine').setup {
  sections = {
    lualine_b = { function() return vim.fn["codeium#GetStatusString"]() end, },
    -- lualine_c = { 'filename', 'branch' },
    lualine_c = { get_file_icon, get_branch_icon },
    -- lualine_f = { function() return vim.api.nvim_eval('FugitiveStatusline()') end },
    -- lualine_i = { 'showcmdlocation' },
  }
}
