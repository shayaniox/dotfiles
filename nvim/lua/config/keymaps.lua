-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<esc>", { noremap = true })

vim.keymap.set("n", "<leader>_", "ddkP", { noremap = true })
vim.keymap.set("n", "<leader>-", "ddkP", { noremap = true })

vim.keymap.set("n", "<leader>-", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>-", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>-", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>-", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>ev", ":rightbelow bsp $MYVIMRC<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>", { noremap = true, silent = true })

vim.keymap.set("i", "<C-U>", "<esc>viwUi", { noremap = true })
vim.keymap.set("n", "<C-U>", "viwU", { noremap = true })

vim.keymap.set("n", "<leader>s;", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", ":e %<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>tp", "G100<C-E>", { noremap = true })

vim.keymap.set("n", "<leader>z", "ZZ", { noremap = true })
vim.keymap.set("n", "<leader>t;", ":rightbelow term<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "}", "5<C-W>>", { noremap = true })
vim.keymap.set("n", "{", "5<C-W><", { noremap = true })
vim.keymap.set("n", "<leader>w=", ":wincmd =", { noremap = true, silent = true })
vim.keymap.set("n", ")", "5<C-W>+", { noremap = true })
vim.keymap.set("n", "(", "5<C-W>-", { noremap = true })

vim.keymap.set("n", "<leader>x", ":%!xxd<CR>", { noremap = true })
vim.keymap.set("n", "<leader>rx", ":%!xxd -r<CR>", { noremap = true })

vim.keymap.set("n", "<leader>/", ":Commentary<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>/", ":'<,'>Commentary<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>;", ":ZenMode<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>cc", ":exec 'cd' . expand('%:p:h')<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>th", ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tl", ":tabprevious<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>ds", ":NoiceDismiss<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>h", "20h", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>j", "20j", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>k", "20k", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>l", "20l", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>tt", ":Neotree focus<CR>", { noremap = true, silent = true })
