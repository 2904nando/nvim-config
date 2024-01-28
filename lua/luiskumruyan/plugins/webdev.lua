local setup, webdev = pcall(require, "nvim-web-devicons")
if not setup then
	return
end

webdev.set_icon({
	cls = {
		icon = "󰢎 ",
		color = "#1798c1",
		name = "cls",
	},
	cmp = {
		icon = " ",
		color = "#e34c26",
		name = "cmp",
	},
	page = {
		icon = " ",
		color = "#e34c26",
		name = "page",
	},
	design = {
		icon = " ",
		color = "#e34c26",
		name = "design",
	},
	trigger = {
		icon = "󰢎 ",
		color = "#1798c1",
		name = "trigger",
	},
})
