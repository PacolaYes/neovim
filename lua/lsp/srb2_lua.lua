local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config('srb2lua_ls', {
  cmd = { 'srb2lua-ls' },

  filetypes = { 'lua' },

  -- Sets the "workspace" to the directory where any of these files is found.
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    ".git",
  },

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
  },

  capabilities = capabilities
})
