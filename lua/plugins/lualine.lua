local extensions = require("extensions.lualine") -- replace root

return {
   "nvim-lualine/lualine.nvim",
   dependencies = {
      "folke/noice.nvim",
      "nvim-tree/nvim-web-devicons",
   },
   config = function()
      local noice = require("noice")
      local lazy_status = require("lazy.status")

      require("lualine").setup({
         -- Options
         options = {
            theme = "catppuccin",
            globalstatus = true,
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = { "dashboard", "packer", "help" },
            ignore_focus = {},
         },

         -- Sections
         sections = {
            lualine_a = { "progress" }, -- disable vim mode viewer
            lualine_b = {
               {
                  "branch",
                  icon = "", -- disable icon
                  padding = { left = 1, right = 1 },
               },
            },
            lualine_c = {
               -- filetype icon
               {
                  "filetype",
                  icon_only = true,
                  padding = { left = 2, right = 0 },
                  color = "_lualine_c_filetype",
               },
               -- filename
               {
                  "filename",
                  file_status = true, -- display file status (read only, modified)
                  path = 1,           -- 0: just name, 1: relative path, 2: absolute path, 3: absolute path with ~ as home directory
                  symbols = {
                     unnamed = "",
                     readonly = "",
                     modified = "",
                  },
                  padding = { left = 1 },
                  color = { gui = "bold" },
               },
            },
            lualine_x = {
               {
                  lazy_status.updates,
                  cond = lazy_status.has_updates,
               },
               -- number of changes in file
               {
                  "diff",
                  colored = true,
                  padding = { right = 2 },
                  symbols = {
                     added = "+",
                     modified = "|",
                     removed = "-",
                  },
               },
               -- status like @recording
               {
                  noice.api.statusline.mode.get,
                  cond = noice.api.statusline.mode.has,
               },
            },
            lualine_y = {},
            lualine_z = { "location" },
         },

         -- Extensions
         extensions = {
            "nvim-tree",
            "toggleterm",
            "mason",
            "fzf",
            "quickfix",
            "man",
            "lazy",
            -- custom extensions
            extensions.telescope,
            extensions.lspinfo,
            extensions.saga,
            extensions.btw,
         },
      })
   end,
}
