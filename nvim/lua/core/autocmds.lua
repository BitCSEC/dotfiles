-- Elimina el resaltado después de una búsqueda por patrón 
local search_group = vim.api.nvim_create_augroup("incs-group", { clear = true })
vim.api.nvim_create_autocmd("CmdlineEnter", {
    group = search_group,
    pattern = { "/", "?" },
    callback = function()
        vim.opt.hlsearch = true
    end,
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
    group = search_group,
    pattern = { "/", "?" },
    callback = function()
        vim.opt.hlsearch = false
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function ()
        vim.bo.omnifunc = "vimtex#complete#omnifunc"
    end,
})
