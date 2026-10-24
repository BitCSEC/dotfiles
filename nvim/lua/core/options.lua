-- Configura Enumeración
vim.opt.number = true
vim.opt.relativenumber = true

-- Configura indentacion
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Configura búsqueda por patrón
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- Configura la fuente en Neovide
vim.o.guifont = "Iosevka Nerd Font:h12"

-- Compartir portapapeles
vim.opt.clipboard:append  { "unnamedplus" }

-- Configurar splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Otros
vim.opt.showmode = false
vim.opt.signcolumn = "yes"

-- Vimtex
vim.g.vimtex_syntax_enabled = false
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_latexmk = {
    out_dir = 'build',
}
-- vim.g.vimtex_compiler_latexmk_engines = {
--     _ = '-lualatex'
-- }

-- Configura visual wrapping
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
