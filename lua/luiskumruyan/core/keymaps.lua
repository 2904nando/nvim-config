vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x"')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- plugin keymaps
-- Surround whole line in quotes
keymap.set("n", "<leader>sl", "ys$'<leader>")

-- vim maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>")
keymap.set("n", "<leader>ft", "<cmd>Telescope git_status<cr>")

-- Salesforce
keymap.set("n", "<leader>Sr", "<cmd>SfdxRetrieve<CR>")
keymap.set("n", "<leader>Sd", "<cmd>SfdxDeploy<CR>")
keymap.set("n", "<leader>St", "<cmd>SfdxTest<CR>")
keymap.set("n", "<leader>Su", "<cmd>SfdxSetUsername<CR>")
keymap.set("n", "<leader>Sc", "<cmd>SfdxCreateclass<CR>")

-- Tests
keymap.set("n", "<leader>t", "<cmd>TestNearest<CR>")
keymap.set("n", "<leader>T", "<cmd>TestFile<CR>")
keymap.set("n", "<leader>a", "<cmd>TestSuite<CR>")
keymap.set("n", "<leader>l", "<cmd>TestLast<CR>")
keymap.set("n", "<leader>g", "<cmd>TestVisit<CR>")

-- Git
keymap.set("n", "<leader><leader>v", function()
	if next(require("diffview.lib").views) == nil then
		vim.cmd("DiffviewOpen")
	else
		vim.cmd("DiffviewClose")
	end
end)

keymap.set("n", "<leader><leader>e", function()
	if next(require("diffview.lib").views) ~= nil then
		vim.cmd("DiffviewToggleFiles")
	else
		print("No diffview open! Open a diffview first with <leader><leader>v")
	end
end)

keymap.set("n", "<leader><leader>h", function()
	if next(require("diffview.lib").views) == nil then
		vim.cmd("DiffviewFileHistory")
	else
		vim.cmd("DiffviewClose")
	end
end)

-- Bufferline
keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>")
keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>")
keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>")
keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>")
keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>")
keymap.set("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>")
keymap.set("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>")
keymap.set("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>")
keymap.set("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>")
keymap.set("n", "<leader>0", "<cmd>BufferLineGoToBuffer 10<CR>")
keymap.set("n", "<leader>Q", "<cmd>BufferLineCloseOthers<CR>")
keymap.set("n", "<leader>q", ":bd<CR>")
keymap.set("n", "<leader>]", "<cmd>BufferLineCycleNext<CR>")
keymap.set("n", "<leader>[", "<cmd>BufferLineCyclePrev<CR>")

-- Swenv
local function swenv_pick_venv()
	require("swenv.api").pick_venv()
end
keymap.set("n", "<leader>v", swenv_pick_venv)
