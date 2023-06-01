require("user.plugins.plugins")
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/user/plugins", [[v:val =~ '\.lua$']])) do
    if file:gsub("%.lua$", "") ~= "init" and file:gsub("%.lua$", "") ~= "plugin" then
        require("user.plugins." .. file:gsub("%.lua$", ""))
    end
end

require('user.plugins.telescope')
