require("config.lazy")

vim.cmd.colorscheme("bluloco")

require("lsp.srb2_lua")

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local function enableLSP(name)
  vim.lsp.config(name, {
    capabilities = capabilities
  })

  vim.lsp.enable(name)
end

vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using (most
        -- likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Tell the language server how to find Lua modules same way as Neovim
        -- (see `:h lua-module-load`)
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          -- For LSP Settings Type Annotations: https://github.com/neovim/nvim-lspconfig#lsp-settings-type-annotations
          vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
        },
        -- Or pull in all of 'runtimepath'.
        -- NOTE: this is a lot slower and will cause issues when working on
        -- your own configuration.
        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
        -- library = vim.api.nvim_get_runtime_file('', true),
      },
    })
  end,
  settings = {
    Lua = {},
  },
})
enableLSP("lua_ls")

enableLSP("arduino-language-server")
enableLSP("clangd")
enableLSP("basedpyright")
enableLSP("html")
enableLSP("cssls")
enableLSP("eslint")

vim.opt.confirm = true
vim.opt.exrc = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.splitbelow = true
vim.opt.splitright = true

-- set split binds
vim.keymap.set({"n", "t"}, "<C-Left>", "<C-w>h")
vim.keymap.set({"n", "t"}, "<C-Down>", "<C-w>j")
vim.keymap.set({"n", "t"}, "<C-Up>", "<C-w>k")
vim.keymap.set({"n", "t"}, "<C-Right>", "<C-w>l")

vim.keymap.set("n", "<C-S-Down>", "<cmd>split<cr>")
vim.keymap.set("n", "<C-S-Right>", "<cmd>vsplit<cr>")

vim.keymap.set("n", "<M-q>", "<cmd>qa<cr>")
vim.keymap.set("n", "<M-w>", "<cmd>close<cr>")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

-- surround visual stuff :P
-- copied from https://safereddit.com/r/neovim/comments/18x6xk9/introducing_visualsurroundnvim/kg44mdp/?context=3#kg44mdp
local v_chars = {"(", ")", "[", "]", "{", "}", "'", "\""}
for _, char in pairs(v_chars) do
    vim.keymap.set("v", char, "<Plug>(nvim-surround-visual)"..char)
end
