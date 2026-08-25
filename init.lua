require("config.lazy")


require("lsp.srb2_lua")

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local function enableLSP(name)
  vim.lsp.config(name, {
    capabilities = capabilities
  })

  vim.lsp.enable(name)
end

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
