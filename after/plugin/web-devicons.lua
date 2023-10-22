require 'nvim-web-devicons'.setup {
  override = {
    zsh = { icon = "", color = "#428850", cterm_color = "65", name = "Zsh" },
    js = { color = "#f7df1e" },
    css = { color = "blue" },
    html = { color = "red" },
  },
  color_icons = true,
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  -- default = true;
  -- globally enable "strict" selection of icons - icon will be looked up in
  -- different tables, first by filename, and if not found by extension; this
  -- prevents cases when file doesn't have any extension but still gets some icon
  -- because its name happened to match some extension (default to false)
  strict = true,
  -- same as `override` but specifically for overrides by filename
  -- takes effect when `strict` is true
}

require("nvim-web-devicons").set_icon {
  ['css'] = {
    icon = "",
    color = "blue",
    cterm_color = "65",
    name = "css"
  }
}
