for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/user/plugins", [[v:val =~ '\.lua$']])) do
	if file:gsub("%.lua$", "") ~= "init" then
		require("user.plugins." .. file:gsub("%.lua$", ""))
	end
end
