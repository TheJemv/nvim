-- Configuration
vim.cmd("set expandtab")
vim.cmd("set tabstop=3")
vim.cmd("set softtabstop=3")
vim.cmd("set shiftwidth=3")
vim.g.mapleader = " "

-- Keymaps
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Guardar archivo" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Salir del archivo" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Mover a la ventana izquierda" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Mover a la ventana derecha" })

vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Mover abajo" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Mover arriba" })
