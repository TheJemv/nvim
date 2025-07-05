return {
   "akinsho/bufferline.nvim",
   version = "*",
   depedencies = {
      "nvim-tree/nvim-web-devicons",
   },

   config = function()
      require("bufferline").setup()

      vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next Tab" })
      vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous Tab" })

      vim.keymap.set("n", "<C-q>", ":bdelete<CR>", { desc = "Close Buffer" })
   end,
}
