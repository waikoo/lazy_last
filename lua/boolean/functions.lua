local M = {}
-- Git commit
M.commit_with_message = function()
  local commit_message = vim.fn.input('Commit message: ')
  vim.cmd('Git commit -m "' .. commit_message .. '"')
end
M.checkTypeScriptErrors = function()
  -- Run TypeScript type-checking
  local tsc = require('tsc')
  local errors = tsc.check()

  -- Check for TypeScript errors
  for _, error in ipairs(errors) do
    -- If an error is found, change the color of the file name in NvimTree
    if error.filename then
      local file_name = error.filename
      local node = vim.fn.nvim_tree_find_node(file_name)
      if node then
        node.highlight = 'Error'
      end
    end
  end
end

M.getInput = function(prompt)
  return vim.api.nvim_call_function('input', { prompt })
end

M.moveOrCopyLines = function(command, targetPosition)
  -- Get the range of selected lines or the current line
  local startLine, endLine = vim.fn.getpos("'<")[2], vim.fn.getpos("'>")[2]
  local currentLine = vim.api.nvim_win_get_cursor(0)[1]
  if startLine == 0 or endLine == 0 then
    startLine = currentLine
    endLine = currentLine
  end

  -- Calculate the target line number based on the target position
  local targetLine
  if targetPosition then
    if targetPosition == "$" then
      targetLine = vim.fn.line("$")
    elseif targetPosition == "0" then
      targetLine = 0
    else
      targetLine = currentLine + tonumber(targetPosition)
    end
  else
    targetLine = currentLine
  end

  -- Construct the ex command to move or copy the lines to the target line
  local exCommand = string.format("%d,%d%s%d", startLine, endLine, command, targetLine)

  -- Execute the ex command silently
  vim.cmd('silent ' .. exCommand)
end

M.renameAcrossWorkspace = function()
  local newName = vim.fn.input('New name -> ')
  local position_params = vim.lsp.util.make_position_params()

  position_params.newName = newName

  vim.lsp.buf_request(0, 'textDocument/rename', position_params, function(err, method, result, ...)
    print(vim.inspect(result))
    print "Renaming..."
    vim.lsp.handlers["textDocument/rename"](err, method, result, ...)
    print "... renaming done!"
  end)
end

-- BitoAi
M.customPrompt = function()
  local input = vim.fn.input('Enter your prompt: ')
  vim.cmd('call BitoAiSelected("' .. input .. '")')
  vim.g.vim_bito_prompt_custom = input
end

M.renameFile = function()
  local current_file = vim.fn.expand('%:p')
  local new_name = vim.fn.input('Enter new name: ')

  require('typescript').renameFile(current_file, new_name)
end

return M
