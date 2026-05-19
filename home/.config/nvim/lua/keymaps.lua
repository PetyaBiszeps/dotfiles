local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Files / explorer
map("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
map("n", "<leader>e", "<cmd>Oil --float<CR>", { desc = "Open Oil float" })

-- Diagnostics
map("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show diagnostic" })
map("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Diagnostics list" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

-- Better scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Better search navigation
map("n", "n", "nzzzv", { desc = "Next search result centered" })
map("n", "N", "Nzzzv", { desc = "Previous search result centered" })

-- File actions
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>/", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- System clipboard
map("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("n", "<leader>Y", '"+yy', { desc = "Yank line to system clipboard" })
map("n", "<leader>D", '"+d', { desc = "Delete to system clipboard" })

map("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("v", "<leader>D", '"+d', { desc = "Delete to system clipboard" })
map("v", "<leader>p", '"_dP', { desc = "Paste without replacing register" })

-- Move selected lines
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
