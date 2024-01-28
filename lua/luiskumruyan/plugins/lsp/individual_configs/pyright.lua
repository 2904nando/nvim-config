local util = require("lspconfig.util")

local root_files = {
	"pyproject.toml",
	"setup.py",
	"setup.cfg",
	"requirements.txt",
	"Pipfile",
	"pyrightconfig.json",
	".git",
}

local function organize_imports()
	local params = {
		command = "pyright.organizeimports",
		arguments = { vim.uri_from_bufnr(0) },
	}

	local clients = vim.lsp.get_active_clients({
		bufnr = vim.api.nvim_get_current_buf(),
		name = "pyright",
	})
	for _, client in ipairs(clients) do
		client.request("workspace/executeCommand", params, nil, 0)
	end
end

local function set_python_path(path)
	local clients = vim.lsp.get_active_clients({
		bufnr = vim.api.nvim_get_current_buf(),
		name = "pyright",
	})
	for _, client in ipairs(clients) do
		client.config.settings =
			vim.tbl_deep_extend("force", client.config.settings, { python = { pythonPath = path } })
		client.notify("workspace/didChangeConfiguration", { settings = nil })
	end
end

return {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	single_file_support = true,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "openFilesOnly",
				typeCheckingMode = "off",
			},
		},
	},
}
