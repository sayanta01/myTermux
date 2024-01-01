require("user.settings")
require("user.keymaps")

vim.cmd([[ colorscheme habamax ]]) -- lunaperche

local function augroup(name)
	return vim.api.nvim_create_augroup("lazyVim_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank({ higroup = "Search", timeout = 200 })
	end,
})

-- Restore cursor last position
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Disable the concealing in some files
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("concealing_means_hidden"),
	pattern = { "json", "jsonc", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})
