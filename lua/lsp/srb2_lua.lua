
local root_markers = {
  ".luarc.json",
  ".luarc.jsonc",
  ".luacheckrc",
  ".stylua.toml",
  ".git",
  ".srb2project"
}

vim.lsp.config('srb2lua_ls', {
  cmd = { 'srb2lua-ls' },

  filetypes = { 'lua' },

  root_dir = function(_, on_dir)
    if not vim.fs.find(".srb2project", {upward = true})[1] then return end

    for _, marker in ipairs(root_markers) do
      local path = vim.fs.find(marker, {upward = true})[1]

      if path then
        on_dir(vim.fs.dirname(path))
  return
      end
    end

    on_dir(vim.fn.getcwd())
  end,

  settings = {
    Lua = {
      runtime = {
        nonstandardSymbol = {
          "//",
          "/**/",
          "!=",
          "continue",
          "!"
        },
        plugin = "/home/pacola/.srb2-vscode/plugins/SRB2-2.2/plugin.lua",
        version = 'Lua 5.4',
      },
      workspace = {
        library = {
          "/home/pacola/.srb2-vscode/plugins/SRB2-2.2/library/srb2.d.lua",
        },
        maxPreload = 10000,
        preloadFileSize = 5000,
      }
    }
  }
})
