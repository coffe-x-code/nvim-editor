vim.opt.number = true
vim.g.mapleader = " " 
-- lazy vim is a package manager

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
require("mason").setup()

vim.lsp.config['lua_ls'] = {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
  filetypes = { 'lua' },
  settings = {Lua = {diagnostics={globals={'vim'}}, runtime = {version = 'LuaJIT'}}}
}
vim.lsp.config['rust_analyzer'] = {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/rust-analyzer" },
  filetypes = { 'rust' },
  root_markers=  {'Cargo.toml', 'rust-project.json' },
}
vim.lsp.enable({'rust_analyzer','lua_ls'})

vim.cmd("colorscheme nightfox")
