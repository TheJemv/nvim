return {
	"akinsho/bufferline.nvim",
	version = "*",
	depedencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				numbers = "ordinal", -- add tabs ordinal numbers
				style_preset = bufferline.style_preset.default, -- default|minimal
				color_icons = true,
				tab_size = 22,
				close_icon = "",
				show_buffer_icons = true,
				show_duplicate_prefix = true, -- show base path if tabs have the same name
				separator_style = "thick", -- slant|slope|thick|thin|{"|", "|"}
				diagnostics = "nvim_lsp", -- nvim lsp diagnostics integration in tabs or false
				indicator = {
					style = "icon", -- icon|underline|none
				},
				offsets = {
					-- avoid to show bufferline on top nvim-tree
					{
						filetype = "NvimTree",
						text = "File Explorer", -- title on top
						highlight = "Directory",
						separator = true, -- true is the default, or set custom
					},
					-- avoid to show bufferline on top saga outline symbols
					{
						filetype = "sagaoutline",
						text = "Symbols", -- title on top
						highlight = "Directory",
						separator = true, -- true is the default, or set custom
					},
				},
				diagnostics_indicator = function(count, level) -- diagnostics format
					return " " .. count
				end,
				-- exclude some buffer and file types
				custom_filter = function(buf_number)
					local buftype = vim.api.nvim_buf_get_option(buf_number, "buftype")
					local filetype = vim.api.nvim_buf_get_option(buf_number, "filetype")

					-- exclude list
					local excluded_filetypes = {
						["terminal"] = true,
						["TelescopePrompt"] = true,
						["NvimTree"] = true,
						["sagaoutline"] = true,
						["sagafinder"] = true,
						["starter"] = true,
					}

					local excluded_buftypes = {
						["nofile"] = true,
						["terminal"] = true,
					}

					return not excluded_buftypes[buftype] and not excluded_filetypes[filetype]
				end,
			},
		})

		vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next Tab" })
		vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous Tab" })

		vim.keymap.set("n", "<C-q>", ":bdelete<CR>", { desc = "Close Buffer" })
	end,
}
