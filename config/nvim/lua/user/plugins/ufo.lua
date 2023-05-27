-- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
require('ufo').setup({
	provider_selector = function(bufnr, filetype, buftype)
		return {'treesitter', 'indent'}
	end
})
