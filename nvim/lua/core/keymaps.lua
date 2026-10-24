-- Cambiar tecla Leader
vim.g.mapleader = ' '

-- Navegación entre ventanas
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Navegación "Natural"
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Netrw
vim.keymap.set('n', '<Leader>e', '<Cmd>Ex<CR>')

-- Mini Pick
vim.keymap.set('n', '<Leader>ff', '<Cmd>Pick files<CR>')
vim.keymap.set('n', '<Leader>fb', '<Cmd>Pick buffers<CR>')
vim.keymap.set('n', '<Leader>fh', '<Cmd>Pick help<CR>')
vim.keymap.set('n', '<Leader>fg', '<Cmd>Pick grep_live<CR>')
vim.keymap.set('n', '<Leader>fd', function()
    require('mini.extra').pickers.diagnostic()
end)

-- Mini Completion
vim.keymap.set('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
vim.keymap.set('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local map = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, silent = true })
        end

        map('n', 'gd', vim.lsp.buf.definition)
        map('n', 'gD', vim.lsp.buf.declaration)
        map('n', 'gr', vim.lsp.buf.references)
        map('n', 'gi', vim.lsp.buf.implementation)
        map('n', 'K', vim.lsp.buf.hover)
        map('n', '<Leader>rn', vim.lsp.buf.rename)
        map('n', '<Leader>ca', vim.lsp.buf.code_action)
        map('n', '<Leader>f', function() vim.lsp.buf.format({ async = true }) end)
        map('n', '[d', vim.diagnostic.goto_prev)
        map('n', ']d', vim.diagnostic.goto_next)
        map('n', '<Leader>cd', vim.diagnostic.open_float)
    end,
})

-- Buffers
vim.keymap.set("n", "<S-h>", "<Cmd>bprevious<CR>", { desc = "Buffer anterior" })
vim.keymap.set("n", "<S-l>", "<Cmd>bnext<CR>",     { desc = "Buffer siguiente" })
vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "Cerrar buffer" })


-- Utilidades
vim.keymap.set('n', '<leader>w', '<Cmd>w<CR>', { desc = "Guardar cambios" })
vim.keymap.set('n', '<leader>q', '<Cmd>q<CR>', { desc = "Cerrar ventana" })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = "Mover líneas hacia arriba" } )
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = "Mover líneas hacia abajo" })

-- Markdown Preview
vim.keymap.set('n', '<Leader>mps', '<Cmd>MarkdownPreview<Cr>', { desc = "Markdown: Start preview" })
vim.keymap.set('n', '<Leader>mpS', '<Cmd>MarkdownPreviewStop<Cr>', { desc = "Markdown: Stop preview" })
vim.keymap.set('n', '<Leader>mpr', '<Cmd>MarkdownPreviewRefresh<Cr>', { desc = "Markdown: Refresh preview" })
