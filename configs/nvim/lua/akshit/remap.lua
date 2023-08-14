vim.g.mapleader = " "

-- Windows
vim.keymap.set("n", "<C-l>", "<C-W>l<CR>")
vim.keymap.set("n", "<C-k>", "<C-W>k<CR>")
vim.keymap.set("n", "<C-j>", "<C-W>j<CR>")
vim.keymap.set("n", "<C-h>", "<C-W>h<CR>")
vim.keymap.set("n", "<leader>sv", ":wincmd v<bar> :Ex <bar> :vertical resize 30<CR>")
vim.keymap.set("n", "<leader>sh", ":sp<bar> :Ex <bar> :vertical resize 30<CR>")
vim.keymap.set("n", "<leader>=", "<C-W>=<CR>")
vim.keymap.set("n", "<leader>+", ":vertical resize +10<CR>")
vim.keymap.set("n", "<leader>-", ":vertical resize -10<CR>")

-- Tabs
vim.keymap.set("n", "<S-l>", "gt")
vim.keymap.set("n", "<S-h>", "gT")

-- Buffer
vim.keymap.set("n", "<leader>bs", "<C-^><cr>")
vim.keymap.set("n", "<leader>bd", ":bdelete")
-- vim.keymap.set("n", "<leader>ls", ":ls<CR>:b")

-- Marks
vim.keymap.set("n", "<leader>ms", ":marks<cr>")
vim.keymap.set("n", "<leader>md", ":delm")
vim.keymap.set("n", "<leader>mda", ":delm!<cr>")

--jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- quiuckfix
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>qc", "<cmd>ccl<CR>zz")
vim.keymap.set("n", "<leader>qt", "<cmd>copen<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Insert mode
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")
-- vim.keymap.set("i", "<expr> <C-j>", "pumvisible() ? "\<C-N>" : "j"")
-- vim.keymap.set("i", "<expr> <C-k>", "pumvisible() ? "\<C-P>" : "k"")

-- Visual Mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>p", "\"_dP")
