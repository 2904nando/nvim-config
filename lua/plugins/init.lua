return {
	-- Lua functions used by many plugins
	"nvim-lua/plenary.nvim",

	-- Let's enable notifications (yea I know, it's gonna be annoying)
	"rcarriga/nvim-notify",

	"bluz71/vim-nightfly-guicolors",
	"christoomey/vim-tmux-navigator",
	"szw/vim-maximizer",

	-- Essential plugins
	"tpope/vim-surround",
	"vim-scripts/ReplaceWithRegister",

	-- Commenting with gc
	"numToStr/Comment.nvim",

	-- File Explorer
	"nvim-tree/nvim-tree.lua",

	-- Icons
	"kyazdani42/nvim-web-devicons",

	-- Status Line
	"nvim-lualine/lualine.nvim",

	-- Dependency for Telescope
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},

	-- Fuzzy Finding
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = {"nvim-lua/plenary.nvim"} },

	-- Autocompletion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",

	-- Snippets
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	-- Managing and installing LSP Servers
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- Configuring LSP Servers
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	{ "glepnir/lspsaga.nvim", branch = "main", event = 'LspAttach' },
	-- "jose-elias-alvarez/typescript.nvim", -- Removed as it's deprecated...
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	},
	"onsails/lspkind.nvim",

	-- Formatting and Linting
	-- "jose-elias-alvarez/null-ls.nvim",
	-- "jayp0521/mason-null-ls.nvim",
	"sbdchd/neoformat",

	-- Auto closing
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",

	-- Illuminate
	"RRethy/vim-illuminate",

	-- Here comes the God above all
	"github/copilot.vim",

	-- Make it sexy
	{
		"goolord/alpha-nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},

	-- Oh here comes the multi cursor magic
	"mg979/vim-visual-multi",

	-- This one is kinda neat could be used by a lot of stuff
	"stevearc/dressing.nvim",

	-- Trying to make the fucking python venv work for the fucking venv magics
	"ahmedkhalf/project.nvim",
	"AckslD/swenv.nvim",

	-- Git Stuff
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	"sindrets/diffview.nvim",

	-- Quickfix? That would be neat
	"kevinhwang91/nvim-bqf",

	-- My first plugin
	-- "~/Documents/PersonalProjects/salesforce-toolkit.nvim/",

	-- Tests everywhere
	"vim-test/vim-test",

	"xiyaowong/transparent.nvim",

	-- Tabies for buffers
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
}
