-- Core settings
-- require("luiskumruyan.plugins-setup")
require("plugins-setup")
require("core.options")
require("core.keymaps")
require("core.colorscheme")

-- Plugins

-- vim.notify("Loading plugins...", vim.log.levels.INFO, {
-- 	title = "Nvim Init",
-- })

require("luiskumruyan.plugins.comment")
require("luiskumruyan.plugins.nvim-tree")
require("luiskumruyan.plugins.lualine")
require("luiskumruyan.plugins.telescope")
require("luiskumruyan.plugins.nvim-cmp")
require("luiskumruyan.plugins.lsp.mason")
require("luiskumruyan.plugins.lsp.lspsaga")
require("luiskumruyan.plugins.lsp.lspconfig")
-- require("luiskumruyan.plugins.lsp.null-ls")
require("luiskumruyan.plugins.neoformat")
require("luiskumruyan.plugins.autopairs")
require("luiskumruyan.plugins.treesitter")
require("luiskumruyan.plugins.gitsigns")
require("luiskumruyan.plugins.webdev")
require("luiskumruyan.plugins.alpha")
require("luiskumruyan.plugins.project")
require("luiskumruyan.plugins.swenv")
require("luiskumruyan.plugins.bufferline")

-- vim.notify("Plugins loaded!", vim.log.levels.INFO, {
-- 	title = "Nvim Init",
-- 	icon = "",
-- })

-- Autocommands
require("autocommands")
