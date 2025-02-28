-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- system
vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'

-- completion
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.pumheight = 10
vim.opt.updatetime = 500

-- searching
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true -- global search & replace by default

-- display
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.showmode = false
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8

-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevelstart = 99
vim.opt.foldtext = ''

-- default indentation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

-- keymaps
local map = function(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true })
end

-- basic navigation
map({ 'n', 'v' }, 'j', 'gj')
map({ 'n', 'v' }, 'k', 'gk')
map({ 'n', 'v' }, '<C-j>', '10gj')
map({ 'n', 'v' }, '<C-k>', '10gk')

-- folds with hjkl
map('n', 'zh', 'zM') -- max fold level
map('n', 'zj', 'zm') -- decrement fold level
map('n', 'zk', 'zr') -- increment fold level
map('n', 'zl', 'zR') -- 'min' fold level

-- pasting in visual mode
map('v', 'p', 'P')

-- config
map('n', '<leader>ce', function() vim.cmd.edit(vim.env.MYVIMRC) end)
map('n', '<leader>cp', function() vim.cmd.edit(vim.fn.stdpath('config') .. '/lua/plugins') end)

-- misc
map('n', '<M-s>', ':write<cr>')
map('i', '<M-s>', '<C-o>:write<cr>')
map('n', '<Esc>', ':nohlsearch<cr>')

--- ui
map('n', '<leader>xd', ':set background=dark<cr>')
map('n', '<leader>xl', ':set background=light<cr>')

-- bootstrap lazy
local lazypath = vim.fn.stdpath('data').. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local repo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', repo, '--branch=stable', lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- plugins
require('lazy').setup({
  spec = 'plugins',
  change_detection = {
    notify = false,
  }
})
