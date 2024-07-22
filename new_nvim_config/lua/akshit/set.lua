vim.opt.errorbells = false
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.scrolloff=8
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.exrc = true
vim.opt.laststatus=2
vim.opt.linebreak = true

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.termguicolors = true

vim.opt.colorcolumn = "80"
vim.g.mapleader = " "
