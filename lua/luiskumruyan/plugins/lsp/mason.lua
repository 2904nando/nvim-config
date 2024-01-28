local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"apex_ls",
		"bashls",
		"dockerls",
		"eslint",
		"graphql",
		"jsonls",
		"lua_ls",
		"lwc_ls",
		"marksman",
		"jedi_language_server",
		"rust_analyzer",
		"sqlls",
		"terraformls",
		"visualforce_ls",
		"lemminx",
		"hydra_lsp",
		"pyright",
	},
})

mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"eslint_d",
	},
})
