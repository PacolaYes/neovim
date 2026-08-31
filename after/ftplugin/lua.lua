
if vim.fn.filereadable(".exrc") != 0
or vim.fn.filereadable(".nvim.lua") != 0 then
  return
end

local set = vim.opt_local

set.shiftwidth = 2
