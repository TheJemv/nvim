return {
   "nvim-tree/nvim-tree.lua",
   version = "*",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Alternar nvim‑tree" },
   },
   opts = {
      view = { width = 38, side = "left" },
      renderer = {
         root_folder_label = false,
         indent_markers = {
            enable = enable, -- folder level guide
            icons = {
               corner = "└",
               edge = "│",
               item = "│",
               bottom = "─",
               none = " ",
            },
         },

         icons = {
            glyphs = {
               folder = {
                  default = "",
                  open = "",
                  empty = "",
                  empty_open = "",
               },

               git = {
                  unstaged = "",
                  staged = "",
                  unmerged = "",
                  renamed = "➜",
                  untracked = "★",
                  deleted = "",
                  ignored = "◌",
               },
            },
         },
      },

      actions = {
         open_file = {
            quit_on_open = true,
            window_picker = {
               enable = false,
            },
         },
      },
      update_focused_file = {
         enable = true,
         update_root = true,
      },
      filters = {
         dotfiles = true,
      },
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
   },
}
