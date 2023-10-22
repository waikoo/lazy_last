-- Set to 1, nvim will open the preview window after entering the markdown buffer
-- default: 0
vim.g.mkdp_auto_start = 1

-- Set to 1, the nvim will auto close the current preview window when changing
-- from the markdown buffer to another buffer
-- default: 1
vim.g.mkdp_auto_close = 1

-- Set to 1, the vim will refresh markdown when saving the buffer or
-- leaving insert mode. Default 0 auto-refreshes markdown as you edit or
-- move the cursor.
-- default: 0
vim.g.mkdp_refresh_slow = 0

-- Set to 1, the MarkdownPreview command can be used for all files,
-- by default, it can be used only in markdown files
-- default: 0
vim.g.mkdp_command_for_global = 0

-- Set to 1, the preview server is available to others on your network
-- by default, the server listens on localhost (127.0.0.1)
-- default: 0
vim.g.mkdp_open_to_the_world = 0

-- Use a custom IP to open the preview page
-- useful when you work in remote vim and preview on a local browser
-- more details see: https://github.com/iamcco/markdown-preview.nvim/pull/9
-- default empty
vim.g.mkdp_open_ip = ''

-- Specify the browser to open the preview page
-- for paths with spaces, use: `/path/with\ space/xxx`
-- default: ''
vim.g.mkdp_browser = ''

-- Set to 1, echo the preview page URL in the command line when opening the preview page
-- default is 0
vim.g.mkdp_echo_preview_url = 0

-- A custom Vim function name to open the preview page
-- this function will receive the URL as a parameter
-- default is empty
vim.g.mkdp_browserfunc = ''

-- Options for markdown render
-- mkit: markdown-it options for render
-- katex: katex options for math
-- uml: markdown-it-plantuml options
-- maid: mermaid options
-- disable_sync_scroll: if disable sync scroll, default 0
-- sync_scroll_type: 'middle', 'top', or 'relative', default value is 'middle'
--   middle: means the cursor position always shows at the middle of the preview page
--   top: means the vim top viewport always shows at the top of the preview page
--   relative: means the cursor position always shows at the relative position of the preview page
-- hide_yaml_meta: if hide yaml metadata, default is 1
-- sequence_diagrams: js-sequence-diagrams options
-- content_editable: if enable content editable for the preview page, default: v:false
-- disable_filename: if disable filename header for the preview page, default: 0
vim.g.mkdp_preview_options = {
    mkit = {},
    katex = {},
    uml = {},
    maid = {},
    disable_sync_scroll = 0,
    sync_scroll_type = 'middle',
    hide_yaml_meta = 1,
    sequence_diagrams = {},
    flowchart_diagrams = {},
    content_editable = false,
    disable_filename = 0,
    toc = {}
}

-- Use a custom markdown style, must be an absolute path
-- like '/Users/username/markdown.css' or vim.fn.expand('~/markdown.css')
vim.g.mkdp_markdown_css = ''

-- Use a custom highlight style, must be an absolute path
-- like '/Users/username/highlight.css' or vim.fn.expand('~/highlight.css')
vim.g.mkdp_highlight_css = ''

-- Use a custom port to start the server or leave it empty for a random port
vim.g.mkdp_port = ''

-- Preview page title
-- ${name} will be replaced with the file name
vim.g.mkdp_page_title = '「${name}」'

-- Recognized filetypes
-- These filetypes will have MarkdownPreview... commands
vim.g.mkdp_filetypes = {'markdown'}

-- Set the default theme (dark or light)
-- By default, the theme is defined according to the preferences of the system
vim.g.mkdp_theme = 'dark'
