print("-- rtp list: ")
local rtp_list = vim.opt.rtp:get()
local user_rtp_list = {}
for _, path in pairs(rtp_list) do
	if vim.startswith(path, "/home") and not path:match(".*packer.*") then
		table.insert(user_rtp_list, path)
		print(vim.inspect(path))
	end
end
print("-- pack list: ")

local pack_list = vim.opt.packpath:get()
local user_pack_list = {}
for _, path in pairs(pack_list) do
	if vim.startswith(path, "/home") and not path:match(".*packer.*") then
		table.insert(user_pack_list, path)
		print(vim.inspect(path))
	end
end
