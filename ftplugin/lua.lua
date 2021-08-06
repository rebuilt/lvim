-- cargo install stylua
lvim.lang.lua.formatters = {
	{
		exe = "stylua",
		args = {},
	},
}

-- cargo install selene
lvim.lang.lua.linters = {
	{
		exe = "selene",
		args = {},
	},
}
