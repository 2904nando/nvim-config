local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local typescript_setup, typescript_tools = pcall(require, "typescript-tools")
if not typescript_setup then
	return
end

local keymap = vim.keymap

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- Setting Keybinds
	keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)

	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
	end

	local illuminate_setup, illuminate = pcall(require, "illuminate")
	if not illuminate_setup then
		return
	end
	illuminate.on_attach(client)
end

-- Used to enable Autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

-- HTML
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Typescript
typescript_tools.setup({
	on_attach = on_attach,
})

-- CSS
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Tailwind CSS
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Tailwind CSS
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["graphql"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
})

lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

local apex_jar_path = vim.fn.stdpath("config") .. "/lspserver/" .. "apex-jorje-lsp-2.jar"

lspconfig["apex_ls"].setup({
	cmd = {
		"java",
		"-jar",
		apex_jar_path,
		"apex_language_server",
	},
	-- apex_jar_path = apex_jar_path,
	apex_enable_semantic_errors = false,
	apex_enable_completion_statistics = false,
	filetypes = { "apex", "apexcode" },
	on_attach = on_attach,
	capabilities = capabilities,
})

-- local current_dir = (...):match("(.-)[^%.]+$")
local pyright_individual_setup = require("luiskumruyan.plugins.lsp.individual_configs.pyright")
pyright_individual_setup.on_attach = on_attach
pyright_individual_setup.capabilities = capabilities
lspconfig["pyright"].setup(pyright_individual_setup)
