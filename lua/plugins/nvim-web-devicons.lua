return {
   "nvim-web-devicons",
   lazy = false,
   config = function()
      require("nvim-web-devicons").setup({
         default = true,
      })
   end,
}
