local lspconfig = require('lspconfig')

local jsconfig = {}

jsconfig.workspace = {
  folders = {
    ["/media/boolean/HDD1/Projects/kitty/video-timestamps"] = true,
  },
  library = {["/home/boolean/.local/share/nvim/mason/packages/javascript-language-server/libexec/meta/5393ac01"] = true},
}

lspconfig.tsserver.setup({
  settings = jsconfig,
})
