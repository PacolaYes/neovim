
filename_blacklist = {
  ".exrc",
  ".nvim.lua",
  ".nvimrc",
  ".srb2project"
}

for _, filename in ipairs(filename_blacklist) do
  if vim.fs.find(filename, {upward = true})[1] then
    return
  end
end

local set = vim.opt_local

set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
