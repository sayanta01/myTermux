local g = vim.g
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true -- convert tabs to spaces

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true
-- opt.smartindent = true -- autoindent new lines

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Info
opt.showmode = false
opt.showcmd = false

-- Clipboard
opt.clipboard = "unnamedplus"

-- Turn off swapfile
opt.swapfile = false

opt.confirm = true
opt.cursorline = true
opt.scrolloff = 6
opt.sidescrolloff = 8
opt.termguicolors = true
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time

-- know this
opt.fileencoding = "utf-8"
opt.writebackup = false -- disable making a backup before overwriting a file
opt.backup = false -- creates a backup file
-- opt.hidden = true -- required to keep multiple buffers and open multiple buffers
opt.undofile = true -- enable persistent undo
opt.updatetime = 180 -- interval for writing swap file to disk, also used by gitsigns
opt.completeopt = { "menu", "menuone", "noselect" }

-- Settings
vim.opt.spelllang:append("cjk") -- Disable spellchecking for asian characters (VIM algorithm does not support it)
vim.opt.shortmess:append("c") -- Don't show redundant messages from ins-completion-menu
opt.whichwrap:append("<,>,[,],h,l")

-- Disable builtin plugins
local disabled_built_ins = {
	"gzip",
	"matchit",
	"tar",
	"tarPlugin",
	"tohtml",
	"tutor",
	"zip",
	"zipPlugin",
	"lazyredraw",
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"logipat",
	"netrwSettings",
	"netrwFileHandlers",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"rplugin",
	"syntax",
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
	"ftplugin",
	"health",
	"man",
}

for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end

-- Disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end
