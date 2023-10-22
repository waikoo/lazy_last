local lspconfig = require("lspconfig")
local lua_ls_config = {
  settings = {
    Lua = {
      workspace = {
        library = {["/home/boolean/.local/share/nvim/mason/packages/lua-language-server/libexec/meta/5393ac01"] = true},
      }
    }
  }
}

lspconfig.lua_ls.setup(lua_ls_config)
