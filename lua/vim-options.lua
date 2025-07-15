-- Configuration
vim.cmd("set expandtab")
vim.cmd("set tabstop=3")
vim.cmd("set softtabstop=3")
vim.cmd("set shiftwidth=3")

vim.g.mapleader = " "
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldenable = true
vim.opt.fillchars:append({ eob = " " })


-- Functions
local function jumpToMatch()
   vim.cmd("normal! %")
end

-- Keymaps
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Guardar archivo" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Salir del archivo" })

-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Mover a la ventana izquierda" })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Mover a la ventana derecha" })
--
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Mover abajo" })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Mover arriba" })

vim.keymap.set("n", "<S-b>", ":vsplit<CR>", { desc = "Split ventana horizintal" })

vim.keymap.set("n", "vf", "za", { desc = "Toggle fold under cursor" })

vim.keymap.set("n", "w", "b", { desc = "Palbara hacia atras (Normal)" })
vim.keymap.set("x", "w", "b", { desc = "Palbara hacia atras (Visual)" })

vim.keymap.set("n", "t", jumpToMatch, { desc = "Ir al final de la linea" })
