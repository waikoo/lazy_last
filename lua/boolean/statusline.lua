
local function get_current_mode()
    local mode_name = vim.api.nvim_get_mode().mode
    local mode_map = {
        ['n'] = {'NORMAL', {'#1a1b26', '#787f9b'}},
        ['no'] = {'N·OPER', {'#1a1b26', '#787f9b'}},
        ['v'] = {'VISUAL', {'#FFC0CB', '#1a1b26'}},
        ['V'] = {'V·LINE', {'#FFC0CB', '#1a1b26'}},
        [''] = {'V·BLCK', {'#FFC0CB', '#1a1b26'}},
        ['s'] = {'SELECT', {'#1a1b26', '#787f9b'}},
        ['S'] = {'S·LINE', {'#1a1b26', '#787f9b'}},
        [''] = {'S·BLCK', {'#1a1b26', '#787f9b'}},
        ['i'] = {'INSERT', {'#6B8E23', '#1a1b26'}},
        ['R'] = {'REPLACE', {'#1a1b26', '#d47d4e'}},
        ['Rv'] = {'V·REPL', {'#FFC0CB', '#1a1b26'}},
        ['c'] = {'COMMAND', {'#1a1b26', '#d47d4e'}},
        ['cv'] = {'VIM EX', {'#1a1b26', '#d47d4e'}},
        ['ce'] = {'EX', {'#1a1b26', '#d47d4e'}},
        ['r'] = {'PROMPT', {'#1a1b26', '#d47d4e'}},
        ['rm'] = {'MORE', {'#1a1b26', '#787f9b'}},
        ['r?'] = {'CONFIRM', {'#1a1b26', '#d47d4e'}},
        ['!'] = {'SHELL', {'#1a1b26', '#d47d4e'}},
    }

    local mode_info = mode_map[mode_name] or {'UNKNOWN', {'#1a1b26', '#d47d4e'}}
    local mode_display = mode_info[1]
    local fg_color, bg_color = unpack(mode_info[2])

    local hl_code = '%#'..mode_display..'#'
    local reset_hl = '%*'
    local mode_text = hl_code..' '..mode_display..' '..reset_hl

    return mode_text, fg_color, bg_color
end

local function get_git_branch()
    local handle = io.popen('git branch --show-current 2>/dev/null')
    local branch_name = handle:read('*a'):gsub('%s+', '')
    handle:close()
    return branch_name
end

local function get_filetype()
    local filetype = vim.bo.filetype
    if filetype == '' then
        return ''
    else
        return '[' .. filetype .. ']'
    end
end

local function get_fileformat()
    local fileformat = vim.bo.fileformat
    if fileformat == '' then
        return ''
    else
        return '[' .. fileformat:upper() .. ']'
    end
end

local function get_git_branch()
    local handle = io.popen('git branch --show-current 2>/dev/null')
    local branch_name = handle:read('*a'):gsub('%s+', '')
    handle:close()
    return branch_name
end

local function get_filetype()
    local filetype = vim.bo.filetype
    if filetype == '' then
        return ''
    else
        return '[' .. filetype .. ']'
    end
end

local function get_fileformat()
    local fileformat = vim.bo.fileformat
    if fileformat == '' then
        return ''
    else
        return '[' .. fileformat .. ']'
    end
end

local function get_filename()
    local filename = vim.fn.expand('%:t')
    if filename == '' then
        return '[No Name]'
    else
        return filename
    end
end

local function get_modified()
    if vim.bo.modified then
        return '[+]'
    else
        return ''
    end
end

local function get_readonly()
    if vim.bo.readonly then
        return '[RO]'
    else
        return ''
    end
end

local function statusline()
    local mode = get_current_mode()
    local git_branch = get_git_branch()
    local filetype = get_filetype()
    local fileformat = get_fileformat()
    local filename = get_filename()
    local modified = get_modified()
    local readonly = get_readonly()

    return table.concat({
        mode,
        git_branch,
        filename,
        modified,
        readonly,
        '%=',
        filetype,
        fileformat,
        '%l,%c'
    }, ' ')
end

vim.o.statusline='%!v:lua.statusline()'
_G.statusline = statusline

local function update_statusline_mode_hl()
    local mode_hl_map = {
        ['NORMAL']  = {'StatusLineModeNormal',  {'#1a1b26', '#787f9b'}},
        ['INSERT']  = {'StatusLineModeInsert',  {'#6B8E23', '#1a1b26'}},
        ['VISUAL']  = {'StatusLineModeVisual',  {'#FFC0CB',  '#1a1b26'}},
        ['V·LINE']  = {'StatusLineModeVLine',   {'#FFC0CB',  '#1a1b26'}},
        ['V·BLCK']  = {'StatusLineModeVBlock',  {'#FFC0CB',  '#1a1b26'}},
    }
    local mode_name = get_current_mode()
    local mode_hl_info = mode_hl_map[mode_name]
    if mode_hl_info then
        local hl_group, colors = unpack(mode_hl_info)
        local fg_color, bg_color = unpack(colors)
        vim.cmd('hi! '..hl_group..' guifg='..fg_color..' guibg='..bg_color)
    end
end

local function statusline()
    update_statusline_mode_hl()
    local mode_name = get_current_mode()
    local mode_hl_map = {
        ['NORMAL']  = '%#StatusLineModeNormal#',
        ['INSERT']  = '%#StatusLineModeInsert#',
        ['VISUAL']  = '%#StatusLineModeVisual#',
        ['V·LINE']  = '%#StatusLineModeVLine#',
        ['V·BLCK']  = '%#StatusLineModeVBlock#',
    }
    local mode_hl_code = mode_hl_map[mode_name] or ''
    return table.concat({
      mode_hl_code .. mode_name .. '%*'
      -- ...
    }, ' ')
end

vim.o.statusline='%!v:lua.statusline()'

vim.cmd('augroup StatuslineModeColors')
vim.cmd('autocmd!')
vim.cmd('autocmd WinEnter,BufEnter,VimEnter * lua update_statusline_mode_hl()')
vim.cmd('autocmd InsertEnter * hi StatusLine guibg=green')
vim.cmd('autocmd InsertLeave * lua update_statusline_mode_hl()')
vim.cmd('augroup END')

_G.update_statusline_mode_hl = update_statusline_mode_hl
