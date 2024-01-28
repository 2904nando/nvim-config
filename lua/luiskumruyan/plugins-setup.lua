local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer()

-- Autocommand to reload neovim after saving this current file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	-- The real G (plugins manager)
	use("wbthomason/packer.nvim")

	-- Lua functions used by many plugins
	use("nvim-lua/plenary.nvim")

	-- Let's enable notifications (yea I know, it's gonna be annoying)
	use("rcarriga/nvim-notify")

	use("bluz71/vim-nightfly-guicolors")
	use("christoomey/vim-tmux-navigator")
	use("szw/vim-maximizer")

	-- Essential plugins
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")

	-- Commenting with gc
	use("numToStr/Comment.nvim")

	-- File Explorer
	use("nvim-tree/nvim-tree.lua")

	-- Icons
	use("kyazdani42/nvim-web-devicons")

	-- Status Line
	use("nvim-lualine/lualine.nvim")

	-- Dependency for Telescope
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- Fuzzy Finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- Managing and installing LSP Servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- Configuring LSP Servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	-- use("jose-elias-alvarez/typescript.nvim") -- Removed as it's deprecated...
	use({
		"pmizio/typescript-tools.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	})
	use("onsails/lspkind.nvim")

	-- Formatting and Linting
	-- use("jose-elias-alvarez/null-ls.nvim")
	-- use("jayp0521/mason-null-ls.nvim")
	use("sbdchd/neoformat")

	-- Auto closing
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- Illuminate
	use("RRethy/vim-illuminate")

	-- Here comes the God above all
	use("github/copilot.vim")

	-- Make it sexy
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Oh here comes the multi cursor magic
	use("mg979/vim-visual-multi")

	-- This one is kinda neat could be used by a lot of stuff
	use("stevearc/dressing.nvim")

	-- Trying to make the fucking python venv work for the fucking venv magics
	use("ahmedkhalf/project.nvim")
	use("AckslD/swenv.nvim")

	-- Git Stuff
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")
	use("sindrets/diffview.nvim")

	-- Quickfix? That would be neat
	use("kevinhwang91/nvim-bqf")

	-- My first plugin
	use("~/Documents/PersonalProjects/salesforce-toolkit.nvim/")

	-- Tests everywhere
	use("vim-test/vim-test")

	use("xiyaowong/transparent.nvim")

	-- Tabies for buffers
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
