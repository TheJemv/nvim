return {
   "goolord/alpha-nvim",
   dependencies = {
      "MaximilianLloyd/ascii.nvim",
      "MunifTanjim/nui.nvim",
   },
   config = function()
      local status_ok, alpha = pcall(require, "alpha")
      if not status_ok then
         return
      end

      local dashboard = require("alpha.themes.dashboard")
      local ascii = require("ascii")

      dashboard.section.header.val = ascii.art.planets.planets.saturn_plus

      dashboard.section.buttons.val = {
         dashboard.button("h", "  Recents", ":Telescope oldfiles<CR>"),
         dashboard.button("b", "  Buffers", ":Telescope buffers<CR>"),
         dashboard.button("y", "  Explore", ":NvimTreeToggle<CR>"),
         dashboard.button("/", "  Ripgrep", ":Telescope live_grep<CR>"),
         dashboard.button("v", "  Options", ":e $MYVIMRC<CR>"),
         dashboard.button("P", "󰂖  Plugins", ":Lazy<CR>"),
      }

      local function footer()
         return "Money never sleeps..."
      end

      dashboard.section.footer.val = footer()

      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "Include"
      dashboard.section.buttons.opts.hl = "Keyword"

      dashboard.opts.opts.noautocmd = true

      alpha.setup(dashboard.opts)
   end,
}
