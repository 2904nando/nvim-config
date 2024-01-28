local setup, bufferline = pcall(require, "bufferline")
if not setup then
	return
end

bufferline.setup({
	options = {
		numbers = "ordinal",
		separator_style = "slant",
	},
})
