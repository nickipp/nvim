require("config.lazy")

vim.opt.number = true -- sets row numbers on left side

vim.opt.tabstop = 4        -- sets the number of spaces for a tab
vim.opt.shiftwidth = 4     -- sets the number of spaces for each (auto)indent
vim.opt.smartindent = true -- auto indents for next level

vim.opt.expandtab = false  -- Use tabs instead of spaces
vim.opt.softtabstop = 0    -- Disable soft tabs so Tab key always inserts a real tab

vim.opt.list = true  -- enables use of characters for whitespaces and tabs
vim.opt.listchars = {
	tab = '» ',      -- Shows tabs as '»' followed by spaces
	trail = '·',     -- Shows trailing spaces as dots
	nbsp = '␣',      -- Shows non-breaking spaces
	space = '·',     -- Shows all spaces as dots (optional)
}

-- detects filetype and enables treesitter for the used filetype, will not do anything if a directory is selected
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("tree-sitter-enable", { clear = true }),
	callback = function(args)
		local lang = vim.treesitter.language.get_lang(args.match)
		if not lang or not vim.treesitter.language.add(lang) then return end

		if vim.treesitter.query.get(lang, "highlights") then vim.treesitter.start(args.buf) end

		if vim.treesitter.query.get(lang, "indents") then
			vim.opt_local.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'
		end

--		if vim.treesitter.query.get(lang, "folds") then
--			vim.opt_local.foldmethod = "expr"
--			vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
--		end
	end,
})