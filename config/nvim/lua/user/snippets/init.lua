local ls = require("luasnip")
--local types = require("luasnip.util.types")
require("luasnip/loaders/from_vscode").lazy_load()

ls.snippets = { --{{{
	--all = require("user.snippets.all"),
	--go = require("user.snippets.go"),
	--lua = require("user.snippets.lua"),
	--gitcommit = require("user.snippets.gitcommit"),
	markdown = require("user.snippets.markdown"),
} --}}}
