local setup, swenv = pcall(require, "swenv")
if not setup then
	return
end

-- Restart the LSP
local function restart_lsp()
	vim.cmd.LspRestart()
	vim.notify("LSP restarted", vim.log.levels.INFO)
end

-- Function to execute after setting the venv
local function on_venv_change()
	vim.notify("Virtual environment changed", vim.log.levels.INFO)
	restart_lsp()
end

swenv.setup({
	post_set_venv = on_venv_change,
})
